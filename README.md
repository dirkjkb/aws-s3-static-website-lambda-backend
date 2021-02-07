# AWS S3 Static Website Hosting
This project is a dummy project to show how to deploy a static website with calls to a Lambda backend. It is deployed 
with [AWS SAM](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/what-is-sam.html).

Info: This project only uses the AWS default URLs and not a custom domain.

## Create & Update
To create or update the stack you just call the [deploy script](./deploy.sh):

```bash
./deploy.sh <CLOUDFORMATION_STACK_NAME> <S3_HOSTING_BUCKET> <SAM_DEPLOYMENT_BUCKET>
```
### Variables:
- `CLOUDFORMATION_STACK_NAME`: The Name of the CloudFormation stack.
- `S3_HOSTING_BUCKET`: The Name of the bucket through witch the static website is hosted.
- `SAM_DEPLOYMENT_BUCKET`:  The Name of the S3 bucket where the CloudFormation template.

## Delete
To delete the CloudFormation stack you call the [delete script](./delete.sh):

```bash
./delete.sh <CLOUDFORMATION_STACK_NAME> <S3_HOSTING_BUCKET>
```
### Variables:
- `CLOUDFORMATION_STACK_NAME`: The Name of the CloudFormation stack.
- `S3_HOSTING_BUCKET`: The Name of the bucket through witch the static website is hosted.
