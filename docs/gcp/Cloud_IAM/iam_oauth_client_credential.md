## 🛡️ Policy Deployment Engine: `iam_oauth_client_credential`

This section provides a concise policy evaluation for the `iam_oauth_client_credential` resource in GCP.

Reference: [Terraform Registry – iam_oauth_client_credential](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_oauth_client_credential)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | true | OAuth client credentials must be deployed only in approved Australian regions to meet organizational residency and compliance requirements. | australia-southeast2 | global |
| `oauthclient` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | false | None | None | None |
| `oauth_client_credential_id` | Required. The ID to use for the OauthClientCredential, which becomes the final component of the resource name. This value should be 4-32 characters, and may contain the characters [a-z0-9-]. The prefix `gcp-` is reserved for use by Google, and may not be specified. | true | false | None | None | None |
| `disabled` | Whether the OauthClientCredential is disabled. You cannot use a disabled OauthClientCredential. | false | false | None | None | None |
| `display_name` | A user-specified display name of the OauthClientCredential. Cannot exceed 32 characters. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
