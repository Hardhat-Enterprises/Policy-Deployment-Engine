## 🛡️ Policy Deployment Engine: `scc_folder_scc_big_query_export`

This section provides a concise policy evaluation for the `scc_folder_scc_big_query_export` resource in GCP.

Reference: [Terraform Registry – scc_folder_scc_big_query_export](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_folder_scc_big_query_export)

---

## 1. Argument Reference

### `description`
- Description: (Required) The description of the export (max of 1024 characters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset`
- Description: (Required) The dataset to write findings' updates to. Its format is "projects/[projectId]/datasets/[bigquery_dataset_id]". BigQuery Dataset unique ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Required) Expression that defines the filter to apply across create/update events of findings. The expression is a list of zero or more restrictions combined via logical operators AND and OR. Parentheses are supported, and OR has higher precedence than AND. Restrictions have the form <field> <operator> <value> and may have a - character in front of them to indicate negation. The fields map to those defined in the corresponding resource. The supported operators are: * = for all value types. * >, <, >=, <= for integer values. * :, meaning substring matching, for strings. The supported value types are: * string literals in quotes. * integer literals without quotes. * boolean literals true and false without quotes. See [Filtering notifications](https://cloud.google.com/security-command-center/docs/how-to-api-filter-notifications) for information on how to write a filter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `folder`
- Description: (Required) The folder where Cloud Security Command Center Big Query Export Config lives in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `big_query_export_id`
- Description: (Required) This must be unique within the organization.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
