## 🛡️ Policy Deployment Engine: `app_engine_domain_mapping`

This section provides a concise policy evaluation for the `app_engine_domain_mapping` resource in GCP.

Reference: [Terraform Registry – app_engine_domain_mapping](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_domain_mapping)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `domain_name` | Relative name of the domain serving the application. Example: example.com. | true | true | To enforce the use of verified domains to prevent unauthorized shadow branding and ensure all application traffic is protected by corporate-standard SSL/TLS configurations | hardhatenterprises.com | unverified-domain.com |
| `ssl_settings` | SSL configuration for this domain. If unconfigured, this domain will not serve with SSL. Structure is [documented below](#nested_ssl_settings). | false | true | Mandates the use of managed SSL settings to guarantee that all custom domain traffic is encrypted via TLS and to eliminate the risk of service downtime caused by expired manual certificates | None | None |
| `override_strategy` | Whether the domain creation should override any existing mappings for this domain. By default, overrides are rejected. Default value is `STRICT`. Possible values are: `STRICT`, `OVERRIDE`. | false | true | to enforce a clear resolution strategy for domain mapping conflicts to prevent accidental hijacking of custom domains from other projects and ensure predictable routing behavior. | STRICT | OVERRIDE |
| `project` | If it is not provided, the provider project is used. | false | false | It is a standard provider-inherited field as the resource is inherently constrained by the project-level permissions and deployment context of the authenticated service account. | None | None |

### ssl_settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `certificate_id` | ID of the AuthorizedCertificate resource configuring SSL for the application. Clearing this field will remove SSL support. By default, a managed certificate is automatically created for every domain mapping. To omit SSL support or to configure SSL manually, specify `SslManagementType.MANUAL` on a `CREATE` or `UPDATE` request. You must be authorized to administer the `AuthorizedCertificate` resource to manually map it to a DomainMapping resource. Example: 12345. | false | false | Mandating/managing specific certificate IDs manually increases operational overhead and introduces the risk of service outages due to manual renewal failures. | None | None |
| `ssl_management_type` | SSL management type for this domain. If `AUTOMATIC`, a managed certificate is automatically provisioned. If `MANUAL`, `certificateId` must be manually specified in order to configure SSL for this domain. Possible values are: `AUTOMATIC`, `MANUAL`. | true | true | Mandates 'AUTOMATIC' SSL management to utilise Google's managed certificate authority, ensuring renewals and the use of modern cryptographic protocols without human intervention. | AUTOMATIC | MANUAL |
| `pending_managed_certificate_id` | (Output) ID of the managed `AuthorizedCertificate` resource currently being provisioned, if applicable. Until the new managed certificate has been successfully provisioned, the previous SSL state will be preserved. Once the provisioning process completes, the `certificateId` field will reflect the new managed certificate and this field will be left empty. To remove SSL support while there is still a pending managed certificate, clear the `certificateId` field with an update request. | false | false | Is a read-only output attribute managed by Google Cloud, represents a transient state during certificate provisioning and cannot be influenced/configured by the user. | None | None |
