## 🛡️ Policy Deployment Engine: `iam_projects_policy_binding`

This section provides a concise policy evaluation for the `iam_projects_policy_binding` resource in GCP.

Reference: [Terraform Registry – iam_projects_policy_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_projects_policy_binding)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `policy` | Required. Immutable. The resource name of the policy to be bound. The binding parent and policy must belong to the same Organization (or Project). | true | None | None |
| `location` | The location of the Policy Binding | true | None | None |
| `policy_binding_id` | The Policy Binding ID. | true | None | None |
| `display_name` | Optional. The description of the policy binding. Must be less than or equal to 63 characters. | false | None | None |
| `annotations` | Optional. User defined annotations. See https://google.aip.dev/148#annotations for more details such as format and size limitations **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `policy_kind` | Immutable. The kind of the policy to attach in this binding. This field must be one of the following:  - Left empty (will be automatically set to the policy kind) - The input policy kind   Possible values:  POLICY_KIND_UNSPECIFIED PRINCIPAL_ACCESS_BOUNDARY ACCESS | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### target Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `principal_set` | Required. Immutable. Full Resource Name of the principal set used for principal access boundary policy bindings. Examples for each one of the following supported principal set types: * Project: * `//cloudresourcemanager.googleapis.com/projects/PROJECT_NUMBER` * `//cloudresourcemanager.googleapis.com/projects/PROJECT_ID` * Workload Identity Pool: `//iam.googleapis.com/projects/PROJECT_NUMBER/locations/LOCATION/workloadIdentityPools/WORKLOAD_POOL_ID` It must be parent by the policy binding's parent (the project). | false | None | None |

### condition Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | false | None | None |
| `title` | Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | None | None |
| `description` | Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | None | None |
| `location` | Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | None | None |
