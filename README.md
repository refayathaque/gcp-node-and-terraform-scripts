# gcp-node-and-terraform-scripts

### Services:

- [Google Cloud Bigtable: Google's NoSQL Big Data database service.](https://cloud.google.com/bigtable/)
  - Akin to AWS DynamoDB
- [Google Cloud Storage: unified object storage for developers and enterprises, from live data serving to data analytics/ML to data archiving.](https://cloud.google.com/storage/)
  - Akin to AWS S3

### IAM:

- [Service accounts](https://cloud.google.com/iam/docs/service-accounts#what_are_service_accounts
  - For example, a Compute Engine VM can run as a service account, and that account can be given permissions to access the resources it needs. This way the service account is the identity of the service, and the service account's permissions control which resources the service can access. A service account is identified by its email address, which is unique to the account.)
    - Akin to AWS Role that you assign to a resource to access other resources, e.g., Lambda to have read-only to S3
