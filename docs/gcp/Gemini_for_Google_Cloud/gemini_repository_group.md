## 🛡️ Policy Deployment Engine: `gemini_repository_group`

This section provides a concise policy evaluation for the `gemini_repository_group` resource in GCP.

Reference: [Terraform Registry – gemini_repository_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_repository_group)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `repositories` | Required. List of repositories to group. Structure is [documented below](#nested_repositories). | true | false | Not security-related. | None | None |
| `location` | The location of the Code Repository Index, for example `us-central1`. | true | true | Location determines physical hosting region. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1', 'asia-east1'] |
| `code_repository_index` | Required. Id of the Code Repository Index. | true | false | Not security-related. | None | None |
| `repository_group_id` | Required. Id of the Repository Group. | true | false | Not security-related. | None | None |
| `labels` | Optional. Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Not security-related. | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | Affects resource grouping. Not security-related. | PDE | Anything Else |

### repositories Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource` | Required. The DeveloperConnect repository full resource name, relative resource name or resource URL to be indexed. | true | false | Not security-related. | None | None |
| `branch_pattern` | Required. The Git branch pattern used for indexing in RE2 syntax. See https://github.com/google/re2/wiki/syntax for syntax. | true | false | Not security-related. | None | None |
