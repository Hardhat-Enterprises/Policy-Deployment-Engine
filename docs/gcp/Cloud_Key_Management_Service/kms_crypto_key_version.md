## 🛡️ Policy Deployment Engine: `kms_crypto_key_version`

This section provides a concise policy evaluation for the `kms_crypto_key_version` resource in GCP.

Reference: [Terraform Registry – kms_crypto_key_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key_version)

---

## 1. Argument Reference

### `crypto_key`
- Description: (Required) The name of the cryptoKey associated with the CryptoKeyVersions. Format: `'projects/{{project}}/locations/{{location}}/keyRings/{{keyring}}/cryptoKeys/{{cryptoKey}}'`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Optional) The current state of the CryptoKeyVersion. Note: you can only specify this field to manually `ENABLE` or `DISABLE` the CryptoKeyVersion, otherwise the value of this field is always retrieved automatically. Possible values are: `PENDING_GENERATION`, `ENABLED`, `DISABLED`, `DESTROYED`, `DESTROY_SCHEDULED`, `PENDING_IMPORT`, `IMPORT_FAILED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_protection_level_options`
- Description: (Optional) ExternalProtectionLevelOptions stores a group of additional fields for configuring a CryptoKeyVersion that are specific to the EXTERNAL protection level and EXTERNAL_VPC protection levels. Structure is [documented below](#nested_external_protection_level_options). <a name="nested_external_protection_level_options"></a>The `external_protection_level_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_key_uri`
- Description: (Optional) The URI for an external resource that this CryptoKeyVersion represents.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ekm_connection_key_path`
- Description: (Optional) The path to the external key material on the EKM when using EkmConnection e.g., "v0/my/key". Set this field instead of externalKeyUri when using an EkmConnection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
