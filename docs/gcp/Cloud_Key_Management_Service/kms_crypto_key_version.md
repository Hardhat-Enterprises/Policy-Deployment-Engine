## 🛡️ Policy Deployment Engine: `kms_crypto_key_version`

This section provides a concise policy evaluation for the `kms_crypto_key_version` resource in GCP.

Reference: [Terraform Registry – kms_crypto_key_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key_version)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `crypto_key` | The name of the cryptoKey associated with the CryptoKeyVersions. Format: `'projects/{{project}}/locations/{{location}}/keyRings/{{keyring}}/cryptoKeys/{{cryptoKey}}'` | true | None | None |
| `state` | The current state of the CryptoKeyVersion. Note: you can only specify this field to manually `ENABLE` or `DISABLE` the CryptoKeyVersion, otherwise the value of this field is always retrieved automatically. Possible values are: `PENDING_GENERATION`, `ENABLED`, `DISABLED`, `DESTROYED`, `DESTROY_SCHEDULED`, `PENDING_IMPORT`, `IMPORT_FAILED`. | false | None | None |

### external_protection_level_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `external_key_uri` | The URI for an external resource that this CryptoKeyVersion represents. | false | None | None |
| `ekm_connection_key_path` | The path to the external key material on the EKM when using EkmConnection e.g., "v0/my/key". Set this field instead of externalKeyUri when using an EkmConnection. | false | None | None |
