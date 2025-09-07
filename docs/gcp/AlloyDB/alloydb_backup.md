## 🛡️ Policy Deployment Engine: `alloydb_backup`

This section provides a concise policy evaluation for the `alloydb_backup` resource in GCP.

Reference: [Terraform Registry – alloydb_backup](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_backup)

---

## 1. Argument Reference

### `cluster_name`
- Description: (Required) The full resource name of the backup source cluster (e.g., projects/{project}/locations/{location}/clusters/{clusterId}).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_id`
- Description: (Required) The ID of the alloydb backup.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location where the alloydb backup should reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User-settable and human-readable display name for the Backup.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels for the alloydb backup. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The backup type, which suggests the trigger for the backup. Possible values are: `TYPE_UNSPECIFIED`, `ON_DEMAND`, `AUTOMATED`, `CONTINUOUS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-provided description of the backup.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_config`
- Description: (Optional) EncryptionConfig describes the encryption config of a cluster or a backup that is encrypted with a CMEK (customer-managed encryption key). Structure is [documented below](#nested_encryption_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Annotations to allow client tools to store small amount of arbitrary data. This is distinct from labels. https://google.aip.dev/128 An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_encryption_config"></a>The `encryption_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The fully-qualified resource name of the KMS key. Each Cloud KMS key is regionalized and has the following format: projects/[PROJECT]/locations/[REGION]/keyRings/[RING]/cryptoKeys/[KEY_NAME].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
