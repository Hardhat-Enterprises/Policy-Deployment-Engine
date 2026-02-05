## 🛡️ Policy Deployment Engine: `app_engine_application_url_dispatch_rules`

This section provides a concise policy evaluation for the `app_engine_application_url_dispatch_rules` resource in GCP.

Reference: [Terraform Registry – app_engine_application_url_dispatch_rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_application_url_dispatch_rules)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dispatch_rules` | Rules to match an HTTP request and dispatch that request to a service. Structure is [documented below](#nested_dispatch_rules). | true | true | Establishes centralized routing logic to ensure requests are directed to the correct microservices based on URL patterns, preventing leaky traffic/unauthorized cross-service access. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Unnecessary as it defaults to the provider-level project configuration if it is not provided, ensuring the resource is naturally governed by the existing project-level access controls. | None | None |

### dispatch_rules Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `domain` | Domain name to match against. The wildcard "*" is supported if specified before a period: "*.". Defaults to matching all domains: "*". | false | true | To enforce strict hostname mapping to ensure traffic is only routed through approved domains, preventing 'Host Header Injection' and ensuring cross-site requests are properly isolated. | hardhat.pythonanywhere.com | invalid-domain.com |
| `path` | Pathname within the host. Must start with a "/". A single "*" can be included at the end of the path. The sum of the lengths of the domain and path may not exceed 100 characters. | true | true | To define explicit URL patterns to ensure sensitive application paths are strictly mapped to their intended microservices, preventing accidental exposure of internal endpoints | /* | admin/* |
| `service` | Pathname within the host. Must start with a "/". A single "*" can be included at the end of the path. The sum of the lengths of the domain and path may not exceed 100 characters. | true | true | To enforce explicit mapping of URL patterns to specific microservices to ensure architectural isolation and prevent traffic from falling back to a service that may not have the appropriate security context/permissions | default | unauthorized-service |
