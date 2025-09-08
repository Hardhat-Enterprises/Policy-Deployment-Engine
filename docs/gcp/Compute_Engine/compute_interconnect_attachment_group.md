## 🛡️ Policy Deployment Engine: `compute_interconnect_attachment_group`

This section provides a concise policy evaluation for the `compute_interconnect_attachment_group` resource in GCP.

Reference: [Terraform Registry – compute_interconnect_attachment_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_interconnect_attachment_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `interconnect_group` | The URL of an InterconnectGroup that groups these Attachments' Interconnects. Customers do not need to set this unless directed by Google Support. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### intent Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `availability_sla` | Which SLA the user intends this group to support. Possible values are: `PRODUCTION_NON_CRITICAL`, `PRODUCTION_CRITICAL`, `NO_SLA`, `AVAILABILITY_SLA_UNSPECIFIED`. | false | None | None |

### attachments Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `attachment` |  | false | None | None |
