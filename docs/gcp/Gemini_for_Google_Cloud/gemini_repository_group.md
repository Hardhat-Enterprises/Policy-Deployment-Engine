## 🛡️ Policy Deployment Engine: `gemini_repository_group`

This section provides a concise policy evaluation for the `gemini_repository_group` resource in GCP.

Reference: [Terraform Registry – gemini_repository_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_repository_group)

---

## 1. Argument Reference

### `repositories`
- Description: (Required) Required. List of repositories to group. Structure is [documented below](#nested_repositories).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the Code Repository Index, for example `us-central1`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `code_repository_index`
- Description: (Required) Required. Id of the Code Repository Index.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository_group_id`
- Description: (Required) Required. Id of the Repository Group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_repositories"></a>The `repositories` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource`
- Description: (Required) Required. The DeveloperConnect repository full resource name, relative resource name or resource URL to be indexed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `branch_pattern`
- Description: (Required) Required. The Git branch pattern used for indexing in RE2 syntax. See https://github.com/google/re2/wiki/syntax for syntax.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
