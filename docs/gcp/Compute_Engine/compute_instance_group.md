## 🛡️ Policy Deployment Engine: `compute_instance_group`

This section provides a concise policy evaluation for the `compute_instance_group` resource in GCP.

Reference: [Terraform Registry – compute_instance_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | characters long and comply with [RFC1035](https://www.ietf.org/rfc/rfc1035.txt). Supported characters include lowercase letters, numbers, and hyphens. | none | None | None |
| `zone` | - - - | none | None | None |
| `description` | group. | none | None | None |
| `instances` | When adding instances they must all be in the same network and zone as the instance group. | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
| `network` | this is different from the network where the instances are in, the creation fails. Defaults to the network where the instances are in (if neither `network` nor `instances` is specified, this field will be blank). | none | None | None |

### named_port Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `port` |  | none | None | None |
