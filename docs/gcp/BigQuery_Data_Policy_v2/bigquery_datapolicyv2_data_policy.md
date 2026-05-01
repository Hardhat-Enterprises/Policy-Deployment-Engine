## `bigquery_datapolicyv2_data_policy`

This section covers the `bigquery_datapolicyv2_data_policy` resource in GCP.

Reference: [Terraform Registry – bigquery_datapolicyv2_data_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_datapolicyv2_data_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `data_policy_type` | Type of data policy. Possible values: `DATA_MASKING_POLICY`, `RAW_DATA_ACCESS_POLICY`, `COLUMN_LEVEL_SECURITY_POLICY`. | true | true | `RAW_DATA_ACCESS_POLICY` gives direct access to the data. | `DATA_MASKING_POLICY` | `RAW_DATA_ACCESS_POLICY` |
| `data_policy_id` | User-assigned ID of the data policy that must be unique within the project. | true | false | Identifier only. | None | None |
| `location` | Resource location for the data policy. | true | true | Location can be restricted to approved regions. | `australia-southeast1` | `europe-west1` |
| `data_masking_policy` | The policy block used to specify a masking rule. | false | true | Masking rules affect how data is shown. | `{ predefined_expression = "SHA256" }` | `{ predefined_expression = "FIRST_FOUR_CHARACTERS" }` |
| `grantees` | IAM principals with fine-grained access to the underlying data. | false | true | `grantees` controls who can access the data. | `["principal://iam.googleapis.com/projects/-/serviceAccounts/data-reader@pde.iam.gserviceaccount.com"]` | `["principalSet://goog/public:all"]`, `[]`, `["principalSet://goog/cloudIdentityCustomerId/C0123456789"]`, `["principal://iam.googleapis.com/users/alice@example.com"]` |
| `project` | Project ID for the resource. If omitted, the provider project is used. | false | false | Project selector only. | None | None |

### data_masking_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `predefined_expression` | A predefined masking expression. Possible values include `SHA256`, `ALWAYS_NULL`, `DEFAULT_MASKING_VALUE`, `LAST_FOUR_CHARACTERS`, `FIRST_FOUR_CHARACTERS`, `EMAIL_MASK`, `DATE_YEAR_MASK`, `RANDOM_HASH`. | false | true | The masking expression controls how much data is revealed. | `SHA256` | `FIRST_FOUR_CHARACTERS` |
| `routine` | Custom masking routine in the format `projects/{project_number}/datasets/{dataset_id}/routines/{routine_id}`. | false | true | Custom routine can change masking behavior. | Set `routine` to an approved masking routine reference. | Set `routine` to an unapproved masking routine reference. |
