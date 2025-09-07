## 🛡️ Policy Deployment Engine: `compute_image`

This section provides a concise policy evaluation for the `compute_image` resource in GCP.

Reference: [Terraform Registry – compute_image](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_image)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. Provide this property when you create the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_locations`
- Description: (Optional) Cloud Storage bucket storage location of the image (regional or multi-regional). Reference link: https://cloud.google.com/compute/docs/reference/rest/v1/images
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_size_gb`
- Description: (Optional) Size of the image when restored onto a persistent disk (in GB).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `family`
- Description: (Optional) The name of the image family to which this image belongs. You can create disks by specifying an image family instead of a specific image name. The image family always returns its latest image that is not deprecated. The name of the image family must comply with RFC1035.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `guest_os_features`
- Description: (Optional) A list of features to enable on the guest operating system. Applicable only for bootable images. Structure is [documented below](#nested_guest_os_features).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_encryption_key`
- Description: (Optional) Encrypts the image using a customer-supplied encryption key. After you encrypt an image with a customer-supplied key, you must provide the same key if you use the image later (e.g. to create a disk from the image) Structure is [documented below](#nested_image_encryption_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels to apply to this Image. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `licenses`
- Description: (Optional) Any applicable license URI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `raw_disk`
- Description: (Optional) The parameters of the raw disk image. Structure is [documented below](#nested_raw_disk).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_disk`
- Description: (Optional) The source disk to create this image based on. You must provide either this property or the rawDisk.source property but not both to create an image.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_disk_encryption_key`
- Description: (Optional) The customer-supplied encryption key of the source disk. Required if the source disk is protected by a customer-supplied encryption key. Structure is [documented below](#nested_source_disk_encryption_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_image`
- Description: (Optional) URL of the source image used to create this image. In order to create an image, you must provide the full or partial URL of one of the following: * The selfLink URL * This property * The rawDisk.source URL * The sourceDisk URL
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_image_encryption_key`
- Description: (Optional) The customer-supplied encryption key of the source image. Required if the source image is protected by a customer-supplied encryption key. Structure is [documented below](#nested_source_image_encryption_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_snapshot`
- Description: (Optional) URL of the source snapshot used to create this image. In order to create an image, you must provide the full or partial URL of one of the following: * The selfLink URL * This property * The sourceImage URL * The rawDisk.source URL * The sourceDisk URL
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shielded_instance_initial_state`
- Description: (Optional) Set the secure boot keys of shielded instance. Structure is [documented below](#nested_shielded_instance_initial_state).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_snapshot_encryption_key`
- Description: (Optional) The customer-supplied encryption key of the source snapshot. Required if the source snapshot is protected by a customer-supplied encryption key. Structure is [documented below](#nested_source_snapshot_encryption_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_guest_os_features"></a>The `guest_os_features` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) The type of supported feature. Read [Enabling guest operating system features](https://cloud.google.com/compute/docs/images/create-delete-deprecate-private-images#guest-os-features) to see a list of available options. Possible values are: `MULTI_IP_SUBNET`, `SECURE_BOOT`, `SEV_CAPABLE`, `UEFI_COMPATIBLE`, `VIRTIO_SCSI_MULTIQUEUE`, `WINDOWS`, `GVNIC`, `IDPF`, `SEV_LIVE_MIGRATABLE`, `SEV_SNP_CAPABLE`, `SUSPEND_RESUME_COMPATIBLE`, `TDX_CAPABLE`, `SEV_LIVE_MIGRATABLE_V2`. <a name="nested_image_encryption_key"></a>The `image_encryption_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_self_link`
- Description: (Optional) The self link of the encryption key that is stored in Google Cloud KMS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_service_account`
- Description: (Optional) The service account being used for the encryption request for the given KMS key. If absent, the Compute Engine default service account is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `raw_key`
- Description: (Optional) Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rsa_encrypted_key`
- Description: (Optional) Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan. <a name="nested_raw_disk"></a>The `raw_disk` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_type`
- Description: (Optional) The format used to encode and transmit the block device, which should be TAR. This is just a container and transmission format and not a runtime format. Provided by the client when the disk image is created. Default value is `TAR`. Possible values are: `TAR`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha1`
- Description: (Optional) An optional SHA1 checksum of the disk image before unpackaging. This is provided by the client when the disk image is created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: (Required) The full Google Cloud Storage URL where disk storage is stored You must provide either this property or the sourceDisk property but not both. <a name="nested_source_disk_encryption_key"></a>The `source_disk_encryption_key` block supports:
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

### `kms_key_self_link`
- Description: (Optional) The self link of the encryption key used to decrypt this resource. Also called KmsKeyName in the cloud console. Your project's Compute Engine System service account (`service-{{PROJECT_NUMBER}}@compute-system.iam.gserviceaccount.com`) must have `roles/cloudkms.cryptoKeyEncrypterDecrypter` to use this feature. See https://cloud.google.com/compute/docs/disks/customer-managed-encryption#encrypt_a_new_persistent_disk_with_your_own_keys
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_service_account`
- Description: (Optional) The service account being used for the encryption request for the given KMS key. If absent, the Compute Engine default service account is used. <a name="nested_source_image_encryption_key"></a>The `source_image_encryption_key` block supports:
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

### `kms_key_self_link`
- Description: (Optional) The self link of the encryption key used to decrypt this resource. Also called KmsKeyName in the cloud console. Your project's Compute Engine System service account (`service-{{PROJECT_NUMBER}}@compute-system.iam.gserviceaccount.com`) must have `roles/cloudkms.cryptoKeyEncrypterDecrypter` to use this feature. See https://cloud.google.com/compute/docs/disks/customer-managed-encryption#encrypt_a_new_persistent_disk_with_your_own_keys
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_service_account`
- Description: (Optional) The service account being used for the encryption request for the given KMS key. If absent, the Compute Engine default service account is used. <a name="nested_shielded_instance_initial_state"></a>The `shielded_instance_initial_state` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pk`
- Description: (Optional) The Platform Key (PK). Structure is [documented below](#nested_shielded_instance_initial_state_pk).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `keks`
- Description: (Optional) The Key Exchange Key (KEK). Structure is [documented below](#nested_shielded_instance_initial_state_keks).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dbs`
- Description: (Optional) The Key Database (db). Structure is [documented below](#nested_shielded_instance_initial_state_dbs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dbxs`
- Description: (Optional) The forbidden key database (dbx). Structure is [documented below](#nested_shielded_instance_initial_state_dbxs). <a name="nested_shielded_instance_initial_state_pk"></a>The `pk` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content`
- Description: (Required) The raw content in the secure keys file. A base64-encoded string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_type`
- Description: (Optional) The file type of source file. <a name="nested_shielded_instance_initial_state_keks"></a>The `keks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content`
- Description: (Required) The raw content in the secure keys file. A base64-encoded string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_type`
- Description: (Optional) The file type of source file. <a name="nested_shielded_instance_initial_state_dbs"></a>The `dbs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content`
- Description: (Required) The raw content in the secure keys file. A base64-encoded string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_type`
- Description: (Optional) The file type of source file. <a name="nested_shielded_instance_initial_state_dbxs"></a>The `dbxs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content`
- Description: (Required) The raw content in the secure keys file. A base64-encoded string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_type`
- Description: (Optional) The file type of source file. <a name="nested_source_snapshot_encryption_key"></a>The `source_snapshot_encryption_key` block supports:
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

### `kms_key_self_link`
- Description: (Optional) The self link of the encryption key used to decrypt this resource. Also called KmsKeyName in the cloud console. Your project's Compute Engine System service account (`service-{{PROJECT_NUMBER}}@compute-system.iam.gserviceaccount.com`) must have `roles/cloudkms.cryptoKeyEncrypterDecrypter` to use this feature. See https://cloud.google.com/compute/docs/disks/customer-managed-encryption#encrypt_a_new_persistent_disk_with_your_own_keys
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_service_account`
- Description: (Optional) The service account being used for the encryption request for the given KMS key. If absent, the Compute Engine default service account is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
