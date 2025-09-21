## 🛡️ Policy Deployment Engine: `bigquery_datapolicy_data_policy`

This section provides a concise policy evaluation for the `bigquery_datapolicy_data_policy` resource in GCP.

Reference: [Terraform Registry – bigquery_datapolicy_data_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_datapolicy_data_policy)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `data_policy_id` | User-assigned (human readable) ID of the data policy that needs to be unique within a project. Used as {dataPolicyId} in part of the resource name. | false | false | Display policy id has no impact on the security of the resource. | None | None |
| `location` | The name of the location of the data policy. | true | false | Ensure the location must be configured to correct location | Set location to Australia. | Other locations are not valid. |
| `policy_tag` | Policy tag resource name, in the format of projects/{project_number}/locations/{locationId}/taxonomies/{taxonomyId}/policyTags/{policyTag_id}. | false | false | Display policy id has no impact on the security of the resource. | None | None |
| `data_policy_type` | The enrollment level of the service. Possible values are: `COLUMN_LEVEL_SECURITY_POLICY`, `DATA_MASKING_POLICY`. | true | false | Ensure data policy type is setting to COLUMN_LEVEL_SECURITY_POLICY because it consists of role-based security. | Set data_policy_type to COLUMN_LEVEL_SECURITY_POLICY. | Other data policy types are invalidated. |
| `data_masking_policy` | The data masking policy that specifies the data masking rule to use. Structure is [documented below](#nested_data_masking_policy). | true | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Display policy id has no impact on the security of the resource. | None | None |

### data_masking_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `predefined_expression` | The available masking rules. Learn more here: https://cloud.google.com/bigquery/docs/column-data-masking-intro#masking_options. Possible values are: `SHA256`, `ALWAYS_NULL`, `DEFAULT_MASKING_VALUE`, `LAST_FOUR_CHARACTERS`, `FIRST_FOUR_CHARACTERS`, `EMAIL_MASK`, `DATE_YEAR_MASK`. | true | false | Ensure predefined expression is setting to SHA256 because it will be  | Set predefined_expression to SHA256 | Other predefined expressions are invalidated |
| `routine` | The name of the BigQuery routine that contains the custom masking routine, in the format of projects/{projectNumber}/datasets/{dataset_id}/routines/{routine_id}. | false | false | None | None | None |
