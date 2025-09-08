## 🛡️ Policy Deployment Engine: `kms_crypto_key`

This section provides a concise policy evaluation for the `kms_crypto_key` resource in GCP.

Reference: [Terraform Registry – kms_crypto_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name for the CryptoKey. | true | None | None |
| `key_ring` | The KeyRing that this key belongs to. Format: `'projects/{{project}}/locations/{{location}}/keyRings/{{keyRing}}'`. | true | None | None |
| `labels` | Labels with user-defined metadata to apply to this resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `purpose` | The immutable purpose of this CryptoKey. See the [purpose reference](https://cloud.google.com/kms/docs/reference/rest/v1/projects.locations.keyRings.cryptoKeys#CryptoKeyPurpose) for possible inputs. Default value is "ENCRYPT_DECRYPT". | false | None | None |
| `rotation_period` | Every time this period passes, generate a new CryptoKeyVersion and set it as the primary. The first rotation will take place after the specified period. The rotation period has the format of a decimal number with up to 9 fractional digits, followed by the letter `s` (seconds). It must be greater than a day (ie, 86400). | false | None | None |
| `destroy_scheduled_duration` | The period of time that versions of this key spend in the DESTROY_SCHEDULED state before transitioning to DESTROYED. If not specified at creation time, the default duration is 30 days. | false | None | None |
| `import_only` | Whether this key may contain imported versions only. | false | None | None |
| `crypto_key_backend` | The resource name of the backend environment associated with all CryptoKeyVersions within this CryptoKey. The resource name is in the format "projects/*/locations/*/ekmConnections/*" and only applies to "EXTERNAL_VPC" keys. | false | None | None |
| `skip_initial_version_creation` | If set to true, the request will create a CryptoKey without any CryptoKeyVersions. You must use the `google_kms_crypto_key_version` resource to create a new CryptoKeyVersion or `google_kms_key_ring_import_job` resource to import the CryptoKeyVersion. | false | None | None |

### version_template Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `algorithm` | The algorithm to use when creating a version based on this template. See the [algorithm reference](https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm) for possible inputs. | true | None | None |
| `protection_level` | The protection level to use when creating a version based on this template. Possible values include "SOFTWARE", "HSM", "EXTERNAL", "EXTERNAL_VPC". Defaults to "SOFTWARE". | false | None | None |

### key_access_justifications_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_access_reasons` | The list of allowed reasons for access to this CryptoKey. Zero allowed access reasons means all encrypt, decrypt, and sign operations for this CryptoKey will fail. | false | None | None |
