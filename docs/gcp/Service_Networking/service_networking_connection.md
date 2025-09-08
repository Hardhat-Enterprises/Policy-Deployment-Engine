## 🛡️ Policy Deployment Engine: `service_networking_connection`

This section provides a concise policy evaluation for the `service_networking_connection` resource in GCP.

Reference: [Terraform Registry – service_networking_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` |  | none | None | None |
| `service` | service provider organization. For Google services that support this functionality it is 'servicenetworking.googleapis.com'. | none | None | None |
| `reserved_peering_ranges` | this service provider. Note that invoking this method with a different range when connection is already established will not reallocate already provisioned service producer subnetworks. | none | None | None |
| `deletion_policy` |  | none | None | None |
| `update_on_creation_fail` |  | none | None | None |
