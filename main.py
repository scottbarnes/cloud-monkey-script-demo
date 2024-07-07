"""
Script to do whatever.
"""

import json
import subprocess

from typing import Final


BOOK_URL: Final = "https://openlibrary.org/books/OL37044775M.json"


def get_cloudmonkey_output() -> dict:
    """
    Use curl to fetch JSON from an Open Library book.

    Note this would usually be done with requests, but it demonostrates reading some JSON from STDOUT.
    """
    cmd = ["curl", BOOK_URL]
    # `text=True` makes it so you don't get bytes back.
    result = subprocess.run(cmd, capture_output=True, text=True)
    json_dict = json.loads(result.stdout)
    return json_dict
    

def main() -> None:
    """
    The main entry point for the program.
    """
    result = get_cloudmonkey_output()
    print(f"{result = }")
    print(f"{result["authors"] = }")


if __name__ == "__main__":
    main()
