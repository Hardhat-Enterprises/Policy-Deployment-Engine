## 🛡️ Policy Deployment Engine: `firebase_app_hosting_domain`

This section provides a concise policy evaluation for the `firebase_app_hosting_domain` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_domain](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_domain)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the Backend that this Domain is associated with | true | None | None |
| `backend` | The ID of the Backend that this Domain is associated with | true | None | None |
| `domain_id` | Id of the domain to create. Must be a valid domain name, such as "foo.com" | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### serve Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `redirect` | Specifies redirect behavior for a domain. Structure is [documented below](#nested_serve_redirect). | false | None | None |

### redirect Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | The URI of the redirect's intended destination. This URI will be prepended to the original request path. URI without a scheme are assumed to be HTTPS. | true | None | None |
| `status` | The status code to use in a redirect response. Must be a valid HTTP 3XX status code. Defaults to 302 if not present. | false | None | None |
