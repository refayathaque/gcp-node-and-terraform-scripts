# gcp-node-and-terraform-scripts

### Overview of services:

- [Nodejs API docs for all services](https://github.com/googleapis/google-cloud-node)
- [Google Cloud Bigtable: Google's NoSQL Big Data database service.](https://cloud.google.com/bigtable/)
  - Akin to AWS DynamoDB
- [Google Cloud Storage: unified object storage for developers and enterprises, from live data serving to data analytics/ML to data archiving.](https://cloud.google.com/storage/)
  - Akin to AWS S3
- [Google Cloud Run: Develop and deploy highly scalable containerized applications on a fully managed serverless platform.](https://cloud.google.com/run)
  - Akin to AWS ECS
  - [Docs](https://cloud.google.com/run/docs) - Cloud Run is a managed compute platform that enables you to run containers that are invocable via requests or events. Cloud Run is serverless: it abstracts away all infrastructure management, so you can focus on what matters most — building great applications.
  - Container images live in [Artifact Registry](https://cloud.google.com/artifact-registry) and [Container Registry](https://cloud.google.com/container-registry/docs)
    - Container Registry is a service for storing _private_ container images. It provides a subset of features provided by Artifact Registry
- [Google Pub/Sub: Pub/Sub enables you to create systems of event producers and consumers, called publishers and subscribers. Publishers communicate with subscribers asynchronously by broadcasting events](https://cloud.google.com/pubsub/docs/overview)

### _[Regions](https://cloud.google.com/storage/docs/locations#available-locations)_

### Housekeeping

- [Setting up gcloud defaults](https://cloud.google.com/run/docs/tutorials/pubsub#setting-up-gcloud)

### Google Cloud Storage

### Google Cloud Bigtable

- [Node.js API docs](https://github.com/googleapis/nodejs-bigtable)

### IAM:

- [Service accounts](https://cloud.google.com/iam/docs/service-accounts#what_are_service_accounts
  - For example, a Compute Engine VM can run as a service account, and that account can be given permissions to access the resources it needs. This way the service account is the identity of the service, and the service account's permissions control which resources the service can access. A service account is identified by its email address, which is unique to the account.)
    - Akin to AWS Role that you assign to a resource to access other resources, e.g., Lambda to have read-only to S3
- A **member** can be a Google Account (for end users), a service account (for apps and virtual machines), a Google group, or a Google Workspace or Cloud Identity domain that can access a resource. The identity of a member is an email address associated with a user, service account, or Google group; or a domain name associated with Google Workspace or Cloud Identity domains.
- A **role** is a collection of permissions. Permissions determine what operations are allowed on a resource. When you grant a role to a member, you grant all the permissions that the role contains.
- The IAM **policy** is a collection of role bindings that **bind one or more members to individual roles**. When you want to define who (member) has what type of access (role) on a resource, you create a policy and attach it to the resource.
  - Akin to AWS IAM Groups
  - `gcloud run services add-iam-policy-binding pubsub-tutorial \ --member=serviceAccount:cloud-run-pubsub-invoker@PROJECT_ID.iam.gserviceaccount.com \ --role=roles/run.invoker`
  - ^ Give the invoker service account permission to invoke your pubsub-tutorial service:

### Cloud Run:

- [Terraform docs](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service)
- [Trigger Cloud Run with events from more than 60 Google Cloud sources](https://cloud.google.com/blog/products/serverless/build-event-driven-applications-in-cloud-run)
- What is a [microservice](https://www.redhat.com/en/topics/microservices/what-are-microservices)?
  - Microservices are an architectural approach to building applications. As an architectural framework, microservices are distributed and loosely coupled, so one team’s changes won’t break the entire app. The benefit to using microservices is that development teams are able to rapidly build new components of apps to meet changing business needs.
  - Each function is called a service, and can be built and deployed independently, meaning individual services can function (and fail) without negatively affecting the others.
  - So, a microservice is a core function of an application and it runs independent of other services
- Cloud Run takes any container images and pairs great with the container ecosystem: Cloud Build, Artifact Registry, Docker.
- Cloud Run automatically and horizontally scales out your container image to handle the received requests, then scales in when demand decreases. You only pay for the CPU, memory, and networking consumed during request handling.
- [Guide to building and deploying a basic Node.js service](https://cloud.google.com/run/docs/quickstarts/build-and-deploy/nodejs)
- Shipping code consists of three steps: building a container image with Cloud Build, uploading the container image to _Container Registry_, and deploying the container image to Cloud Run.
  - `gcloud builds submit --tag gcr.io/PROJECT_ID/pubsub`
    - Builds the container image and stores in Repository named `pubsub`
  - `gcloud run deploy pubsub-tutorial --image gcr.io/PROJECT_ID/pubsub`
    - `../pubsub` is the container image repository name, and `pubsub-tutorial` is the name of the Cloud Run **service**

### Artifact Registry:

- [Node.js API docs](https://github.com/googleapis/nodejs-artifact-registry)

### Google Pub/Sub

- [Node.js API docs](https://github.com/googleapis/nodejs-pubsub)
- [Guide to using Pub/Sub with Cloud Run](https://cloud.google.com/run/docs/tutorials/pubsub)

## Non-GCP things

### [Proxy server](https://www.strongdm.com/blog/difference-between-proxy-and-reverse-proxy)

- A proxy server, sometimes referred to as a forward proxy, is a server that routes traffic between client(s) and another system, usually external to the network. By doing so, it can regulate traffic according to preset policies, convert and mask client IP addresses, enforce security protocols, and block unknown traffic.
- Systems with shared networks, such as business organizations or data centers, often use proxy servers. Proxy servers expose a single interface with which clients interact without having to enforce all of the policies and route management logic within the clients themselves.

### [Reverse proxy](https://www.strongdm.com/blog/difference-between-proxy-and-reverse-proxy)

- A reverse proxy is a type of proxy server. Unlike a traditional proxy server, which is used to protect clients, a reverse proxy is used to protect servers. A reverse proxy is a server that accepts a request from a client, forwards the request to another one of many other servers, and returns the results from the server that actually processed the request to the client as if the proxy server had processed the request itself. The client only communicates directly with the reverse proxy server and it does not know that some other server actually processed its request.
- A reverse proxy effectively serves as a gateway between clients, users, and application servers. It handles all the access policy management and traffic routing, and it protects the identity of the server that actually processes the request.
