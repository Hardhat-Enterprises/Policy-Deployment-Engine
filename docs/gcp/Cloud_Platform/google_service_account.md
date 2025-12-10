## 🛡️ Policy Deployment Engine: `google_service_account`

This section provides a concise policy evaluation for the `google_service_account` resource in GCP.

Reference: [Terraform Registry – google_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `account_id` | account email address and a stable unique id. It is unique within a project, must be 6-30 characters long, and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])` to comply with RFC1035. Changing this forces a new service account to be created. | true | true | Risky names like admin, root, or owner give false sense of privilege and can confuse audits | account_id = "payments-batcher-prod" | account_id = "admin" |
| `display_name` |  The display name for the service account. Can be updated without creating a new resource. | false | true | Display names that include admin, root, and owner may confuse reviewers and operators. | None | None |
| `description` | A text description of the service account. Must be less than or equal to 256 UTF-8 bytes. | false | true | Empty descriptions make it unclear who owns or uses the account and reduce traceability. | description = "Runs nightly ETL for analytics" | description = "" |
| `disabled` | Whether a service account is disabled or not. Defaults to false. This field has no effect during creation. Must be set after creation to disable a service account. | false | true | Creating disabled accounts causes confusion.  Accounts need to be made active at first, then disabled if applicable. | disabled = false | disabled = true |
| `project` | The ID of the project that the service account will be created in. Defaults to the provider project configuration. | false | false | Only specifies the account's address, which is no a security concern | None | None |
| `create_ignore_already_exists` |  If set to true, skip service account creation if a service account with the same email already exists. | false | false | Only controls whether Terraform skips making the account if it already exists. It does not affect security | create_ignore_already_exists = true | None |
