## 🛡️ Policy Deployment Engine: `certificate_manager_certificate`

This section provides a concise policy evaluation for the `certificate_manager_certificate` resource in GCP.

Reference: [Terraform Registry – certificate_manager_certificate](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | A user-defined name of the certificate. Certificate names must be unique The name must be 1-64 characters long, and match the regular expression [a-zA-Z][a-zA-Z0-9_-]* which means the first character must be a letter, and all following characters must be a dash, underscore, letter or digit. | true | false | None | None | None |
| `description` | A human-readable description of the resource. | false | false | None | None | None |
| `labels` | Set of label tags associated with the Certificate resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `scope` | The scope of the certificate. DEFAULT: Certificates with default scope are served from core Google data centers. If unsure, choose this option. EDGE_CACHE: Certificates with scope EDGE_CACHE are special-purposed certificates, served from Edge Points of Presence. See https://cloud.google.com/vpc/docs/edge-locations. ALL_REGIONS: Certificates with ALL_REGIONS scope are served from all GCP regions (You can only use ALL_REGIONS with global certs). See https://cloud.google.com/compute/docs/regions-zones. CLIENT_AUTH: Certificates with CLIENT_AUTH scope are used by a load balancer (TLS client) to be presented to the backend (TLS server) when backend mTLS is configured. See https://cloud.google.com/load-balancing/docs/backend-authenticated-tls-backend-mtls#client-certificate. | false | true | The certificate scope controls where and how the certificate can be served. Using an approved scope reduces unintended certificate exposure. | Use the approved certificate scope for normal Certificate Manager use. | Using special-purpose or unapproved scopes such as EDGE_CACHE, ALL_REGIONS, or CLIENT_AUTH. |
| `self_managed` | Certificate data for a SelfManaged Certificate. SelfManaged Certificates are uploaded by the user. Updating such certificates before they expire remains the user's responsibility. Structure is [documented below](#nested_self_managed). | false | false | None | None | None |
| `managed` | Configuration and state of a Managed Certificate. Certificate Manager provisions and renews Managed Certificates automatically, for as long as it's authorized to do so. Structure is [documented below](#nested_managed). | false | false | None | None | None |
| `location` | The Certificate Manager location. If not specified, "global" is used. | false | true | The certificate location controls where the certificate resource is created. Approved locations support consistent regional governance. | Use an approved Certificate Manager location. | Using an unapproved or unexpected location. |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |

### self_managed Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `certificate_pem` | , Deprecated) The certificate chain in PEM-encoded form. Leaf certificate comes first, followed by intermediate ones if any. **Note**: This property is sensitive and will not be displayed in the plan. ~> **Warning:** `certificate_pem` is deprecated and will be removed in a future major release. Use `pem_certificate` instead. | false | false | None | None | None |
| `private_key_pem` | , Deprecated) The private key of the leaf certificate in PEM-encoded form. **Note**: This property is sensitive and will not be displayed in the plan. ~> **Warning:** `private_key_pem` is deprecated and will be removed in a future major release. Use `pem_private_key` instead. | false | true | Private key material is sensitive and should not be defined directly in Terraform configuration. | Do not set private_key_pem in Terraform. | Defining PEM private key material in private_key_pem. |
| `pem_certificate` | The certificate chain in PEM-encoded form. Leaf certificate comes first, followed by intermediate ones if any. | false | false | None | None | None |
| `pem_private_key` | The private key of the leaf certificate in PEM-encoded form. **Note**: This property is sensitive and will not be displayed in the plan. | false | true | Private key material is sensitive and should not be defined directly in Terraform configuration. | Do not set pem_private_key in Terraform. | Defining PEM private key material in pem_private_key. |

### managed Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `domains` | The domains for which a managed SSL certificate will be generated. Wildcard domains are only supported with DNS challenge resolution | false | false | None | None | None |
| `dns_authorizations` | Authorizations that will be used for performing domain authorization. Either issuanceConfig or dnsAuthorizations should be specificed, but not both. | false | false | None | None | None |
| `issuance_config` | The resource name for a CertificateIssuanceConfig used to configure private PKI certificates in the format projects/*/locations/*/certificateIssuanceConfigs/*. If this field is not set, the certificates will instead be publicly signed as documented at https://cloud.google.com/load-balancing/docs/ssl-certificates/google-managed-certs#caa. Either issuanceConfig or dnsAuthorizations should be specificed, but not both. | false | true | The issuance config controls how managed certificates are issued. Using an approved config keeps certificate issuance under the expected CA and lifecycle settings. | Reference an approved certificate issuance config. | Referencing an unapproved or unexpected issuance config. |
| `state` | (Output) State of the domain for managed certificate issuance. | false | false | None | None | None |
| `provisioning_issue` | (Output) Information about issues with provisioning this Managed Certificate. Structure is [documented below](#nested_managed_provisioning_issue). | false | false | None | None | None |
| `authorization_attempt_info` | (Output) Detailed state of the latest authorization attempt for each domain specified for this Managed Certificate. Structure is [documented below](#nested_managed_authorization_attempt_info). The `provisioning_issue` block contains: | false | false | None | None | None |
| `reason` | (Output) Reason for provisioning failures. | false | false | None | None | None |
| `details` | (Output) Human readable explanation for reaching the state. Provided to help address the configuration issues. Not guaranteed to be stable. For programmatic access use `failure_reason` field. | false | false | None | None | None |
| `domain` | (Output) Domain name of the authorization attempt. | false | false | None | None | None |
| `failure_reason` | (Output) Reason for failure of the authorization attempt for the domain. | false | false | None | None | None |
