from os import environ
from typing import Any

CORS_ALLOW_ORIGIN: str = environ['CORS_ALLOW_ORIGIN']


def handler(event: dict, context: Any) -> dict:
    return {
        'statusCode': 200,
        'headers': {
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Allow-Origin': CORS_ALLOW_ORIGIN,
            'Access-Control-Allow-Methods': 'GET'
        },
        'body': 'Hello from Lambda!'
    }
