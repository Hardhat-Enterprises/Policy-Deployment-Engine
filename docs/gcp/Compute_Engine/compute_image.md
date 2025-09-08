## 🛡️ Policy Deployment Engine: `compute_image`

This section provides a concise policy evaluation for the `compute_image` resource in GCP.

Reference: [Terraform Registry – compute_image](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_image)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `storage_locations` | Cloud Storage bucket storage location of the image (regional or multi-regional). Reference link: https://cloud.google.com/compute/docs/reference/rest/v1/images | false | None | None |
| `disk_size_gb` | Size of the image when restored onto a persistent disk (in GB). | false | None | None |
| `family` | The name of the image family to which this image belongs. You can create disks by specifying an image family instead of a specific image name. The image family always returns its latest image that is not deprecated. The name of the image family must comply with RFC1035. | false | None | None |
| `labels` | Labels to apply to this Image. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `licenses` | Any applicable license URI. | false | None | None |
| `source_disk` | The source disk to create this image based on. You must provide either this property or the rawDisk.source property but not both to create an image. | false | None | None |
| `source_image` | URL of the source image used to create this image. In order to create an image, you must provide the full or partial URL of one of the following: * The selfLink URL * This property * The rawDisk.source URL * The sourceDisk URL | false | None | None |
| `source_snapshot` | URL of the source snapshot used to create this image. In order to create an image, you must provide the full or partial URL of one of the following: * The selfLink URL * This property * The sourceImage URL * The rawDisk.source URL * The sourceDisk URL | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### guest_os_features Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The type of supported feature. Read [Enabling guest operating system features](https://cloud.google.com/compute/docs/images/create-delete-deprecate-private-images#guest-os-features) to see a list of available options. Possible values are: `MULTI_IP_SUBNET`, `SECURE_BOOT`, `SEV_CAPABLE`, `UEFI_COMPATIBLE`, `VIRTIO_SCSI_MULTIQUEUE`, `WINDOWS`, `GVNIC`, `IDPF`, `SEV_LIVE_MIGRATABLE`, `SEV_SNP_CAPABLE`, `SUSPEND_RESUME_COMPATIBLE`, `TDX_CAPABLE`, `SEV_LIVE_MIGRATABLE_V2`. | true | None | None |

### image_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_self_link` | The self link of the encryption key that is stored in Google Cloud KMS. | false | None | None |
| `kms_key_service_account` | The service account being used for the encryption request for the given KMS key. If absent, the Compute Engine default service account is used. | false | None | None |
| `raw_key` | Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `rsa_encrypted_key` | Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |

### raw_disk Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `container_type` | The format used to encode and transmit the block device, which should be TAR. This is just a container and transmission format and not a runtime format. Provided by the client when the disk image is created. Default value is `TAR`. Possible values are: `TAR`. | false | None | None |
| `sha1` | An optional SHA1 checksum of the disk image before unpackaging. This is provided by the client when the disk image is created. | false | None | None |
| `source` | The full Google Cloud Storage URL where disk storage is stored You must provide either this property or the sourceDisk property but not both. | true | None | None |

### source_disk_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_key` | Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `rsa_encrypted_key` | Specifies an RFC 4648 base64 encoded, RSA-wrapped 2048-bit customer-supplied encryption key to either encrypt or decrypt this resource. You can provide either the rawKey or the rsaEncryptedKey. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `kms_key_self_link` | The self link of the encryption key used to decrypt this resource. Also called KmsKeyName in the cloud console. Your project's Compute Engine System service account (`service-{{PROJECT_NUMBER}}@compute-system.iam.gserviceaccount.com`) must have `roles/cloudkms.cryptoKeyEncrypterDecrypter` to use this feature. See https://cloud.google.com/compute/docs/disks/customer-managed-encryption#encrypt_a_new_persistent_disk_with_your_own_keys | false | None | None |
| `kms_key_service_account` | The service account being used for the encryption request for the given KMS key. If absent, the Compute Engine default service account is used. | false | None | None |

### source_image_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_key` | Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `rsa_encrypted_key` | Specifies an RFC 4648 base64 encoded, RSA-wrapped 2048-bit customer-supplied encryption key to either encrypt or decrypt this resource. You can provide either the rawKey or the rsaEncryptedKey. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `kms_key_self_link` | The self link of the encryption key used to decrypt this resource. Also called KmsKeyName in the cloud console. Your project's Compute Engine System service account (`service-{{PROJECT_NUMBER}}@compute-system.iam.gserviceaccount.com`) must have `roles/cloudkms.cryptoKeyEncrypterDecrypter` to use this feature. See https://cloud.google.com/compute/docs/disks/customer-managed-encryption#encrypt_a_new_persistent_disk_with_your_own_keys | false | None | None |
| `kms_key_service_account` | The service account being used for the encryption request for the given KMS key. If absent, the Compute Engine default service account is used. | false | None | None |

### shielded_instance_initial_state Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pk` | The Platform Key (PK). Structure is [documented below](#nested_shielded_instance_initial_state_pk). | false | None | None |
| `keks` | The Key Exchange Key (KEK). Structure is [documented below](#nested_shielded_instance_initial_state_keks). | false | None | None |
| `dbs` | The Key Database (db). Structure is [documented below](#nested_shielded_instance_initial_state_dbs). | false | None | None |
| `dbxs` | The forbidden key database (dbx). Structure is [documented below](#nested_shielded_instance_initial_state_dbxs). | false | None | None |

### source_snapshot_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_key` | Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `rsa_encrypted_key` | Specifies an RFC 4648 base64 encoded, RSA-wrapped 2048-bit customer-supplied encryption key to either encrypt or decrypt this resource. You can provide either the rawKey or the rsaEncryptedKey. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `kms_key_self_link` | The self link of the encryption key used to decrypt this resource. Also called KmsKeyName in the cloud console. Your project's Compute Engine System service account (`service-{{PROJECT_NUMBER}}@compute-system.iam.gserviceaccount.com`) must have `roles/cloudkms.cryptoKeyEncrypterDecrypter` to use this feature. See https://cloud.google.com/compute/docs/disks/customer-managed-encryption#encrypt_a_new_persistent_disk_with_your_own_keys | false | None | None |
| `kms_key_service_account` | The service account being used for the encryption request for the given KMS key. If absent, the Compute Engine default service account is used. | false | None | None |

### pk Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `content` | The raw content in the secure keys file. A base64-encoded string. | true | None | None |
| `file_type` | The file type of source file. | false | None | None |

### keks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `content` | The raw content in the secure keys file. A base64-encoded string. | true | None | None |
| `file_type` | The file type of source file. | false | None | None |

### dbs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `content` | The raw content in the secure keys file. A base64-encoded string. | true | None | None |
| `file_type` | The file type of source file. | false | None | None |

### dbxs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `content` | The raw content in the secure keys file. A base64-encoded string. | true | None | None |
| `file_type` | The file type of source file. | false | None | None |
