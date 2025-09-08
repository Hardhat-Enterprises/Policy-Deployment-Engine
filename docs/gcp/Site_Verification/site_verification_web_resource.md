## 🛡️ Policy Deployment Engine: `site_verification_web_resource`

This section provides a concise policy evaluation for the `site_verification_web_resource` resource in GCP.

Reference: [Terraform Registry – site_verification_web_resource](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/site_verification_web_resource)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `verification_method` | The verification method for the Site Verification system to use to verify this site or domain. Possible values are: `ANALYTICS`, `DNS_CNAME`, `DNS_TXT`, `FILE`, `META`, `TAG_MANAGER`. | true | None | None |

### site Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The type of resource to be verified. Possible values are: `INET_DOMAIN`, `SITE`. | true | None | None |
| `identifier` | The site identifier. If the type is set to SITE, the identifier is a URL. If the type is set to INET_DOMAIN, the identifier is a domain name. | true | None | None |
