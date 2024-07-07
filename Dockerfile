FROM python:3.12-alpine

RUN apk update && apk add --no-cache curl git make gcc musl-dev go

WORKDIR /app

RUN git clone https://github.com/apache/cloudstack-cloudmonkey.git && \
    cd cloudstack-cloudmonkey && \
    make && \
    mv bin/cmk /app/cmk

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY main.py .
CMD ["python", "main.py"]
