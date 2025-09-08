## 🛡️ Policy Deployment Engine: `service_directory_service`

This section provides a concise policy evaluation for the `service_directory_service` resource in GCP.

Reference: [Terraform Registry – service_directory_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_directory_service)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `namespace` | The resource name of the namespace this service will belong to. | true | None | None |
| `service_id` | The Resource ID must be 1-63 characters long, including digits, lowercase letters or the hyphen character. | true | None | None |
| `metadata` | Metadata for the service. This data can be consumed by service clients. The entire metadata dictionary may contain up to 2000 characters, spread across all key-value pairs. Metadata that goes beyond any these limits will be rejected. | false | None | None |
