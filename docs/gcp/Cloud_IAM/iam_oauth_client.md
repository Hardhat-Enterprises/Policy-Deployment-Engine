## 🛡️ Policy Deployment Engine: `iam_oauth_client`

This section provides a concise policy evaluation for the `iam_oauth_client` resource in GCP.

Reference: [Terraform Registry – iam_oauth_client](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_oauth_client)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Location where the OAuth client is deployed. Must always be global. | true | true | Ensures OAuth configuration consistency across GCP IAM services. | global | us-central1 |
| `oauth_client_id` | Unique OAuth client ID. Must be 6–63 characters, lowercase letters, digits, or hyphens. Cannot start or end with hyphen and cannot use 'gcp-' prefix. | true | true | Prevents insecure or invalid OAuth client identifiers. | example-client-01 | gcp-client-01- |
| `client_type` | Type of OAuth client. Only PUBLIC_CLIENT or CONFIDENTIAL_CLIENT are allowed. | false | true | Restricts OAuth client types to approved security models. | CONFIDENTIAL_CLIENT | UNKNOWN_CLIENT |
| `allowed_scopes` | List of OAuth scopes allowed for authentication flows. | true | true | Restricting scopes reduces access exposure and privilege escalation risk. | ['openid', 'email'] | ['*'] |
| `allowed_grant_types` | OAuth grant types allowed for the client. | true | true | Controls authentication flow security. | ['AUTHORIZATION_CODE_GRANT'] | [] |
| `allowed_redirect_uris` | List of allowed redirect URIs after authentication. | true | true | Prevents redirect attacks and phishing risks. | ['https://example.com'] | ['http://evil.com'] |
| `disabled` | Indicates whether the OAuth client is disabled. | false | true | Disabled clients cannot be used for authentication. | False | True |
| `display_name` | Human-readable name for the OAuth client. | false | false | None | Valid OAuth Client | Invalid Client |
| `description` | Optional description of the OAuth client. | false | false | None | OAuth client for production app |  |
| `project` | GCP project where the OAuth client is created. | false | true | Ensures correct project-level isolation. | smooth-verve-467716-v1 |  |
