## 🛡️ Policy Deployment Engine: `compute_instance_settings`

This section provides a concise policy evaluation for the `compute_instance_settings` resource in GCP.

Reference: [Terraform Registry – compute_instance_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_settings)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `zone` | A reference to the zone where the machine resides. | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### metadata Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `items` | A metadata key/value items map. The total size of all keys and values must be less than 512KB | false | None | None |
