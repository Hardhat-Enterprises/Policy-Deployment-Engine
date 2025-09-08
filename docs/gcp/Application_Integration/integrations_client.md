## 🛡️ Policy Deployment Engine: `integrations_client`

This section provides a concise policy evaluation for the `integrations_client` resource in GCP.

Reference: [Terraform Registry – integrations_client](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integrations_client)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Location in which client needs to be provisioned. | true | None | None |
| `create_sample_integrations` | Indicates if sample integrations should be created along with provisioning. | false | None | None |
| `run_as_service_account` | , Deprecated) User input run-as service account, if empty, will bring up a new default service account. ~> **Warning:** `run_as_service_account` is deprecated and will be removed in a future major release. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### cloud_kms_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_location` | Location name of the key ring, e.g. "us-west1". | true | None | None |
| `kms_ring` | A key ring organizes keys in a specific Google Cloud location and allows you to manage access control on groups of keys. A key ring's name does not need to be unique across a Google Cloud project, but must be unique within a given location. | true | None | None |
| `key` | A Cloud KMS key is a named object containing one or more key versions, along with metadata for the key. A key exists on exactly one key ring tied to a specific location. | true | None | None |
| `key_version` | Each version of a key contains key material used for encryption or signing. A key's version is represented by an integer, starting at 1. To decrypt data or verify a signature, you must use the same key version that was used to encrypt or sign the data. | false | None | None |
| `kms_project_id` | The Google Cloud project id of the project where the kms key stored. If empty, the kms key is stored at the same project as customer's project and ecrypted with CMEK, otherwise, the kms key is stored in the tenant project and encrypted with GMEK. | false | None | None |
