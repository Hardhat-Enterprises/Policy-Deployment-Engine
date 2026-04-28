## 🛡️ Policy Deployment Engine: `iam_oauth_client_credential`

This section provides a concise policy evaluation for the `iam_oauth_client_credential` resource in GCP.

Reference: [Terraform Registry – iam_oauth_client_credential](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_oauth_client_credential)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Location where the OAuth client credential is created. Must always be global. | true | true | Restricting location to global ensures consistent IAM control and avoids regional misconfiguration. | global | us-central1 |
| `oauthclient` | Parent OAuth client identifier used to associate the credential. | true | true | Invalid client associations can lead to unauthorized credential binding. | example-client-id | invalid-client |
| `oauth_client_credential_id` | Unique credential ID. Must follow 4–32 chars, lowercase letters, numbers, and hyphens. Cannot start with 'gcp-'. | true | true | Strict naming prevents insecure or reserved prefix usage. | cred-01a | gcp-cred-01a |
| `disabled` | Indicates whether the credential is disabled. | false | true | Disabled credentials cannot be used for authentication. | False | True |
| `display_name` | Human-readable name for the credential. | false | false | None | Valid Credential | Invalid Credential |
| `project` | GCP project where the resource is created. If not set, provider project is used. | false | true | Ensures correct project scoping for IAM isolation. | smooth-verve-467716-v1 |  |
