## 🛡️ Policy Deployment Engine: `gemini_repository_group`

This section provides a concise policy evaluation for the `gemini_repository_group` resource in GCP.

Reference: [Terraform Registry – gemini_repository_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_repository_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the Code Repository Index, for example `us-central1`. | true | None | None |
| `code_repository_index` | Required. Id of the Code Repository Index. | true | None | None |
| `repository_group_id` | Required. Id of the Repository Group. | true | None | None |
| `labels` | Optional. Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### repositories Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource` | Required. The DeveloperConnect repository full resource name, relative resource name or resource URL to be indexed. | true | None | None |
| `branch_pattern` | Required. The Git branch pattern used for indexing in RE2 syntax. See https://github.com/google/re2/wiki/syntax for syntax. | true | None | None |
