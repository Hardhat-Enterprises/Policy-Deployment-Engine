## 🛡️ Policy Deployment Engine: `firebase_app_hosting_domain`

This section provides a concise policy evaluation for the `firebase_app_hosting_domain` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_domain](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_domain)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location of the Backend that this Domain is associated with | true | false | None | None | None |
| `backend` | The ID of the Backend that this Domain is associated with | true | false | None | None | None |
| `domain_id` | Id of the domain to create. Must be a valid domain name, such as "foo.com" | true | false | None | None | None |
| `serve` | The serving behavior of the domain. If specified, the domain will serve content other than its Backend's live content. Structure is [documented below](#nested_serve). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `redirect` |  | false | false | None | None | None |

### serve Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `redirect` | Specifies redirect behavior for a domain. Structure is [documented below](#nested_serve_redirect). | false | false | None | None | None |

### redirect Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `uri` | The URI of the redirect's intended destination. This URI will be prepended to the original request path. URI without a scheme are assumed to be HTTPS. | true | false | None | None | None |
| `status` | The status code to use in a redirect response. Must be a valid HTTP 3XX status code. Defaults to 302 if not present. | false | false | None | None | None |
