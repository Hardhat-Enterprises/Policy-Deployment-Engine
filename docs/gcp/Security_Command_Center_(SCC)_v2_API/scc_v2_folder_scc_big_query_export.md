## 🛡️ Policy Deployment Engine: `scc_v2_folder_scc_big_query_export`

This section provides a concise policy evaluation for the `scc_v2_folder_scc_big_query_export` resource in GCP.

Reference: [Terraform Registry – scc_v2_folder_scc_big_query_export](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_v2_folder_scc_big_query_export)

---

## 1. Argument Reference

### `folder`
- Description: (Required) The folder where Cloud Security Command Center Big Query Export Config lives in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `big_query_export_id`
- Description: (Required) This must be unique within the organization.  It must consist of only lowercase letters, numbers, and hyphens, must start with a letter, must end with either a letter or a number, and must be 63 characters or less.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of the notification config (max of 1024 characters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset`
- Description: (Optional) The dataset to write findings' updates to. Its format is "projects/[projectId]/datasets/[bigquery_dataset_id]". BigQuery Dataset unique ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Optional) Expression that defines the filter to apply across create/update events of findings. The expression is a list of zero or more restrictions combined via logical operators AND and OR. Parentheses are supported, and OR has higher precedence than AND. Restrictions have the form <field> <operator> <value> and may have a - character in front of them to indicate negation. The fields map to those defined in the corresponding resource. The supported operators are: * = for all value types. * >, <, >=, <= for integer values. * :, meaning substring matching, for strings. The supported value types are: * string literals in quotes. * integer literals without quotes. * boolean literals true and false without quotes. See [Filtering notifications](https://cloud.google.com/security-command-center/docs/how-to-api-filter-notifications) for information on how to write a filter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The BigQuery export configuration is stored in this location. If not provided, Use global as default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
