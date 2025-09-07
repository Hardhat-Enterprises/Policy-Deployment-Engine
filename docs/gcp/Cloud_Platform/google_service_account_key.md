## 🛡️ Policy Deployment Engine: `google_service_account_key`

This section provides a concise policy evaluation for the `google_service_account_key` resource in GCP.

Reference: [Terraform Registry – google_service_account_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_key)

---

## 1. Argument Reference

### `service_account_id`
- Description: `{ACCOUNT}` or `projects/{PROJECT_ID}/serviceAccounts/{ACCOUNT}`. If the `{ACCOUNT}`-only syntax is used, either the **full** email address of the service account or its name can be specified as a value, in which case the project will automatically be inferred from the account. Otherwise, if the `projects/{PROJECT_ID}/serviceAccounts/{ACCOUNT}` syntax is used, the `{ACCOUNT}` specified can be the full email address of the service account or the service account's unique id. Substituting `-` as a wildcard for the `{PROJECT_ID}` will infer the project from the account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_algorithm`
- Description: Valid values are listed at [ServiceAccountPrivateKeyType](https://cloud.google.com/iam/reference/rest/v1/projects.serviceAccounts.keys#ServiceAccountKeyAlgorithm) (only used on create)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
