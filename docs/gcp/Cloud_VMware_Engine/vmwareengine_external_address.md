## 🛡️ Policy Deployment Engine: `vmwareengine_external_address`

This section provides a concise policy evaluation for the `vmwareengine_external_address` resource in GCP.

Reference: [Terraform Registry – vmwareengine_external_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_external_address)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `internal_ip` | The internal IP address of a workload VM. | true | None | None |
| `parent` | The resource name of the private cloud to create a new external address in. Resource names are schemeless URIs that follow the conventions in https://cloud.google.com/apis/design/resource_names. For example: projects/my-project/locations/us-west1-a/privateClouds/my-cloud | true | None | None |
| `name` | The ID of the external IP Address. | true | None | None |
| `description` | User-provided description for this resource. | false | None | None |
