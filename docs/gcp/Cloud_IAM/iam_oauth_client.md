## 🛡️ Policy Deployment Engine: `iam_oauth_client`

This section provides a concise policy evaluation for the `iam_oauth_client` resource in GCP.

Reference: [Terraform Registry – iam_oauth_client](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_oauth_client)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allowed_scopes` | Required. The list of scopes that the OauthClient is allowed to request during OAuth flows. The following scopes are supported: * `https://www.googleapis.com/auth/cloud-platform`: See, edit, configure, and delete your Google Cloud data and see the email address for your Google Account. * `openid`: The OAuth client can associate you with your personal information on Google Cloud. * `email`: The OAuth client can read a federated identity's email address. * `groups`: The OAuth client can read a federated identity's groups. | true | true | OAuth clients must only request approved least-privilege scopes and must not use overly broad scopes such as cloud-platform to reduce excessive access risks. | ['openid', 'email', 'groups'] | ['https://www.googleapis.com/auth/cloud-platform'] |
| `allowed_grant_types` | Required. The list of OAuth grant types is allowed for the OauthClient. | true | true | Restricting grant types helps prevent insecure authentication flows and unauthorized token usage. | None | None |
| `allowed_redirect_uris` | Required. The list of redirect uris that is allowed to redirect back when authorization process is completed. | true | true | Restricting redirect URIs helps prevent token leakage and unauthorized redirection attacks. | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | true | OAuth clients must be deployed only in approved Australian regions to meet organizational residency and compliance requirements. | ['australia-southeast1', 'australia-southeast2'] | global |
| `oauth_client_id` | Required. The ID to use for the OauthClient, which becomes the final component of the resource name. This value should be a string of 6 to 63 lowercase letters, digits, or hyphens. It must start with a letter, and cannot have a trailing hyphen. The prefix `gcp-` is reserved for use by Google, and may not be specified. | true | false | This field uniquely identifies the OAuth client resource but does not directly affect security enforcement. | None | None |
| `disabled` | Whether the OauthClient is disabled. You cannot use a disabled OAuth client. | false | true | Disabling unused or compromised OAuth clients helps prevent unauthorized access. | None | None |
| `display_name` | A user-specified display name of the OauthClient. Cannot exceed 32 characters. | false | false | This field is used only for readability and identification purposes. | None | None |
| `description` | A user-specified description of the OauthClient. Cannot exceed 256 characters. | false | false | This field provides additional documentation but does not affect security behavior. | None | None |
| `client_type` | Immutable. The type of OauthClient. Either public or private. For private clients, the client secret can be managed using the dedicated OauthClientCredential resource. Possible values: CLIENT_TYPE_UNSPECIFIED PUBLIC_CLIENT CONFIDENTIAL_CLIENT | false | true | Restricts OAuth clients to approved secure types only. | ['PUBLIC_CLIENT', 'CONFIDENTIAL_CLIENT'] | ['CLIENT_TYPE_UNSPECIFIED'] |
| `project` | If it is not provided, the provider project is used. | false | true | The project determines where the OAuth client is created and which resources it can access. | None | None |
