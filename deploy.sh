#!/bin/bash -e

CLOUDFORMATION_STACK_NAME=$1
S3_HOSTING_BUCKET=$2
SAM_DEPLOYMENT_BUCKET=$3

VARIABLES_FILE="variables.js"


sam build
SAM_DEPLOYMENT=$(sam deploy --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
    --stack-name "$CLOUDFORMATION_STACK_NAME" \
    --s3-bucket "$SAM_DEPLOYMENT_BUCKET" \
    --template template.yaml \
    --no-fail-on-empty-changeset \
    --parameter-overrides  \
      ParameterKey=S3HostingBucketName,ParameterValue="$S3_HOSTING_BUCKET" \
    )

if [[ $SAM_DEPLOYMENT == *"No changes to deploy"* ]]; then
    echo "Deplyoment is in Current Version"
else
    echo "Deployment is New"

    BUCKET_PATTERN="Bucket\sName\sValue\s"
    BUCKET_NAME=$(echo $SAM_DEPLOYMENT | grep -oP "(?<=$BUCKET_PATTERN)[^ ]*")

    WEBSITE_PATTERN="Website\sURL\sValue\s"
    WEBSITE_URL=$(echo $SAM_DEPLOYMENT | grep -oP "(?<=$WEBSITE_PATTERN)[^ ]*")

    API_PATTERN="REST\sApi\sURL\sValue\s"
    API_URL=$(echo $SAM_DEPLOYMENT | grep -oP "(?<=$API_PATTERN)[^ ]*")

    cd web
    sed -i "s+##URL##+$API_URL+g" $VARIABLES_FILE
    aws s3 cp . s3://$BUCKET_NAME/ --recursive

    echo
    echo
    echo "BUCKET_NAME: $BUCKET_NAME"
    echo "API_URL: $API_URL"
    echo "WEBSITE_URL: $WEBSITE_URL"
fi
