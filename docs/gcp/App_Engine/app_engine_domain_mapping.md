## 🛡️ Policy Deployment Engine: `app_engine_domain_mapping`

This section provides a concise policy evaluation for the `app_engine_domain_mapping` resource in GCP.

Reference: [Terraform Registry – app_engine_domain_mapping](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_domain_mapping)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `domain_name` | Relative name of the domain serving the application. Example: example.com. | true | None | None |
| `override_strategy` | Whether the domain creation should override any existing mappings for this domain. By default, overrides are rejected. Default value is `STRICT`. Possible values are: `STRICT`, `OVERRIDE`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### ssl_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `certificate_id` | ID of the AuthorizedCertificate resource configuring SSL for the application. Clearing this field will remove SSL support. By default, a managed certificate is automatically created for every domain mapping. To omit SSL support or to configure SSL manually, specify `SslManagementType.MANUAL` on a `CREATE` or `UPDATE` request. You must be authorized to administer the `AuthorizedCertificate` resource to manually map it to a DomainMapping resource. Example: 12345. | false | None | None |
| `ssl_management_type` | SSL management type for this domain. If `AUTOMATIC`, a managed certificate is automatically provisioned. If `MANUAL`, `certificateId` must be manually specified in order to configure SSL for this domain. Possible values are: `AUTOMATIC`, `MANUAL`. | true | None | None |
| `pending_managed_certificate_id` | (Output) ID of the managed `AuthorizedCertificate` resource currently being provisioned, if applicable. Until the new managed certificate has been successfully provisioned, the previous SSL state will be preserved. Once the provisioning process completes, the `certificateId` field will reflect the new managed certificate and this field will be left empty. To remove SSL support while there is still a pending managed certificate, clear the `certificateId` field with an update request. | none | None | None |
