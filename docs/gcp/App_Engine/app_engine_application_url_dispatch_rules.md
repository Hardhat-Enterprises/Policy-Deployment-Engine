## 🛡️ Policy Deployment Engine: `app_engine_application_url_dispatch_rules`

This section provides a concise policy evaluation for the `app_engine_application_url_dispatch_rules` resource in GCP.

Reference: [Terraform Registry – app_engine_application_url_dispatch_rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_application_url_dispatch_rules)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dispatch_rules` | Rules to match an HTTP request and dispatch that request to a service. | true | false | Dispatch rules should restrict access to approved domains and paths, ensuring sensitive endpoints are not left open. | Dispatch rules explicitly define secure domains and service mappings (e.g., domain = example.com, path = /secure/*, service = secure-service). | Dispatch rules allow wildcard domains without restrictions (e.g., domain = *, path = /*, service = default). |
| `project` | If it is not provided, the provider project is used. | false | false | Always enforce correct project scoping for dispatch rules. | Project ID explicitly set to the intended environment. | Project left unset or referencing unintended project. |

### dispatch_rules Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `domain` | Domain name to match against. Wildcard `*` is supported if specified before a period: `*.`. Defaults to matching all domains: `*`. | false | false | Limit routing to trusted domains only. | domain = secure.example.com or domain = *.trusted.org | domain = * or overly broad wildcards. |
| `path` | Pathname within the host. Must start with `/`. A single `*` can be included at the end of the path. | true | false | Paths should be restricted to only the required application routes. | path = /api/* or path = /admin/* | path = /* for all requests. |
| `service` | The service that traffic should be dispatched to. | true | false | Services should be explicitly mapped to only the paths they are intended to handle. | service = secure-service for /admin/* | service = default for sensitive paths without access controls. |
