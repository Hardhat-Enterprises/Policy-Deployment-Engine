## 🛡️ Policy Deployment Engine: `bigquery_datapolicy_data_policy`

This section provides a concise policy evaluation for the `bigquery_datapolicy_data_policy` resource in GCP.

Reference: [Terraform Registry – bigquery_datapolicy_data_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_datapolicy_data_policy)

---

## 1. Argument Reference

### `data_policy_id`
- Description: (Required) User-assigned (human readable) ID of the data policy that needs to be unique within a project. Used as {dataPolicyId} in part of the resource name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The name of the location of the data policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_tag`
- Description: (Required) Policy tag resource name, in the format of projects/{project_number}/locations/{locationId}/taxonomies/{taxonomyId}/policyTags/{policyTag_id}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_policy_type`
- Description: (Required) The enrollment level of the service. Possible values are: `COLUMN_LEVEL_SECURITY_POLICY`, `DATA_MASKING_POLICY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_masking_policy`
- Description: (Optional) The data masking policy that specifies the data masking rule to use. Structure is [documented below](#nested_data_masking_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_data_masking_policy"></a>The `data_masking_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `predefined_expression`
- Description: (Optional) The available masking rules. Learn more here: https://cloud.google.com/bigquery/docs/column-data-masking-intro#masking_options. Possible values are: `SHA256`, `ALWAYS_NULL`, `DEFAULT_MASKING_VALUE`, `LAST_FOUR_CHARACTERS`, `FIRST_FOUR_CHARACTERS`, `EMAIL_MASK`, `DATE_YEAR_MASK`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `routine`
- Description: (Optional) The name of the BigQuery routine that contains the custom masking routine, in the format of projects/{projectNumber}/datasets/{dataset_id}/routines/{routine_id}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
