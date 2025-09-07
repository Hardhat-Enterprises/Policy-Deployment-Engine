## 🛡️ Policy Deployment Engine: `bigquery_row_access_policy`

This section provides a concise policy evaluation for the `bigquery_row_access_policy` resource in GCP.

Reference: [Terraform Registry – bigquery_row_access_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_row_access_policy)

---

## 1. Argument Reference

### `dataset_id`
- Description: (Required) The ID of the dataset containing this row access policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Required) The ID of the table containing this row access policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_id`
- Description: (Required) The ID of the row access policy. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 256 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter_predicate`
- Description: (Required) A SQL boolean expression that represents the rows defined by this row access policy, similar to the boolean expression in a WHERE clause of a SELECT query on a table. References to other tables, routines, and temporary functions are not supported. Examples: region="EU" date_field = CAST('2019-9-27' as DATE) nullable_field is not NULL numeric_field BETWEEN 1.0 AND 5.0
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `grantees`
- Description: (Optional) Input only. The optional list of iam_member users or groups that specifies the initial members that the row-level access policy should be created with. grantees types: - "user:alice@example.com": An email address that represents a specific Google account. - "serviceAccount:my-other-app@appspot.gserviceaccount.com": An email address that represents a service account. - "group:admins@example.com": An email address that represents a Google group. - "domain:example.com":The Google Workspace domain (primary) that represents all the users of that domain. - "allAuthenticatedUsers": A special identifier that represents all service accounts and all users on the internet who have authenticated with a Google Account. This identifier includes accounts that aren't connected to a Google Workspace or Cloud Identity domain, such as personal Gmail accounts. Users who aren't authenticated, such as anonymous visitors, aren't included. - "allUsers":A special identifier that represents anyone who is on the internet, including authenticated and unauthenticated users. Because BigQuery requires authentication before a user can access the service, allUsers includes only authenticated users.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
