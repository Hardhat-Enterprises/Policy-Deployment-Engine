## 🛡️ Policy Deployment Engine: `compute_snapshot`

This section provides a concise policy evaluation for the `compute_snapshot` resource in GCP.

Reference: [Terraform Registry – compute_snapshot](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_snapshot)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `source_disk` | A reference to the disk used to create this snapshot. | true | None | None |
| `chain_name` | Creates the new snapshot in the snapshot chain labeled with the specified name. The chain name must be 1-63 characters long and comply with RFC1035. This is an uncommon option only for advanced service owners who needs to create separate snapshot chains, for example, for chargeback tracking.  When you describe your snapshot resource, this field is visible only if it has a non-empty value. | false | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `storage_locations` | Cloud Storage bucket storage location of the snapshot (regional or multi-regional). | false | None | None |
| `labels` | Labels to apply to this Snapshot. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `zone` | A reference to the zone where the disk is hosted. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### snapshot_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_key` | Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `rsa_encrypted_key` | Specifies an encryption key stored in Google Cloud KMS, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `sha256` | (Output) The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource. | none | None | None |
| `kms_key_self_link` | The name of the encryption key that is stored in Google Cloud KMS. | false | None | None |
| `kms_key_service_account` | The service account used for the encryption request for the given KMS key. If absent, the Compute Engine Service Agent service account is used. | false | None | None |

### source_disk_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_key` | Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `rsa_encrypted_key` | Specifies an encryption key stored in Google Cloud KMS, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `kms_key_self_link` | The name of the encryption key that is stored in Google Cloud KMS. | false | None | None |
| `kms_key_service_account` | The service account used for the encryption request for the given KMS key. If absent, the Compute Engine Service Agent service account is used. | false | None | None |
