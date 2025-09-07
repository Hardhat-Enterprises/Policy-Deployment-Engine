## 🛡️ Policy Deployment Engine: `certificate_manager_certificate_issuance_config`

This section provides a concise policy evaluation for the `certificate_manager_certificate_issuance_config` resource in GCP.

Reference: [Terraform Registry – certificate_manager_certificate_issuance_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate_issuance_config)

---

## 1. Argument Reference

### `rotation_window_percentage`
- Description: (Required) It specifies the percentage of elapsed time of the certificate lifetime to wait before renewing the certificate. Must be a number between 1-99, inclusive. You must set the rotation window percentage in relation to the certificate lifetime so that certificate renewal occurs at least 7 days after the certificate has been issued and at least 7 days before it expires.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_algorithm`
- Description: (Required) Key algorithm to use when generating the private key. Possible values are: `RSA_2048`, `ECDSA_P256`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lifetime`
- Description: (Required) Lifetime of issued certificates. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "1814400s". Valid values are from 21 days (1814400s) to 30 days (2592000s)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `certificate_authority_config`
- Description: (Required) The CA that issues the workload certificate. It includes the CA address, type, authentication to CA service, etc. Structure is [documented below](#nested_certificate_authority_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) A user-defined name of the certificate issuance config. CertificateIssuanceConfig names must be unique globally.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) One or more paragraphs of text description of a CertificateIssuanceConfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) 'Set of label tags associated with the CertificateIssuanceConfig resource. An object containing a list of "key": value pairs. Example: { "name": "wrench", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The Certificate Manager location. If not specified, "global" is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_certificate_authority_config"></a>The `certificate_authority_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `certificate_authority_service_config`
- Description: (Optional) Defines a CertificateAuthorityServiceConfig. Structure is [documented below](#nested_certificate_authority_config_certificate_authority_service_config). <a name="nested_certificate_authority_config_certificate_authority_service_config"></a>The `certificate_authority_service_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_pool`
- Description: (Required) A CA pool resource used to issue a certificate. The CA pool string has a relative resource path following the form "projects/{project}/locations/{location}/caPools/{caPool}".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
