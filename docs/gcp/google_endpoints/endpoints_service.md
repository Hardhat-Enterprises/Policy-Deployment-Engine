## 🛡️ Policy Deployment Engine: `endpoints_service`

This section provides a concise policy evaluation for the `endpoints_service` resource in GCP.

Reference: [Terraform Registry – endpoints_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/endpoints_service)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_name` | The name of the Cloud Endpoints service, usually in the format api-name.endpoints.project-id.cloud.goog. | true | true | The service_name defines the Cloud Endpoints service identity. Using an approved Cloud Endpoints domain helps ensure the API is registered under the intended Google-managed endpoint domain and avoids exposing the service through unapproved or unrelated domains. | api.endpoints.my-project-123.cloud.goog | api.example.com |
| `openapi_config` | The OpenAPI specification used to configure the Cloud Endpoints service. | false | true | The OpenAPI configuration controls how the API is exposed. Requiring HTTPS helps protect API traffic from interception, downgrade risks, and insecure transport. | OpenAPI configuration uses HTTPS only. | OpenAPI configuration allows HTTP. |
| `grpc_config` | The gRPC service configuration used to configure the Cloud Endpoints service. | false | true | The gRPC configuration defines how the service is exposed. It should be reviewed to ensure only approved APIs, methods, and service definitions are published. | Approved gRPC service configuration file. | Unreviewed or unauthorized gRPC service configuration file. |
| `protoc_output_base64` | Base64 encoded descriptor output generated from the protocol buffer definition for the gRPC service. | false | true | The protoc_output_base64 value defines the compiled service descriptor for gRPC endpoints. Using an approved descriptor helps ensure only intended services and methods are exposed. | Base64 descriptor generated from an approved protobuf definition. | Base64 descriptor generated from an unapproved or modified protobuf definition. |
| `project` | The Google Cloud project where the Cloud Endpoints service is created. | false | true | The project controls where the Cloud Endpoints service is deployed. Using the correct approved project helps prevent APIs from being created in unauthorized environments. | my-project-123 | unapproved-project |
