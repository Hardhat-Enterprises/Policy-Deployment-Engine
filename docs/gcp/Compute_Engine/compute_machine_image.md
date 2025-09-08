## 🛡️ Policy Deployment Engine: `compute_machine_image`

This section provides a concise policy evaluation for the `compute_machine_image` resource in GCP.

Reference: [Terraform Registry – compute_machine_image](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_machine_image)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. | true | None | None |
| `source_instance` | The source instance used to create the machine image. You can provide this as a partial or full URL to the resource. | true | None | None |
| `description` | A text description of the resource. | false | None | None |
| `guest_flush` | Specify this to create an application consistent machine image by informing the OS to prepare for the snapshot process. Currently only supported on Windows instances using the Volume Shadow Copy Service (VSS). | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### machine_image_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_key` | Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. | false | None | None |
| `sha256` | (Output) The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource. | none | None | None |
| `kms_key_name` | The name of the encryption key that is stored in Google Cloud KMS. | false | None | None |
| `kms_key_service_account` | The service account used for the encryption request for the given KMS key. If absent, the Compute Engine Service Agent service account is used. | false | None | None |
