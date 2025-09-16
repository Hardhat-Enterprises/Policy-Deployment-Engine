## 🛡️ Policy Deployment Engine: `google_organization_policy`

This section provides a concise policy evaluation for the `google_organization_policy` resource in GCP.

Reference: [Terraform Registry – google_organization_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_organization_policy)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `org_id` |  | false | false | None | None | None |
| `constraint` | - - - | false | false | None | None | None |
| `version` |  | false | false | None | None | None |
| `boolean_policy` | below](#nested_boolean_policy). | false | false | None | None | None |
| `list_policy` |  | false | false | None | None | None |
| `restore_policy` | ~> **Note:** If none of [`boolean_policy`, `list_policy`, `restore_policy`] are defined the policy for a given constraint will effectively be unset. This is represented in the UI as the constraint being 'Inherited'. - - - | false | false | None | None | None |

### boolean_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enforced` |  | false | false | None | None | None |

### list_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `suggested_value` |  | false | false | None | None | None |
| `inherit_from_parent` | are inherited, meaning the values set in this Policy are added to the values inherited up the hierarchy. The `allow` or `deny` blocks support: | false | false | None | None | None |
| `all` |  | false | false | None | None | None |
| `values` |  | false | false | None | None | None |

### restore_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `default` |  | false | false | None | None | None |
