## 🛡️ Policy Deployment Engine: `iam_oauth_client_credential`

This section provides a concise policy evaluation for the `iam_oauth_client_credential` resource in GCP.

Reference: [Terraform Registry – iam_oauth_client_credential](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_oauth_client_credential)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | true | Restricting location to global ensures consistent IAM control and avoids regional misconfiguration. | global | us-central1 |
| `oauthclient` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | true | Ensures OAuth credential is correctly linked to a valid parent OAuth client to prevent unauthorized binding. | example-client-id | invalid-client |
| `oauth_client_credential_id` | Required. The ID to use for the OauthClientCredential, which becomes the final component of the resource name. This value should be 4-32 characters, and may contain the characters [a-z0-9-]. The prefix `gcp-` is reserved for use by Google, and may not be specified. | true | true | Prevents use of reserved prefixes and ensures predictable, secure naming conventions. | cred-01a | gcp-cred-01a |
| `disabled` | Whether the OauthClientCredential is disabled. You cannot use a disabled OauthClientCredential. | false | true | Disabled credentials reduce risk of unauthorized authentication usage. | False | True |
| `display_name` | A user-specified display name of the OauthClientCredential. Cannot exceed 32 characters. | false | false | Used for readability and operational clarity only. | None | None |
| `project` | If it is not provided, the provider project is used. | false | true | Ensures correct project scoping for IAM isolation and prevents cross-project credential leakage. | smooth-verve-467716-v1 |  |
