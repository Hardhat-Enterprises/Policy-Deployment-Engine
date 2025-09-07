## 🛡️ Policy Deployment Engine: `kms_crypto_key`

This section provides a concise policy evaluation for the `kms_crypto_key` resource in GCP.

Reference: [Terraform Registry – kms_crypto_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name for the CryptoKey.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_ring`
- Description: (Required) The KeyRing that this key belongs to. Format: `'projects/{{project}}/locations/{{location}}/keyRings/{{keyRing}}'`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels with user-defined metadata to apply to this resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `purpose`
- Description: (Optional) The immutable purpose of this CryptoKey. See the [purpose reference](https://cloud.google.com/kms/docs/reference/rest/v1/projects.locations.keyRings.cryptoKeys#CryptoKeyPurpose) for possible inputs. Default value is "ENCRYPT_DECRYPT".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rotation_period`
- Description: (Optional) Every time this period passes, generate a new CryptoKeyVersion and set it as the primary. The first rotation will take place after the specified period. The rotation period has the format of a decimal number with up to 9 fractional digits, followed by the letter `s` (seconds). It must be greater than a day (ie, 86400).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version_template`
- Description: (Optional) A template describing settings for new crypto key versions. Structure is [documented below](#nested_version_template).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destroy_scheduled_duration`
- Description: (Optional) The period of time that versions of this key spend in the DESTROY_SCHEDULED state before transitioning to DESTROYED. If not specified at creation time, the default duration is 30 days.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `import_only`
- Description: (Optional) Whether this key may contain imported versions only.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `crypto_key_backend`
- Description: (Optional) The resource name of the backend environment associated with all CryptoKeyVersions within this CryptoKey. The resource name is in the format "projects/*/locations/*/ekmConnections/*" and only applies to "EXTERNAL_VPC" keys.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_access_justifications_policy`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The policy used for Key Access Justifications Policy Enforcement. If this field is present and this key is enrolled in Key Access Justifications Policy Enforcement, the policy will be evaluated in encrypt, decrypt, and sign operations, and the operation will fail if rejected by the policy. The policy is defined by specifying zero or more allowed justification codes. https://cloud.google.com/assured-workloads/key-access-justifications/docs/justification-codes By default, this field is absent, and all justification codes are allowed. This field is currently in beta and is subject to change. Structure is [documented below](#nested_key_access_justifications_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `skip_initial_version_creation`
- Description: (Optional) If set to true, the request will create a CryptoKey without any CryptoKeyVersions. You must use the `google_kms_crypto_key_version` resource to create a new CryptoKeyVersion or `google_kms_key_ring_import_job` resource to import the CryptoKeyVersion. <a name="nested_version_template"></a>The `version_template` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `algorithm`
- Description: (Required) The algorithm to use when creating a version based on this template. See the [algorithm reference](https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm) for possible inputs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `protection_level`
- Description: (Optional) The protection level to use when creating a version based on this template. Possible values include "SOFTWARE", "HSM", "EXTERNAL", "EXTERNAL_VPC". Defaults to "SOFTWARE". <a name="nested_key_access_justifications_policy"></a>The `key_access_justifications_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_access_reasons`
- Description: (Optional) The list of allowed reasons for access to this CryptoKey. Zero allowed access reasons means all encrypt, decrypt, and sign operations for this CryptoKey will fail.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
