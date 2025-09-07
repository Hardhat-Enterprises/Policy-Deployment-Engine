## 🛡️ Policy Deployment Engine: `app_engine_domain_mapping`

This section provides a concise policy evaluation for the `app_engine_domain_mapping` resource in GCP.

Reference: [Terraform Registry – app_engine_domain_mapping](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_domain_mapping)

---

## 1. Argument Reference

### `domain_name`
- Description: (Required) Relative name of the domain serving the application. Example: example.com.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_settings`
- Description: (Optional) SSL configuration for this domain. If unconfigured, this domain will not serve with SSL. Structure is [documented below](#nested_ssl_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `override_strategy`
- Description: (Optional) Whether the domain creation should override any existing mappings for this domain. By default, overrides are rejected. Default value is `STRICT`. Possible values are: `STRICT`, `OVERRIDE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_ssl_settings"></a>The `ssl_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `certificate_id`
- Description: (Optional) ID of the AuthorizedCertificate resource configuring SSL for the application. Clearing this field will remove SSL support. By default, a managed certificate is automatically created for every domain mapping. To omit SSL support or to configure SSL manually, specify `SslManagementType.MANUAL` on a `CREATE` or `UPDATE` request. You must be authorized to administer the `AuthorizedCertificate` resource to manually map it to a DomainMapping resource. Example: 12345.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_management_type`
- Description: (Required) SSL management type for this domain. If `AUTOMATIC`, a managed certificate is automatically provisioned. If `MANUAL`, `certificateId` must be manually specified in order to configure SSL for this domain. Possible values are: `AUTOMATIC`, `MANUAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pending_managed_certificate_id`
- Description: (Output) ID of the managed `AuthorizedCertificate` resource currently being provisioned, if applicable. Until the new managed certificate has been successfully provisioned, the previous SSL state will be preserved. Once the provisioning process completes, the `certificateId` field will reflect the new managed certificate and this field will be left empty. To remove SSL support while there is still a pending managed certificate, clear the `certificateId` field with an update request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
