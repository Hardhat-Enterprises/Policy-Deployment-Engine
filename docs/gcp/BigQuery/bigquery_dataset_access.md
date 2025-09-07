## 🛡️ Policy Deployment Engine: `bigquery_dataset_access`

This section provides a concise policy evaluation for the `bigquery_dataset_access` resource in GCP.

Reference: [Terraform Registry – bigquery_dataset_access](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset_access)

---

## 1. Argument Reference

### `dataset_id`
- Description: (Required) A unique ID for this dataset, without the project name. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: (Optional) Describes the rights granted to the user specified by the other member of the access object. Basic, predefined, and custom roles are supported. Predefined roles that have equivalent basic roles are swapped by the API to their basic counterparts, and will show a diff post-create. See [official docs](https://cloud.google.com/bigquery/docs/access-control).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_by_email`
- Description: (Optional) An email address of a user to grant access to. For example: fred@example.com
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_by_email`
- Description: (Optional) An email address of a Google Group to grant access to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain`
- Description: (Optional) A domain to grant access to. Any users signed in with the domain specified will be granted the specified access
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `special_group`
- Description: (Optional) A special group to grant access to. Possible values include:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `iam_member`
- Description: (Optional) Some other type of member that appears in the IAM Policy but isn't a user, group, domain, or special group. For example: `allUsers`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `view`
- Description: (Optional) A view from a different dataset to grant access to. Queries executed against that view will have read access to tables in this dataset. The role field is not required when this field is set. If that view is updated by any user, access to the view needs to be granted again via an update operation. Structure is [documented below](#nested_view).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset`
- Description: (Optional) Grants all resources of particular types in a particular dataset read access to the current dataset. Structure is [documented below](#nested_dataset).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `routine`
- Description: (Optional) A routine from a different dataset to grant access to. Queries executed against that routine will have read access to tables in this dataset. The role field is not required when this field is set. If that routine is updated by any user, access to the routine needs to be granted again via an update operation. Structure is [documented below](#nested_routine).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: (Optional) Condition for the binding. If CEL expression in this field is true, this access binding will be considered. Structure is [documented below](#nested_condition).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_view"></a>The `view` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) The ID of the dataset containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The ID of the project containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Required) The ID of the table. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters. <a name="nested_dataset"></a>The `dataset` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset`
- Description: (Required) The dataset this entry applies to Structure is [documented below](#nested_dataset_dataset).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_types`
- Description: (Required) Which resources in the dataset this entry applies to. Currently, only views are supported, but additional target types may be added in the future. Possible values: VIEWS <a name="nested_dataset_dataset"></a>The `dataset` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) The ID of the dataset containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The ID of the project containing this table. <a name="nested_routine"></a>The `routine` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) The ID of the dataset containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The ID of the project containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `routine_id`
- Description: (Required) The ID of the routine. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 256 characters. <a name="nested_condition"></a>The `condition` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: (Required) Textual representation of an expression in Common Expression Language syntax.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: (Optional) Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) String indicating the location of the expression for error reporting, e.g. a file name and a position in the file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
