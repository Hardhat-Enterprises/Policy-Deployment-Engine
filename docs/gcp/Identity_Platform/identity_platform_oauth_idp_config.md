## 🛡️ Policy Deployment Engine: `identity_platform_oauth_idp_config`

This section provides a concise policy evaluation for the `identity_platform_oauth_idp_config` resource in GCP.

Reference: [Terraform Registry – identity_platform_oauth_idp_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/identity_platform_oauth_idp_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the OauthIdpConfig. Must start with `oidc.`. | true | None | None |
| `issuer` | For OIDC Idps, the issuer identifier. | true | None | None |
| `client_id` | The client id of an OAuth client. | true | None | None |
| `display_name` | Human friendly display name. | false | None | None |
| `enabled` | If this config allows users to sign in with the provider. | false | None | None |
| `client_secret` | The client secret of the OAuth client, to enable OIDC code flow. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### response_type Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id_token` | If true, ID token is returned from IdP's authorization endpoint. | false | None | None |
| `code` | If true, authorization code is returned from IdP's authorization endpoint. | false | None | None |
