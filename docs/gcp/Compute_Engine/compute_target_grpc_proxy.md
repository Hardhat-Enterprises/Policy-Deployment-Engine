## 🛡️ Policy Deployment Engine: `compute_target_grpc_proxy`

This section provides a concise policy evaluation for the `compute_target_grpc_proxy` resource in GCP.

Reference: [Terraform Registry – compute_target_grpc_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_grpc_proxy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `url_map` | URL to the UrlMap resource that defines the mapping from URL to the BackendService. The protocol field in the BackendService must be set to GRPC. | false | None | None |
| `validate_for_proxyless` | If true, indicates that the BackendServices referenced by the urlMap may be accessed by gRPC applications without using a sidecar proxy. This will enable configuration checks on urlMap and its referenced BackendServices to not allow unsupported features. A gRPC application must use "xds:///" scheme in the target URI of the service it is connecting to. If false, indicates that the BackendServices referenced by the urlMap will be accessed by gRPC applications via a sidecar proxy. In this case, a gRPC application must not use "xds:///" scheme in the target URI of the service it is connecting to | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
