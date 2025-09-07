## 🛡️ Policy Deployment Engine: `compute_region_disk`

This section provides a concise policy evaluation for the `compute_region_disk` resource in GCP.

Reference: [Terraform Registry – compute_region_disk](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_disk)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replica_zones`
- Description: (Required) URLs of the zones where the disk should be replicated to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_encryption_key`
- Description: (Optional) Encrypts the disk using a customer-supplied encryption key. After you encrypt a disk with a customer-supplied key, you must provide the same key if you use the disk later (e.g. to create a disk snapshot or an image, or to attach the disk to a virtual machine). Customer-supplied encryption keys do not protect access to metadata of the disk. If you do not provide an encryption key when creating the disk, then the disk will be encrypted using an automatically generated key and you do not need to provide a key to use the disk later. Structure is [documented below](#nested_disk_encryption_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_snapshot_encryption_key`
- Description: (Optional) The customer-supplied encryption key of the source snapshot. Required if the source snapshot is protected by a customer-supplied encryption key. Structure is [documented below](#nested_source_snapshot_encryption_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. Provide this property when you create the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels to apply to this disk.  A list of key->value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `size`
- Description: (Optional) Size of the persistent disk, specified in GB. You can specify this field when creating a persistent disk using the sourceImage or sourceSnapshot parameter, or specify it alone to create an empty persistent disk. If you specify this field along with sourceImage or sourceSnapshot, the value of sizeGb must not be less than the size of the sourceImage or the size of the snapshot.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `physical_block_size_bytes`
- Description: (Optional) Physical block size of the persistent disk, in bytes. If not present in a request, a default value is used. Currently supported sizes are 4096 and 16384, other sizes may be added in the future. If an unsupported value is requested, the error message will list the supported values for the caller's project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) URL of the disk type resource describing which disk type to use to create the disk. Provide this when creating the disk.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interface`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html), Deprecated) Specifies the disk interface to use for attaching this disk, which is either SCSI or NVME. The default is SCSI. ~> **Warning:** `interface` is deprecated and will be removed in a future major release. This field is no longer used and can be safely removed from your configurations; disk interfaces are automatically determined on attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_disk`
- Description: (Optional) The source disk used to create this disk. You can provide this as a partial or full URL to the resource. For example, the following are valid values: * https://www.googleapis.com/compute/v1/projects/{project}/zones/{zone}/disks/{disk} * https://www.googleapis.com/compute/v1/projects/{project}/regions/{region}/disks/{disk} * projects/{project}/zones/{zone}/disks/{disk} * projects/{project}/regions/{region}/disks/{disk} * zones/{zone}/disks/{disk} * regions/{region}/disks/{disk}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `async_primary_disk`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_async_primary_disk).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `guest_os_features`
- Description: (Optional) A list of features to enable on the guest operating system. Applicable only for bootable disks. Structure is [documented below](#nested_guest_os_features).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `licenses`
- Description: (Optional) Any applicable license URI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_mode`
- Description: (Optional) The access mode of the disk. For example: * READ_WRITE_SINGLE: The default AccessMode, means the disk can be attached to single instance in RW mode. * READ_WRITE_MANY: The AccessMode means the disk can be attached to multiple instances in RW mode. * READ_ONLY_SINGLE: The AccessMode means the disk can be attached to multiple instances in RO mode. The AccessMode is only valid for Hyperdisk disk types.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provisioned_iops`
- Description: (Optional) Indicates how many IOPS to provision for the disk. This sets the number of I/O operations per second that the disk can handle. Values must be between 10,000 and 120,000. For more details, see the Extreme persistent disk [documentation](https://cloud.google.com/compute/docs/disks/extreme-persistent-disk).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provisioned_throughput`
- Description: (Optional) Indicates how much throughput to provision for the disk. This sets the number of throughput mb per second that the disk can handle. Values must be greater than or equal to 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) A reference to the region where the disk resides.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `snapshot`
- Description: (Optional) The source snapshot used to create this disk. You can provide this as a partial or full URL to the resource. For example, the following are valid values:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_snapshot_before_destroy`
- Description: If your disk is encrypted with customer managed encryption keys these will be reused for the snapshot creation. The name of the snapshot by default will be `{{disk-name}}-YYYYMMDD-HHmm`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_snapshot_before_destroy_prefix`
- Description: <a name="nested_disk_encryption_key"></a>The `disk_encryption_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `raw_key`
- Description: (Optional) Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rsa_encrypted_key`
- Description: (Optional) Specifies an RFC 4648 base64 encoded, RSA-wrapped 2048-bit customer-supplied encryption key to either encrypt or decrypt this resource. You can provide either the rawKey or the rsaEncryptedKey. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha256`
- Description: (Output) The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The name of the encryption key that is stored in Google Cloud KMS. <a name="nested_source_snapshot_encryption_key"></a>The `source_snapshot_encryption_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `raw_key`
- Description: (Optional) Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The name of the encryption key that is stored in Google Cloud KMS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha256`
- Description: (Output) The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource. <a name="nested_async_primary_disk"></a>The `async_primary_disk` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk`
- Description: (Required) Primary disk for asynchronous disk replication. <a name="nested_guest_os_features"></a>The `guest_os_features` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) The type of supported feature. Read [Enabling guest operating system features](https://cloud.google.com/compute/docs/images/create-delete-deprecate-private-images#guest-os-features) to see a list of available options. Possible values are: `MULTI_IP_SUBNET`, `SECURE_BOOT`, `SEV_CAPABLE`, `UEFI_COMPATIBLE`, `VIRTIO_SCSI_MULTIQUEUE`, `WINDOWS`, `GVNIC`, `SEV_LIVE_MIGRATABLE`, `SEV_SNP_CAPABLE`, `SUSPEND_RESUME_COMPATIBLE`, `TDX_CAPABLE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
