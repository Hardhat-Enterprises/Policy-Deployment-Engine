## 🛡️ Policy Deployment Engine: `identity_platform_tenant`

This section provides a concise policy evaluation for the `identity_platform_tenant` resource in GCP.

Reference: [Terraform Registry – identity_platform_tenant](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/identity_platform_tenant)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Human friendly display name of the tenant. | true | None | None |
| `allow_password_signup` | Whether to allow email/password user authentication. | false | None | None |
| `enable_email_link_signin` | Whether to enable email link user authentication. | false | None | None |
| `disable_auth` | Whether authentication is disabled for the tenant. If true, the users under the disabled tenant are not allowed to sign-in. Admins of the disabled tenant are not able to manage its users. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### client Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `permissions` | Configuration related to restricting a user's ability to affect their account. Structure is [documented below](#nested_client_permissions). | false | None | None |

### permissions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disabled_user_signup` | When true, end users cannot sign up for a new account on the associated project through any of our API methods. | false | None | None |
| `disabled_user_deletion` | When true, end users cannot delete their account on the associated project through any of our API methods. | false | None | None |
