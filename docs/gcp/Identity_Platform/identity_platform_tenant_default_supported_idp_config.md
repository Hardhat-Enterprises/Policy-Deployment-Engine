## 🛡️ Policy Deployment Engine: `identity_platform_tenant_default_supported_idp_config`

This section provides a concise policy evaluation for the `identity_platform_tenant_default_supported_idp_config` resource in GCP.

Reference: [Terraform Registry – identity_platform_tenant_default_supported_idp_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/identity_platform_tenant_default_supported_idp_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `idp_id` | ID of the IDP. Possible values include: * `apple.com` * `facebook.com` * `gc.apple.com` * `github.com` * `google.com` * `linkedin.com` * `microsoft.com` * `playgames.google.com` * `twitter.com` * `yahoo.com` | true | None | None |
| `tenant` | The name of the tenant where this DefaultSupportedIdpConfig resource exists | true | None | None |
| `client_id` | OAuth client ID | true | None | None |
| `client_secret` | OAuth client secret | true | None | None |
| `enabled` | If this IDP allows the user to sign in | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
