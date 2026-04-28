## 🛡️ Policy Deployment Engine: `iam_workload_identity_pool`

This section provides a concise policy evaluation for the `iam_workload_identity_pool` resource in GCP.

Reference: [Terraform Registry – iam_workload_identity_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `workload_identity_pool_id` | The ID to use for the pool, which becomes the final component of the resource name. This value should be 4-32 characters, and may contain the characters [a-z0-9-]. The prefix `gcp-` is reserved for use by Google, and may not be specified. | true | false | None | None | None |
| `display_name` | A display name for the pool. Cannot exceed 32 characters. | false | false | None | None | None |
| `description` | A description of the pool. Cannot exceed 256 characters. | false | false | None | None | None |
| `disabled` | Whether the pool is disabled. You cannot use a disabled pool to exchange tokens, or use existing tokens to access resources. If the pool is re-enabled, existing tokens grant access again. | false | false | None | None | None |
| `mode` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The mode for the pool is operating in. Pools with an unspecified mode will operate as if they are in `FEDERATION_ONLY` mode. ~> **Note** This field cannot be changed after the Workload Identity Pool is created. While `terraform plan` may show an update if you change this field's value, `terraform apply` **will fail with an API error** (such as `Error 400: Attempted to update an immutable field.`). To specify a different `mode`, please create a new Workload Identity Pool resource. * `FEDERATION_ONLY`: Pools can only be used for federating external workload identities into Google Cloud. Unless otherwise noted, no structure or format constraints are applied to workload identities in a `FEDERATION_ONLY` mode pool, and you may not create any resources within the pool besides providers. * `TRUST_DOMAIN`: Pools can be used to assign identities to Google Cloud workloads. All identities within a `TRUST_DOMAIN` mode pool must consist of a single namespace and individual workload identifier. The subject identifier for all identities must conform to the following format: `ns/<namespace>/sa/<workload_identifier>`. `google_iam_workload_identity_pool_provider`s cannot be created within `TRUST_DOMAIN` mode pools. Possible values are: `FEDERATION_ONLY`, `TRUST_DOMAIN`. | false | false | None | None | None |
| `inline_certificate_issuance_config` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Represents configuration for generating mutual TLS (mTLS) certificates for the identities within this pool. Defines the Certificate Authority (CA) pool resources and configurations required for issuance and rotation of mTLS workload certificates. Structure is [documented below](#nested_inline_certificate_issuance_config). | false | false | None | None | None |
| `inline_trust_config` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Represents config to add additional trusted trust domains. Defines configuration for extending trust to additional trust domains. By establishing trust with another domain, the current domain will recognize and accept certificates issued by entities within the trusted domains. Note that a trust domain automatically trusts itself, eliminating the need for explicit configuration. Structure is [documented below](#nested_inline_trust_config). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `additional_trust_bundles` |  | false | false | None | None | None |
| `trust_anchors` |  | false | false | None | None | None |

### inline_certificate_issuance_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ca_pools` | A required mapping of a cloud region to the CA pool resource located in that region used for certificate issuance, adhering to these constraints: * **Key format:** A supported cloud region name equivalent to the location identifier in the corresponding map entry's value. * **Value format:** A valid CA pool resource path format like: `projects/{project}/locations/{location}/caPools/{ca_pool}` * **Region Matching:** Workloads are ONLY issued certificates from CA pools within the same region. Also the CA pool region (in value) must match the workload's region (key). | true | false | None | None | None |
| `lifetime` | Lifetime of the workload certificates issued by the CA pool in seconds. Must be between `86400s` (24 hours) to `2592000s` (30 days), ends in the suffix "`s`" (indicating seconds) and is preceded by the number of seconds. If unspecified, this will be defaulted to `86400s` (24 hours). | false | false | None | None | None |
| `rotation_window_percentage` | Rotation window percentage indicating when certificate rotation should be initiated based on remaining lifetime. Must be between `50` - `80`. If unspecified, this will be defaulted to `50`. | false | false | None | None | None |
| `key_algorithm` | Key algorithm to use when generating the key pair. This key pair will be used to create the certificate. If unspecified, this will default to `ECDSA_P256`. * `RSA_2048`: Specifies RSA with a 2048-bit modulus. * `RSA_3072`: Specifies RSA with a 3072-bit modulus. * `RSA_4096`: Specifies RSA with a 4096-bit modulus. * `ECDSA_P256`: Specifies ECDSA with curve P256. * `ECDSA_P384`: Specifies ECDSA with curve P384. Possible values are: `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECDSA_P256`, `ECDSA_P384`. | false | false | None | None | None |

### inline_trust_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `additional_trust_bundles` | Maps specific trust domains (e.g., "example.com") to their corresponding `TrustStore` objects, which contain the trusted root certificates for that domain. There can be a maximum of `10` trust domain entries in this map. Note that a trust domain automatically trusts itself and don't need to be specified here. If however, this `WorkloadIdentityPool`'s trust domain contains any trust anchors in the `additional_trust_bundles` map, those trust anchors will be *appended to* the Trust Bundle automatically derived from your `InlineCertificateIssuanceConfig`'s `ca_pools`. Structure is [documented below](#nested_inline_trust_config_additional_trust_bundles). | false | false | None | None | None |

### additional_trust_bundles Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `trust_domain` |  | false | false | None | None | None |
| `trust_anchors` | List of Trust Anchors to be used while performing validation against a given `TrustStore`. The incoming end entity's certificate must be chained up to one of the trust anchors here. Structure is [documented below](#nested_inline_trust_config_additional_trust_bundles_trust_store_trust_anchors). | true | false | None | None | None |

### trust_anchors Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `pem_certificate` | PEM certificate of the PKI used for validation. Must only contain one ca certificate(either root or intermediate cert). | true | false | None | None | None |
