## 🛡️ Policy Deployment Engine: `certificate_manager_certificate_issuance_config`

This section provides a concise policy evaluation for the `certificate_manager_certificate_issuance_config` resource in GCP.

Reference: [Terraform Registry – certificate_manager_certificate_issuance_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate_issuance_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `rotation_window_percentage` | It specifies the percentage of elapsed time of the certificate lifetime to wait before renewing the certificate. Must be a number between 1-99, inclusive. You must set the rotation window percentage in relation to the certificate lifetime so that certificate renewal occurs at least 7 days after the certificate has been issued and at least 7 days before it expires. | true | true | The rotation window controls when renewal starts. An approved rotation window helps renewal occur before expiry and supports predictable certificate lifecycle management. | Use the approved rotation window percentage for the certificate lifecycle. | Using a rotation window percentage outside the approved lifecycle setting. |
| `key_algorithm` | Key algorithm to use when generating the private key. Possible values are: `RSA_2048`, `ECDSA_P256`. | true | true | The key algorithm affects the cryptographic strength and type of private key generated for issued certificates. | Use the approved key algorithm. | Using an unapproved key algorithm. |
| `lifetime` | Lifetime of issued certificates. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "1814400s". Valid values are from 21 days (1814400s) to 30 days (2592000s) | true | true | Certificate lifetime affects how long an issued certificate remains valid. A shorter approved lifetime reduces the exposure window if a certificate is misused. | Use the approved short certificate lifetime. | Using a longer or unapproved certificate lifetime. |
| `certificate_authority_config` | The CA that issues the workload certificate. It includes the CA address, type, authentication to CA service, etc. Structure is [documented below](#nested_certificate_authority_config). | true | false | None | None | None |
| `name` | A user-defined name of the certificate issuance config. CertificateIssuanceConfig names must be unique globally. | true | false | None | None | None |
| `description` | One or more paragraphs of text description of a CertificateIssuanceConfig. | false | false | None | None | None |
| `labels` | 'Set of label tags associated with the CertificateIssuanceConfig resource. An object containing a list of "key": value pairs. Example: { "name": "wrench", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `location` | The Certificate Manager location. If not specified, "global" is used. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `certificate_authority_service_config` |  | false | false | None | None | None |

### certificate_authority_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `certificate_authority_service_config` | Defines a CertificateAuthorityServiceConfig. Structure is [documented below](#nested_certificate_authority_config_certificate_authority_service_config). | false | false | None | None | None |

### certificate_authority_service_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ca_pool` | A CA pool resource used to issue a certificate. The CA pool string has a relative resource path following the form "projects/{project}/locations/{location}/caPools/{caPool}". | true | true | The CA pool determines which Certificate Authority Service pool issues the workload certificate. | Use an approved CA pool. | Using an unapproved CA pool. |
