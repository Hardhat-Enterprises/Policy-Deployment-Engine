## 🛡️ Policy Deployment Engine: `certificate_manager_trust_config`

This section provides a concise policy evaluation for the `certificate_manager_trust_config` resource in GCP.

Reference: [Terraform Registry – certificate_manager_trust_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_trust_config)

---

## 1. Argument Reference

### `name`
- Description: (Required) A user-defined name of the trust config. Trust config names must be unique globally.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The trust config location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the trust config. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) One or more paragraphs of text description of a trust config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trust_stores`
- Description: (Optional) Set of trust stores to perform validation against. This field is supported when TrustConfig is configured with Load Balancers, currently not supported for SPIFFE certificate validation. Structure is [documented below](#nested_trust_stores).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowlisted_certificates`
- Description: (Optional) Allowlisted PEM-encoded certificates. A certificate matching an allowlisted certificate is always considered valid as long as the certificate is parseable, proof of private key possession is established, and constraints on the certificate's SAN field are met. Structure is [documented below](#nested_allowlisted_certificates).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_trust_stores"></a>The `trust_stores` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trust_anchors`
- Description: (Optional) List of Trust Anchors to be used while performing validation against a given TrustStore. Structure is [documented below](#nested_trust_stores_trust_stores_trust_anchors).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `intermediate_cas`
- Description: (Optional) Set of intermediate CA certificates used for the path building phase of chain validation. The field is currently not supported if trust config is used for the workload certificate feature. Structure is [documented below](#nested_trust_stores_trust_stores_intermediate_cas). <a name="nested_trust_stores_trust_stores_trust_anchors"></a>The `trust_anchors` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pem_certificate`
- Description: (Optional) PEM root certificate of the PKI used for validation. Each certificate provided in PEM format may occupy up to 5kB. **Note**: This property is sensitive and will not be displayed in the plan. <a name="nested_trust_stores_trust_stores_intermediate_cas"></a>The `intermediate_cas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pem_certificate`
- Description: (Optional) PEM intermediate certificate used for building up paths for validation. Each certificate provided in PEM format may occupy up to 5kB. **Note**: This property is sensitive and will not be displayed in the plan. <a name="nested_allowlisted_certificates"></a>The `allowlisted_certificates` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pem_certificate`
- Description: (Required) PEM certificate that is allowlisted. The certificate can be up to 5k bytes, and must be a parseable X.509 certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
