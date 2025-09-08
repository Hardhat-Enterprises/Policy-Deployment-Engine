## 🛡️ Policy Deployment Engine: `network_services_authz_extension`

This section provides a concise policy evaluation for the `network_services_authz_extension` resource in GCP.

Reference: [Terraform Registry – network_services_authz_extension](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_authz_extension)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `load_balancing_scheme` | All backend services and forwarding rules referenced by this extension must share the same load balancing scheme. For more information, refer to [Backend services overview](https://cloud.google.com/load-balancing/docs/backend-service). Possible values are: `INTERNAL_MANAGED`, `EXTERNAL_MANAGED`. | true | None | None |
| `authority` | The :authority header in the gRPC request sent from Envoy to the extension service. | true | None | None |
| `service` | The reference to the service that runs the extension. To configure a callout extension, service must be a fully-qualified reference to a [backend service](https://cloud.google.com/compute/docs/reference/rest/v1/backendServices) in the format: https://www.googleapis.com/compute/v1/projects/{project}/regions/{region}/backendServices/{backendService} or https://www.googleapis.com/compute/v1/projects/{project}/global/backendServices/{backendService}. | true | None | None |
| `timeout` | Specifies the timeout for each individual message on the stream. The timeout must be between 10-10000 milliseconds. | true | None | None |
| `name` | Identifier. Name of the AuthzExtension resource. | true | None | None |
| `location` | The location of the resource. | true | None | None |
| `description` | A human-readable description of the resource. | false | None | None |
| `labels` | Set of labels associated with the AuthzExtension resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `fail_open` | Determines how the proxy behaves if the call to the extension fails or times out. When set to TRUE, request or response processing continues without error. Any subsequent extensions in the extension chain are also executed. When set to FALSE or the default setting of FALSE is used, one of the following happens: * If response headers have not been delivered to the downstream client, a generic 500 error is returned to the client. The error response can be tailored by configuring a custom error response in the load balancer. * If response headers have been delivered, then the HTTP stream to the downstream client is reset. | false | None | None |
| `metadata` | The metadata provided here is included as part of the metadata_context (of type google.protobuf.Struct) in the ProcessingRequest message sent to the extension server. The metadata is available under the namespace com.google.authz_extension.<resourceName>. The following variables are supported in the metadata Struct: {forwarding_rule_id} - substituted with the forwarding rule's fully qualified resource name. | false | None | None |
| `forward_headers` | List of the HTTP headers to forward to the extension (from the client). If omitted, all headers are sent. Each element is a string indicating the header name. | false | None | None |
| `wire_format` | The format of communication supported by the callout extension. Will be set to EXT_PROC_GRPC by the backend if no value is set. Possible values are: `WIRE_FORMAT_UNSPECIFIED`, `EXT_PROC_GRPC`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
