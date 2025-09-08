## 🛡️ Policy Deployment Engine: `app_engine_application_url_dispatch_rules`

This section provides a concise policy evaluation for the `app_engine_application_url_dispatch_rules` resource in GCP.

Reference: [Terraform Registry – app_engine_application_url_dispatch_rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_application_url_dispatch_rules)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project` | If it is not provided, the provider project is used. | none | None | None |

### dispatch_rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `domain` | Domain name to match against. The wildcard "*" is supported if specified before a period: "*.". Defaults to matching all domains: "*". | false | None | None |
| `path` | Pathname within the host. Must start with a "/". A single "*" can be included at the end of the path. The sum of the lengths of the domain and path may not exceed 100 characters. | true | None | None |
| `service` | Pathname within the host. Must start with a "/". A single "*" can be included at the end of the path. The sum of the lengths of the domain and path may not exceed 100 characters. | true | None | None |
