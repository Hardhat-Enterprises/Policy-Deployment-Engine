## 🛡️ Policy Deployment Engine: `firebase_app_hosting_domain`

This section provides a concise policy evaluation for the `firebase_app_hosting_domain` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_domain](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_domain)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location of the Backend that this Domain is associated with | true | false | Location inherits from backend configuration and has no independent security policy. | australia-southeast2-a | us-east1 |
| `backend` | The ID of the Backend that this Domain is associated with | true | false | Backend ID is a reference with no direct security implications. | c | nc |
| `domain_id` | Id of the domain to create. Must be a valid domain name, such as "foo.com" | true | false | Custom domain ID has no specific security policy. | valid.domain.com | invalid.domain.com |
| `serve` | The serving behavior of the domain. If specified, the domain will serve content other than its Backend's live content. Structure is [documented below](#nested_serve). | false | false | Domain serving behavior has no specific security policy. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Project specification uses default provider project when not specified. | None | None |
| `redirect` |  | false | false | Redirect configuration has no specific security policy. | None | None |

### serve Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `redirect` | Specifies redirect behavior for a domain. Structure is [documented below](#nested_serve_redirect). | false | false | Domain redirect configuration has no specific security policy. | None | None |

### redirect Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `uri` | The URI of the redirect's intended destination. This URI will be prepended to the original request path. URI without a scheme are assumed to be HTTPS. | true | false | Redirect URI has no specific security policy. | None | None |
| `status` | The status code to use in a redirect response. Must be a valid HTTP 3XX status code. Defaults to 302 if not present. | false | false | Redirect status code has no specific security policy. | None | None |
