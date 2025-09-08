## 🛡️ Policy Deployment Engine: `compute_disk`

This section provides a concise policy evaluation for the `compute_disk` resource in GCP.

Reference: [Terraform Registry – compute_disk](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `source_instant_snapshot` | The source instant snapshot used to create this disk. You can provide this as a partial or full URL to the resource. For example, the following are valid values: * `https://www.googleapis.com/compute/v1/projects/project/zones/zone/instantSnapshots/instantSnapshot` * `projects/project/zones/zone/instantSnapshots/instantSnapshot` * `zones/zone/instantSnapshots/instantSnapshot` | false | None | None |
| `source_storage_object` | The full Google Cloud Storage URI where the disk image is stored. This file must be a gzip-compressed tarball whose name ends in .tar.gz or virtual machine disk whose name ends in vmdk. Valid URIs may start with gs:// or https://storage.googleapis.com/. This flag is not optimized for creating multiple disks from a source storage object. To create many disks from a source storage object, use gcloud compute images import instead. | false | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `labels` | Labels to apply to this disk.  A list of key->value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `size` | Size of the persistent disk, specified in GB. You can specify this field when creating a persistent disk using the `image` or `snapshot` parameter, or specify it alone to create an empty persistent disk. If you specify this field along with `image` or `snapshot`, the value must not be less than the size of the image or the size of the snapshot. ~>**NOTE** If you change the size, Terraform updates the disk size if upsizing is detected but recreates the disk if downsizing is requested. You can add `lifecycle.prevent_destroy` in the config to prevent destroying and recreating. | false | None | None |
| `physical_block_size_bytes` | Physical block size of the persistent disk, in bytes. If not present in a request, a default value is used. Currently supported sizes are 4096 and 16384, other sizes may be added in the future. If an unsupported value is requested, the error message will list the supported values for the caller's project. | false | None | None |
| `interface` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html), Deprecated) Specifies the disk interface to use for attaching this disk, which is either SCSI or NVME. The default is SCSI. ~> **Warning:** `interface` is deprecated and will be removed in a future major release. This field is no longer used and can be safely removed from your configurations; disk interfaces are automatically determined on attachment. | false | None | None |
| `source_disk` | The source disk used to create this disk. You can provide this as a partial or full URL to the resource. For example, the following are valid values: * https://www.googleapis.com/compute/v1/projects/{project}/zones/{zone}/disks/{disk} * https://www.googleapis.com/compute/v1/projects/{project}/regions/{region}/disks/{disk} * projects/{project}/zones/{zone}/disks/{disk} * projects/{project}/regions/{region}/disks/{disk} * zones/{zone}/disks/{disk} * regions/{region}/disks/{disk} | false | None | None |
| `type` | URL of the disk type resource describing which disk type to use to create the disk. Provide this when creating the disk. | false | None | None |
| `image` | The image from which to initialize this disk. This can be one of: the image's `self_link`, `projects/{project}/global/images/{image}`, `projects/{project}/global/images/family/{family}`, `global/images/{image}`, `global/images/family/{family}`, `family/{family}`, `{project}/{family}`, `{project}/{image}`, `{family}`, or `{image}`. If referred by family, the images names must include the family name. If they don't, use the [google_compute_image data source](/docs/providers/google/d/compute_image.html). For instance, the image `centos-6-v20180104` includes its family name `centos-6`. These images can be referred by family name here. | false | None | None |
| `resource_policies` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Resource policies applied to this disk for automatic snapshot creations. ~>**NOTE** This value does not support updating the resource policy, as resource policies can not be updated more than one at a time. Use [`google_compute_disk_resource_policy_attachment`](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk_resource_policy_attachment) to allow for updating the resource policy attached to the disk. | false | None | None |
| `enable_confidential_compute` | Whether this disk is using confidential compute mode. Note: Only supported on hyperdisk skus, disk_encryption_key is required when setting to true | false | None | None |
| `multi_writer` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Indicates whether or not the disk can be read/write attached to more than one instance. | false | None | None |
| `provisioned_iops` | Indicates how many IOPS must be provisioned for the disk. Note: Updating currently is only supported by hyperdisk skus without the need to delete and recreate the disk, hyperdisk allows for an update of IOPS every 4 hours. To update your hyperdisk more frequently, you'll need to manually delete and recreate it | false | None | None |
| `provisioned_throughput` | Indicates how much Throughput must be provisioned for the disk. Note: Updating currently is only supported by hyperdisk skus without the need to delete and recreate the disk, hyperdisk allows for an update of Throughput every 4 hours. To update your hyperdisk more frequently, you'll need to manually delete and recreate it | false | None | None |
| `architecture` | The architecture of the disk. Values include `X86_64`, `ARM64`. | false | None | None |
| `licenses` | Any applicable license URI. | false | None | None |
| `storage_pool` | The URL or the name of the storage pool in which the new disk is created. For example: * https://www.googleapis.com/compute/v1/projects/{project}/zones/{zone}/storagePools/{storagePool} * /projects/{project}/zones/{zone}/storagePools/{storagePool} * /zones/{zone}/storagePools/{storagePool} * /{storagePool} | false | None | None |
| `access_mode` | The access mode of the disk. For example: * READ_WRITE_SINGLE: The default AccessMode, means the disk can be attached to single instance in RW mode. * READ_WRITE_MANY: The AccessMode means the disk can be attached to multiple instances in RW mode. * READ_ONLY_SINGLE: The AccessMode means the disk can be attached to multiple instances in RO mode. The AccessMode is only valid for Hyperdisk disk types. | false | None | None |
| `zone` | A reference to the zone where the disk resides. | false | None | None |
| `snapshot` | The source snapshot used to create this disk. You can provide this as a partial or full URL to the resource. If the snapshot is in another project than this disk, you must supply a full URL. For example, the following are valid values: * `https://www.googleapis.com/compute/v1/projects/project/global/snapshots/snapshot` * `projects/project/global/snapshots/snapshot` * `global/snapshots/snapshot` * `snapshot` | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `create_snapshot_before_destroy` | If your disk is encrypted with customer managed encryption keys these will be reused for the snapshot creation. The name of the snapshot by default will be `{{disk-name}}-YYYYMMDD-HHmm` | none | None | None |
| `create_snapshot_before_destroy_prefix` |  | none | None | None |

### source_image_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_key` | Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. | false | None | None |
| `sha256` | (Output) The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource. | none | None | None |
| `kms_key_self_link` | The self link of the encryption key used to encrypt the disk. Also called KmsKeyName in the cloud console. Your project's Compute Engine System service account (`service-{{PROJECT_NUMBER}}@compute-system.iam.gserviceaccount.com`) must have `roles/cloudkms.cryptoKeyEncrypterDecrypter` to use this feature. See https://cloud.google.com/compute/docs/disks/customer-managed-encryption#encrypt_a_new_persistent_disk_with_your_own_keys | false | None | None |
| `kms_key_service_account` | The service account used for the encryption request for the given KMS key. If absent, the Compute Engine Service Agent service account is used. | false | None | None |

### disk_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_key` | Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `rsa_encrypted_key` | Specifies an RFC 4648 base64 encoded, RSA-wrapped 2048-bit customer-supplied encryption key to either encrypt or decrypt this resource. You can provide either the rawKey or the rsaEncryptedKey. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `sha256` | (Output) The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource. | none | None | None |
| `kms_key_self_link` | The self link of the encryption key used to encrypt the disk. Also called KmsKeyName in the cloud console. Your project's Compute Engine System service account (`service-{{PROJECT_NUMBER}}@compute-system.iam.gserviceaccount.com`) must have `roles/cloudkms.cryptoKeyEncrypterDecrypter` to use this feature. See https://cloud.google.com/compute/docs/disks/customer-managed-encryption#encrypt_a_new_persistent_disk_with_your_own_keys | false | None | None |
| `kms_key_service_account` | The service account used for the encryption request for the given KMS key. If absent, the Compute Engine Service Agent service account is used. | false | None | None |

### source_snapshot_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_key` | Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. | false | None | None |
| `kms_key_self_link` | The self link of the encryption key used to encrypt the disk. Also called KmsKeyName in the cloud console. Your project's Compute Engine System service account (`service-{{PROJECT_NUMBER}}@compute-system.iam.gserviceaccount.com`) must have `roles/cloudkms.cryptoKeyEncrypterDecrypter` to use this feature. See https://cloud.google.com/compute/docs/disks/customer-managed-encryption#encrypt_a_new_persistent_disk_with_your_own_keys | false | None | None |
| `sha256` | (Output) The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource. | none | None | None |
| `kms_key_service_account` | The service account used for the encryption request for the given KMS key. If absent, the Compute Engine Service Agent service account is used. | false | None | None |

### async_primary_disk Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disk` | Primary disk for asynchronous disk replication. | true | None | None |

### params Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource_manager_tags` | Resource manager tags to be bound to the disk. Tag keys and values have the same definition as resource manager tags. Keys must be in the format tagKeys/{tag_key_id}, and values are in the format tagValues/456. | false | None | None |

### guest_os_features Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The type of supported feature. Read [Enabling guest operating system features](https://cloud.google.com/compute/docs/images/create-delete-deprecate-private-images#guest-os-features) to see a list of available options. | true | None | None |
