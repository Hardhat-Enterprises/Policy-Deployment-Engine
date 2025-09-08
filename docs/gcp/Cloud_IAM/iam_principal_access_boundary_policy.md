## 🛡️ Policy Deployment Engine: `iam_principal_access_boundary_policy`

This section provides a concise policy evaluation for the `iam_principal_access_boundary_policy` resource in GCP.

Reference: [Terraform Registry – iam_principal_access_boundary_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_principal_access_boundary_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `organization` | The parent organization of the principal access boundary policy. | true | None | None |
| `location` | The location the principal access boundary policy is in. | true | None | None |
| `principal_access_boundary_policy_id` | The ID to use to create the principal access boundary policy. This value must start with a lowercase letter followed by up to 62 lowercase letters, numbers, hyphens, or dots. Pattern, /a-z{2,62}/. | true | None | None |
| `display_name` | The description of the principal access boundary policy. Must be less than or equal to 63 characters. | false | None | None |
| `annotations` | User defined annotations. See https://google.aip.dev/148#annotations for more details such as format and size limitations **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |

### details Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `rules` | A list of principal access boundary policy rules. The number of rules in a policy is limited to 500. Structure is [documented below](#nested_details_rules). | true | None | None |
| `enforcement_version` | The version number that indicates which Google Cloud services are included in the enforcement (e.g. \"latest\", \"1\", ...). If empty, the PAB policy version will be set to the current latest version, and this version won't get updated when new versions are released. | false | None | None |

### rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | The description of the principal access boundary policy rule. Must be less than or equal to 256 characters. | false | None | None |
| `resources` | A list of Cloud Resource Manager resources. The resource and all the descendants are included. The number of resources in a policy is limited to 500 across all rules. The following resource types are supported: * Organizations, such as `//cloudresourcemanager.googleapis.com/organizations/123`. * Folders, such as `//cloudresourcemanager.googleapis.com/folders/123`. * Projects, such as `//cloudresourcemanager.googleapis.com/projects/123` or `//cloudresourcemanager.googleapis.com/projects/my-project-id`. | true | None | None |
| `effect` | The access relationship of principals to the resources in this rule. Possible values: ALLOW | true | None | None |
