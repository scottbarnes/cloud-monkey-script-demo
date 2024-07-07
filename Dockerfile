FROM python:3.12-alpine

RUN apk update && apk add --no-cache curl

WORKDIR /app

# Install CMK (-L is necessary because of redirects)
# See https://github.com/apache/cloudstack-cloudmonkey/releases
# Verifies the checksum based on the time this script was written.
RUN curl -L https://github.com/apache/cloudstack-cloudmonkey/releases/download/6.4.0/cmk.linux.x86-64 -o cmk && \
  echo "8458d4fae5b805845b41479b3a83a384bef72317a08221ce44df8d816bee01ae cmk" | sha256sum -c && \
  chmod +x cmk && \
  mv cmk /app/cmk

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY main.py .
CMD ["python", "main.py"]
