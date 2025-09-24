## 🛡️ Policy Deployment Engine: `app_engine_domain_mapping`

This section provides a concise policy evaluation for the `app_engine_domain_mapping` resource in GCP.

Reference: [Terraform Registry – app_engine_domain_mapping](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_domain_mapping)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `domain_name` | Relative name of the domain serving the application. Example: example.com. | true | false | Restricting domain mappings to known, approved domains reduces the risk of subdomain hijacking and data exposure. | domain_name = "secure-service.example.com" (points only to an approved production domain). | domain_name = "*.example.com" (wildcard domain unintentionally exposes all subdomains). |
| `ssl_settings` | SSL configuration for this domain. If unconfigured, this domain will not serve with SSL. Structure is documented below. | false | false | Enforcing SSL ensures that all connections to the mapped domain are encrypted with TLS. | ssl_settings { ssl_management_type = "AUTOMATIC" } (Google-managed certificate provisioned automatically). | ssl_settings { ssl_management_type = "MANUAL" } without certificate_id (domain will not serve with SSL). |
| `override_strategy` | Whether the domain creation should override any existing mappings for this domain. By default, overrides are rejected. Default value is `STRICT`. Possible values are: `STRICT`, `OVERRIDE`. | false | false | While override_strategy controls replacement behavior, it is not possible to enforce via policy helpers. | Documented only, no enforcement possible. | Documented only, no enforcement possible. |
| `project` | If it is not provided, the provider project is used. | false | false | Always specify project explicitly for clarity and to prevent drift. | project = "secure-production-project". | Project omitted, relying on provider default. |

### ssl_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `certificate_id` | ID of the AuthorizedCertificate resource configuring SSL for the application. | false | false | Where manual management is used, certificate rotation must be automated. | certificate_id = "12345" with ssl_management_type = "MANUAL" and automated renewal in place. | ssl_management_type = "MANUAL" without certificate_id specified. |
| `ssl_management_type` | SSL management type for this domain. AUTOMATIC provisions a managed cert, MANUAL requires certificate_id. | true | false | Prefer AUTOMATIC to reduce operational risk and ensure continuous TLS coverage. | ssl_management_type = "AUTOMATIC". | ssl_management_type = "MANUAL" without a valid certificate_id. |
| `pending_managed_certificate_id` | (Output only) ID of the managed AuthorizedCertificate resource currently being provisioned. | false | false | Helps track certificate provisioning status. | Not applicable (system-managed). | Not applicable. |
