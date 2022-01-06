import gzip
import json
import base64
import requests
import os

slackWebhook = os.getenv('SLACK_WEBHOOK')

def getCloudWatchLog(str):
  payload = json.loads(gzip.decompress(base64.b64decode(str)))
  return payload

def sendToSlack(message):
  return requests.post(slackWebhook, json={'text': message})

def lambda_handler(event, context):
  if "awslogs" in event and "data" in event['awslogs']:
    str = event['awslogs']['data']
    payload = getCloudWatchLog(str)
    print(payload)
    if "logEvents" in payload:
      for logEvent in payload['logEvents']:
        print(sendToSlack(json.dumps(logEvent)))


