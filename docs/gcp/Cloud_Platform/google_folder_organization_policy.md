## 🛡️ Policy Deployment Engine: `google_folder_organization_policy`

This section provides a concise policy evaluation for the `google_folder_organization_policy` resource in GCP.

Reference: [Terraform Registry – google_folder_organization_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_folder_organization_policy)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `folder` | The resource name of the folder to set the policy for. Its format is folders/{folder_id}. | true | false | identifier only, no security impact | None | None |
| `constraint` | The name of the constraint the policy enforces, e.g. compute.disableSerialPortAccess or serviceuser.services. | true | true | Specify which services or settings are restricted. Misconfiguration could lead to harmful activity | constraint = "compute.disableSerialPortAccess" | constraint = "" |
| `version` | Version of the Policy. Default version is 0. | false | false | Only version field, so no direct security effect | None | None |
| `boolean_policy` | A boolean policy is a constraint that is either enforced or not. | false | true | If not enforced, risky features (e.g. serial port access) may be enabled. | None | None |
| `list_policy` | can also be used to allow or deny all values. Structure is [documented below](#nested_list_policy). | false | true | Limits vulnerable services or environments. Insufficient policies could permit risky defaults. | None | None |
| `restore_policy` | ~> **Note:** If none of [`boolean_policy`, `list_policy`, `restore_policy`] are defined the policy for a given constraint will effectively be unset. This is represented in the UI as the constraint being 'Inherited'. - - - | false | true | Restoring defaults can weaken protections. | None | None |

### boolean_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enforced` | If true, then the Policy is enforced. If false, then any configuration is acceptable. | true | true | Enforcement ensures mandatory restrictions are applied. | enforced = true | enforced = false |

### list_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `suggested_value` | The Google Cloud Console will try to default to a configuration that matches the value specified in this field. | false | false | Console-only suggestion, it does not enforce or weaken security. | None | None |
| `inherit_from_parent` | are inherited, meaning the values set in this Policy are added to the values inherited up the hierarchy. The `allow` or `deny` blocks support: | false | true | Inheritance can introduce unwanted risks from higher-level policies. | inherit_from_parent = false | inherit_from_parent = true |
| `all` | The policy allows or denies all values. | false | true | Allowing all may overexpose resources if not restricted properly. | all = false | all = true  # if it bypasses restrictions |
| `values` | The policy can define specific values that are allowed or denied. | false | true | Improper values may allow risky APIs or services. | deny.values = ["cloudresourcemanager.googleapis.com"] | allow.values = ["cloudresourcemanager.googleapis.com"] |

### restore_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `default` | May only be set to true. If set, then the default Policy is restored. | true | false | Restoring default removes explicit protections. | default = false | default = true |
