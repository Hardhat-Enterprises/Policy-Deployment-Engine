## 🛡️ Policy Deployment Engine: `iam_oauth_client`

This section provides a concise policy evaluation for the `iam_oauth_client` resource in GCP.

Reference: [Terraform Registry – iam_oauth_client](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_oauth_client)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allowed_scopes` | Required. The list of scopes that the OauthClient is allowed to request during OAuth flows. | true | true | Restricting scopes enforces least privilege OAuth access and prevents over-permissioned identity delegation. | ['openid', 'email', 'groups'] | ['https://www.googleapis.com/auth/cloud-platform'] |
| `allowed_grant_types` | Required. The list of OAuth grant types is allowed for the OauthClient. | true | true | Ensures only approved OAuth flows are used to prevent insecure authentication mechanisms. | ['AUTHORIZATION_CODE_GRANT'] | ['IMPLICIT_GRANT'] |
| `allowed_redirect_uris` | Required. The list of redirect URIs allowed after OAuth authentication. | true | true | Prevents open redirect attacks and ensures tokens are only sent to trusted endpoints. | ['https://www.example.com/callback'] | ['http://evil.com'] |
| `location` | Resource ID segment making up resource name. | true | true | OAuth clients must be deployed in global scope to ensure consistent IAM enforcement. | global | us-central1 |
| `oauth_client_id` | Required. The ID used for the OauthClient resource. | true | true | Ensures predictable naming and avoids reserved prefix misuse. | example-client-01 | gcp-client-01 |
| `disabled` | Whether the OauthClient is disabled. | false | true | Disabled clients cannot be used, reducing attack surface when not in use. | False | True |
| `display_name` | Human-readable name of the OAuth client. | false | false | Used only for identification purposes. | Enterprise OAuth Client | Very Long Invalid Name That Exceeds Limits |
| `description` | Description of the OAuth client. | false | false | Provides documentation for audit and governance. | OAuth client for enterprise login | test |
| `client_type` | Type of OAuth client. | false | true | Restricts OAuth clients to approved secure types only. | ['PUBLIC_CLIENT', 'CONFIDENTIAL_CLIENT'] | ['INTERNAL_CLIENT'] |
| `project` | Project where the resource is created. | false | true | Ensures correct project-level IAM isolation. | smooth-verve-467716-v1 |  |
