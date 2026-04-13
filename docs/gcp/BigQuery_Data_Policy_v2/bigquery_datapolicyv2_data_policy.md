## `bigquery_datapolicyv2_data_policy`

This section covers the `bigquery_datapolicyv2_data_policy` resource in GCP.

Reference: [Terraform Registry – bigquery_datapolicyv2_data_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_datapolicyv2_data_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `data_policy_type` | Type of data policy. Possible values: `DATA_MASKING_POLICY`, `RAW_DATA_ACCESS_POLICY`, `COLUMN_LEVEL_SECURITY_POLICY`. | true | true | `RAW_DATA_ACCESS_POLICY` gives direct access to the data. | Set `data_policy_type` to `DATA_MASKING_POLICY` or `COLUMN_LEVEL_SECURITY_POLICY`. | Set `data_policy_type` to `RAW_DATA_ACCESS_POLICY`. |
| `data_policy_id` | User-assigned ID of the data policy that must be unique within the project. | true | false | Identifier only. | None | None |
| `location` | Resource location for the data policy. | true | true | Location can be restricted to approved regions. | Set `location` to an approved region such as `us-central1`. | Set `location` to an unapproved region such as `europe-west1`. |
| `data_masking_policy` | The policy block used to specify a masking rule. | false | true | Masking rules affect how data is shown. | None | None |
| `grantees` | IAM principals with fine-grained access to the underlying data. | false | true | `grantees` controls who can access the data. | Set `grantees` to approved principals only. | Leave `grantees` empty, include `principalSet://goog/public:all`, include `principalSet://goog/cloudIdentityCustomerId/...`, or include direct user principals. |
| `project` | Project ID for the resource. If omitted, the provider project is used. | false | false | Project selector only. | None | None |

### data_masking_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `predefined_expression` | A predefined masking expression. Possible values include `SHA256`, `ALWAYS_NULL`, `DEFAULT_MASKING_VALUE`, `LAST_FOUR_CHARACTERS`, `FIRST_FOUR_CHARACTERS`, `EMAIL_MASK`, `DATE_YEAR_MASK`, `RANDOM_HASH`. | false | true | The masking expression controls how much data is revealed. | Set `predefined_expression` to `SHA256`, `RANDOM_HASH`, `ALWAYS_NULL`, `DEFAULT_MASKING_VALUE`, `EMAIL_MASK`, or `DATE_YEAR_MASK`. | Set `predefined_expression` to a partial reveal value such as `FIRST_FOUR_CHARACTERS`. |
| `routine` | Custom masking routine in the format `projects/{project_number}/datasets/{dataset_id}/routines/{routine_id}`. | false | true | Custom routine can change masking behavior. | None | None |
