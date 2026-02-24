# Static Site Infrastructure using Terraform + GitHub Actions
1. Infra to be created manually: S3 bucket for storing the state files, which will act as a remote backend. DynamoDb table required for state locking.
2. Things to be configured: > Store AWS USER access key and secret  key in Github secrets for deploying the infra through Terraform.
                            > Workflow files need to be updated with name of the state bucket you are creating and also the dynamodb table.
                            > Inputs to be given: Bucket Name and IAM user name.
3. The s3 bucket will have a default index.html file uploaded for testing purposes which will echo "Hello From Terraform"
4. IAM user can be used to push site files to s3 bucket.
   
