#!/bin/bash -e

CLOUDFORMATION_STACK_NAME=$1
S3_HOSTING_BUCKET=$2


aws s3 rm s3://$S3_HOSTING_BUCKET --recursive
aws cloudformation delete-stack --stack-name $CLOUDFORMATION_STACK_NAME

echo "Deletion Successful!!!"