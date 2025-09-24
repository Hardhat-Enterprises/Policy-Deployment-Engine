## 🛡️ Policy Deployment Engine: `integrations_client`

This section provides a concise policy evaluation for the `integrations_client` resource in GCP.

Reference: [Terraform Registry – integrations_client](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integrations_client)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Location in which client needs to be provisioned. | true | true | Enforcing location restrictions to Australian regions helps maintain data compliance and reduces the risk of unauthorized data access. | australia-southeast1 | us-east1 |
| `cloud_kms_config` | Cloud KMS config for AuthModule to encrypt/decrypt credentials. Structure is [documented below](#nested_cloud_kms_config). | false | true | Cloud KMS configuration ensures that encryption keys are properly defined, located, and managed to protect sensitive credentials | Refer to child argument | Refer to child argument |
| `create_sample_integrations` | Indicates if sample integrations should be created along with provisioning. | false | false | None | None | None |
| `run_as_service_account` | , Deprecated) User input run-as service account, if empty, will bring up a new default service account. ~> **Warning:** `run_as_service_account` is deprecated and will be removed in a future major release. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |

### cloud_kms_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_location` | Location name of the key ring | true | true | Enforcing Cloud KMS keys to reside in Australian regions ensures data residency compliance and minimizes exposure risks. | australia-southeast1 | us-central1 |
| `kms_ring` | A key ring organizes keys in a specific Google Cloud location and allows you to manage access control on groups of keys. A key ring's name does not need to be unique across a Google Cloud project, but must be unique within a given location. | true | true | Restricting Cloud KMS key rings to approved names enforces consistent management and limits unauthorized key access. | my-keyring | testring |
| `key` | A Cloud KMS key is a named object containing one or more key versions, along with metadata for the key. A key exists on exactly one key ring tied to a specific location. | true | true | Only approved keys should be used to ensure encryption integrity and control access to operations. | my-key | test-key |
| `key_version` | Each version of a key contains key material used for encryption or signing. A key's version is represented by an integer, starting at 1. To decrypt data or verify a signature, you must use the same key version that was used to encrypt or sign the data. | false | false | None | None | None |
| `kms_project_id` | The Google Cloud project id of the project where the kms key stored. If empty, the kms key is stored at the same project as customer's project and ecrypted with CMEK, otherwise, the kms key is stored in the tenant project and encrypted with GMEK. | false | false | None | None | None |
