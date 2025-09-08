## 🛡️ Policy Deployment Engine: `google_organization_policy`

This section provides a concise policy evaluation for the `google_organization_policy` resource in GCP.

Reference: [Terraform Registry – google_organization_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_organization_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `org_id` |  | none | None | None |
| `constraint` | - - - | none | None | None |
| `version` |  | none | None | None |

### boolean_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enforced` |  | none | None | None |

### list_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `suggested_value` |  | none | None | None |
| `inherit_from_parent` | are inherited, meaning the values set in this Policy are added to the values inherited up the hierarchy. The `allow` or `deny` blocks support: | none | None | None |
| `all` |  | none | None | None |
| `values` |  | none | None | None |

### restore_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `default` |  | none | None | None |
