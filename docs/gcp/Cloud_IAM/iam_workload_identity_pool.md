## 🛡️ Policy Deployment Engine: `iam_workload_identity_pool`

This section provides a concise policy evaluation for the `iam_workload_identity_pool` resource in GCP.

Reference: [Terraform Registry – iam_workload_identity_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool)

---

## 1. Argument Reference

### `workload_identity_pool_id`
- Description: (Required) The ID to use for the pool, which becomes the final component of the resource name. This value should be 4-32 characters, and may contain the characters [a-z0-9-]. The prefix `gcp-` is reserved for use by Google, and may not be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) A display name for the pool. Cannot exceed 32 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the pool. Cannot exceed 256 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Whether the pool is disabled. You cannot use a disabled pool to exchange tokens, or use existing tokens to access resources. If the pool is re-enabled, existing tokens grant access again.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The mode for the pool is operating in. Pools with an unspecified mode will operate as if they are in `FEDERATION_ONLY` mode. ~> **Note** This field cannot be changed after the Workload Identity Pool is created. While `terraform plan` may show an update if you change this field's value, `terraform apply` **will fail with an API error** (such as `Error 400: Attempted to update an immutable field.`). To specify a different `mode`, please create a new Workload Identity Pool resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inline_certificate_issuance_config`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Represents configuration for generating mutual TLS (mTLS) certificates for the identities within this pool. Defines the Certificate Authority (CA) pool resources and configurations required for issuance and rotation of mTLS workload certificates. Structure is [documented below](#nested_inline_certificate_issuance_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inline_trust_config`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Represents config to add additional trusted trust domains. Defines configuration for extending trust to additional trust domains. By establishing trust with another domain, the current domain will recognize and accept certificates issued by entities within the trusted domains. Note that a trust domain automatically trusts itself, eliminating the need for explicit configuration. Structure is [documented below](#nested_inline_trust_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_inline_certificate_issuance_config"></a>The `inline_certificate_issuance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_pools`
- Description: (Required) A required mapping of a cloud region to the CA pool resource located in that region used for certificate issuance, adhering to these constraints: * **Key format:** A supported cloud region name equivalent to the location identifier in the corresponding map entry's value. * **Value format:** A valid CA pool resource path format like: `projects/{project}/locations/{location}/caPools/{ca_pool}` * **Region Matching:** Workloads are ONLY issued certificates from CA pools within the same region. Also the CA pool region (in value) must match the workload's region (key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lifetime`
- Description: (Optional) Lifetime of the workload certificates issued by the CA pool in seconds. Must be between `86400s` (24 hours) to `2592000s` (30 days), ends in the suffix "`s`" (indicating seconds) and is preceded by the number of seconds. If unspecified, this will be defaulted to `86400s` (24 hours).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rotation_window_percentage`
- Description: (Optional) Rotation window percentage indicating when certificate rotation should be initiated based on remaining lifetime. Must be between `50` - `80`. If unspecified, this will be defaulted to `50`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_algorithm`
- Description: (Optional) Key algorithm to use when generating the key pair. This key pair will be used to create the certificate. If unspecified, this will default to `ECDSA_P256`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_trust_bundles`
- Description: (Optional) Maps specific trust domains (e.g., "example.com") to their corresponding `TrustStore` objects, which contain the trusted root certificates for that domain. There can be a maximum of `10` trust domain entries in this map. Note that a trust domain automatically trusts itself and don't need to be specified here. If however, this `WorkloadIdentityPool`'s trust domain contains any trust anchors in the `additional_trust_bundles` map, those trust anchors will be *appended to* the Trust Bundle automatically derived from your `InlineCertificateIssuanceConfig`'s `ca_pools`. Structure is [documented below](#nested_inline_trust_config_additional_trust_bundles). <a name="nested_inline_trust_config_additional_trust_bundles"></a>The `additional_trust_bundles` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trust_domain`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trust_anchors`
- Description: (Required) List of Trust Anchors to be used while performing validation against a given `TrustStore`. The incoming end entity's certificate must be chained up to one of the trust anchors here. Structure is [documented below](#nested_inline_trust_config_additional_trust_bundles_trust_store_trust_anchors). <a name="nested_inline_trust_config_additional_trust_bundles_trust_store_trust_anchors"></a>The `trust_anchors` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pem_certificate`
- Description: (Required) PEM certificate of the PKI used for validation. Must only contain one ca certificate(either root or intermediate cert).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
