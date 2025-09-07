## 🛡️ Policy Deployment Engine: `certificate_manager_certificate`

This section provides a concise policy evaluation for the `certificate_manager_certificate` resource in GCP.

Reference: [Terraform Registry – certificate_manager_certificate](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate)

---

## 1. Argument Reference

### `name`
- Description: (Required) A user-defined name of the certificate. Certificate names must be unique The name must be 1-64 characters long, and match the regular expression [a-zA-Z][a-zA-Z0-9_-]* which means the first character must be a letter, and all following characters must be a dash, underscore, letter or digit.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human-readable description of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the Certificate resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: (Optional) The scope of the certificate. DEFAULT: Certificates with default scope are served from core Google data centers. If unsure, choose this option. EDGE_CACHE: Certificates with scope EDGE_CACHE are special-purposed certificates, served from Edge Points of Presence. See https://cloud.google.com/vpc/docs/edge-locations. ALL_REGIONS: Certificates with ALL_REGIONS scope are served from all GCP regions (You can only use ALL_REGIONS with global certs). See https://cloud.google.com/compute/docs/regions-zones. CLIENT_AUTH: Certificates with CLIENT_AUTH scope are used by a load balancer (TLS client) to be presented to the backend (TLS server) when backend mTLS is configured. See https://cloud.google.com/load-balancing/docs/backend-authenticated-tls-backend-mtls#client-certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `self_managed`
- Description: (Optional) Certificate data for a SelfManaged Certificate. SelfManaged Certificates are uploaded by the user. Updating such certificates before they expire remains the user's responsibility. Structure is [documented below](#nested_self_managed).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `managed`
- Description: (Optional) Configuration and state of a Managed Certificate. Certificate Manager provisions and renews Managed Certificates automatically, for as long as it's authorized to do so. Structure is [documented below](#nested_managed).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The Certificate Manager location. If not specified, "global" is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_self_managed"></a>The `self_managed` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `certificate_pem`
- Description: (Optional, Deprecated) The certificate chain in PEM-encoded form. Leaf certificate comes first, followed by intermediate ones if any. **Note**: This property is sensitive and will not be displayed in the plan. ~> **Warning:** `certificate_pem` is deprecated and will be removed in a future major release. Use `pem_certificate` instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_key_pem`
- Description: (Optional, Deprecated) The private key of the leaf certificate in PEM-encoded form. **Note**: This property is sensitive and will not be displayed in the plan. ~> **Warning:** `private_key_pem` is deprecated and will be removed in a future major release. Use `pem_private_key` instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pem_certificate`
- Description: (Optional) The certificate chain in PEM-encoded form. Leaf certificate comes first, followed by intermediate ones if any.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pem_private_key`
- Description: (Optional) The private key of the leaf certificate in PEM-encoded form. **Note**: This property is sensitive and will not be displayed in the plan. <a name="nested_managed"></a>The `managed` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domains`
- Description: (Optional) The domains for which a managed SSL certificate will be generated. Wildcard domains are only supported with DNS challenge resolution
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_authorizations`
- Description: (Optional) Authorizations that will be used for performing domain authorization. Either issuanceConfig or dnsAuthorizations should be specificed, but not both.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `issuance_config`
- Description: (Optional) The resource name for a CertificateIssuanceConfig used to configure private PKI certificates in the format projects/*/locations/*/certificateIssuanceConfigs/*. If this field is not set, the certificates will instead be publicly signed as documented at https://cloud.google.com/load-balancing/docs/ssl-certificates/google-managed-certs#caa. Either issuanceConfig or dnsAuthorizations should be specificed, but not both.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) A state of this Managed Certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provisioning_issue`
- Description: (Output) Information about issues with provisioning this Managed Certificate. Structure is [documented below](#nested_managed_provisioning_issue).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorization_attempt_info`
- Description: (Output) Detailed state of the latest authorization attempt for each domain specified for this Managed Certificate. Structure is [documented below](#nested_managed_authorization_attempt_info). <a name="nested_managed_provisioning_issue"></a>The `provisioning_issue` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reason`
- Description: (Output) Reason for provisioning failures.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `details`
- Description: (Output) Human readable explanation about the issue. Provided to help address the configuration issues. Not guaranteed to be stable. For programmatic access use `reason` field. <a name="nested_managed_authorization_attempt_info"></a>The `authorization_attempt_info` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain`
- Description: (Output) Domain name of the authorization attempt.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) State of the domain for managed certificate issuance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `failure_reason`
- Description: (Output) Reason for failure of the authorization attempt for the domain.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `details`
- Description: (Output) Human readable explanation for reaching the state. Provided to help address the configuration issues. Not guaranteed to be stable. For programmatic access use `failure_reason` field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
