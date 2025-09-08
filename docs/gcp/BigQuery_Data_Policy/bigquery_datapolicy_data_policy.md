## 🛡️ Policy Deployment Engine: `bigquery_datapolicy_data_policy`

This section provides a concise policy evaluation for the `bigquery_datapolicy_data_policy` resource in GCP.

Reference: [Terraform Registry – bigquery_datapolicy_data_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_datapolicy_data_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `data_policy_id` | User-assigned (human readable) ID of the data policy that needs to be unique within a project. Used as {dataPolicyId} in part of the resource name. | true | None | None |
| `location` | The name of the location of the data policy. | true | None | None |
| `policy_tag` | Policy tag resource name, in the format of projects/{project_number}/locations/{locationId}/taxonomies/{taxonomyId}/policyTags/{policyTag_id}. | true | None | None |
| `data_policy_type` | The enrollment level of the service. Possible values are: `COLUMN_LEVEL_SECURITY_POLICY`, `DATA_MASKING_POLICY`. | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### data_masking_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `predefined_expression` | The available masking rules. Learn more here: https://cloud.google.com/bigquery/docs/column-data-masking-intro#masking_options. Possible values are: `SHA256`, `ALWAYS_NULL`, `DEFAULT_MASKING_VALUE`, `LAST_FOUR_CHARACTERS`, `FIRST_FOUR_CHARACTERS`, `EMAIL_MASK`, `DATE_YEAR_MASK`. | false | None | None |
| `routine` | The name of the BigQuery routine that contains the custom masking routine, in the format of projects/{projectNumber}/datasets/{dataset_id}/routines/{routine_id}. | false | None | None |
