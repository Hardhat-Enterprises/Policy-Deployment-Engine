## 🛡️ Policy Deployment Engine: `compute_snapshot`

This section provides a concise policy evaluation for the `compute_snapshot` resource in GCP.

Reference: [Terraform Registry – compute_snapshot](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_snapshot)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_disk`
- Description: (Required) A reference to the disk used to create this snapshot.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `chain_name`
- Description: (Optional) Creates the new snapshot in the snapshot chain labeled with the specified name. The chain name must be 1-63 characters long and comply with RFC1035. This is an uncommon option only for advanced service owners who needs to create separate snapshot chains, for example, for chargeback tracking.  When you describe your snapshot resource, this field is visible only if it has a non-empty value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_locations`
- Description: (Optional) Cloud Storage bucket storage location of the snapshot (regional or multi-regional).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels to apply to this Snapshot. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) A reference to the zone where the disk is hosted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `snapshot_encryption_key`
- Description: (Optional) Encrypts the snapshot using a customer-supplied encryption key. After you encrypt a snapshot using a customer-supplied key, you must provide the same key if you use the snapshot later. For example, you must provide the encryption key when you create a disk from the encrypted snapshot in a future request. Customer-supplied encryption keys do not protect access to metadata of the snapshot. If you do not provide an encryption key when creating the snapshot, then the snapshot will be encrypted using an automatically generated key and you do not need to provide a key to use the snapshot later. Structure is [documented below](#nested_snapshot_encryption_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_disk_encryption_key`
- Description: (Optional) The customer-supplied encryption key of the source snapshot. Required if the source snapshot is protected by a customer-supplied encryption key. Structure is [documented below](#nested_source_disk_encryption_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_snapshot_encryption_key"></a>The `snapshot_encryption_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `raw_key`
- Description: (Optional) Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rsa_encrypted_key`
- Description: (Optional) Specifies an encryption key stored in Google Cloud KMS, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha256`
- Description: (Output) The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_self_link`
- Description: (Optional) The name of the encryption key that is stored in Google Cloud KMS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_service_account`
- Description: (Optional) The service account used for the encryption request for the given KMS key. If absent, the Compute Engine Service Agent service account is used. <a name="nested_source_disk_encryption_key"></a>The `source_disk_encryption_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `raw_key`
- Description: (Optional) Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rsa_encrypted_key`
- Description: (Optional) Specifies an encryption key stored in Google Cloud KMS, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_self_link`
- Description: (Optional) The name of the encryption key that is stored in Google Cloud KMS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_service_account`
- Description: (Optional) The service account used for the encryption request for the given KMS key. If absent, the Compute Engine Service Agent service account is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
