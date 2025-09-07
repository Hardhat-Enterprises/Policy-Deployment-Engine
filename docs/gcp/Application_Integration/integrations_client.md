## 🛡️ Policy Deployment Engine: `integrations_client`

This section provides a concise policy evaluation for the `integrations_client` resource in GCP.

Reference: [Terraform Registry – integrations_client](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integrations_client)

---

## 1. Argument Reference

### `location`
- Description: (Required) Location in which client needs to be provisioned.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_kms_config`
- Description: (Optional) Cloud KMS config for AuthModule to encrypt/decrypt credentials. Structure is [documented below](#nested_cloud_kms_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_sample_integrations`
- Description: (Optional) Indicates if sample integrations should be created along with provisioning.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run_as_service_account`
- Description: (Optional, Deprecated) User input run-as service account, if empty, will bring up a new default service account. ~> **Warning:** `run_as_service_account` is deprecated and will be removed in a future major release.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_cloud_kms_config"></a>The `cloud_kms_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_location`
- Description: (Required) Location name of the key ring, e.g. "us-west1".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_ring`
- Description: (Required) A key ring organizes keys in a specific Google Cloud location and allows you to manage access control on groups of keys. A key ring's name does not need to be unique across a Google Cloud project, but must be unique within a given location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) A Cloud KMS key is a named object containing one or more key versions, along with metadata for the key. A key exists on exactly one key ring tied to a specific location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_version`
- Description: (Optional) Each version of a key contains key material used for encryption or signing. A key's version is represented by an integer, starting at 1. To decrypt data or verify a signature, you must use the same key version that was used to encrypt or sign the data.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_project_id`
- Description: (Optional) The Google Cloud project id of the project where the kms key stored. If empty, the kms key is stored at the same project as customer's project and ecrypted with CMEK, otherwise, the kms key is stored in the tenant project and encrypted with GMEK.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
