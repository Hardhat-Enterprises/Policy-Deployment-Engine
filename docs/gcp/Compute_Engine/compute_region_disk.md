## 🛡️ Policy Deployment Engine: `compute_region_disk`

This section provides a concise policy evaluation for the `compute_region_disk` resource in GCP.

Reference: [Terraform Registry – compute_region_disk](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_disk)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `replica_zones` | URLs of the zones where the disk should be replicated to. | true | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `labels` | Labels to apply to this disk.  A list of key->value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `size` | Size of the persistent disk, specified in GB. You can specify this field when creating a persistent disk using the sourceImage or sourceSnapshot parameter, or specify it alone to create an empty persistent disk. If you specify this field along with sourceImage or sourceSnapshot, the value of sizeGb must not be less than the size of the sourceImage or the size of the snapshot. | false | None | None |
| `physical_block_size_bytes` | Physical block size of the persistent disk, in bytes. If not present in a request, a default value is used. Currently supported sizes are 4096 and 16384, other sizes may be added in the future. If an unsupported value is requested, the error message will list the supported values for the caller's project. | false | None | None |
| `type` | URL of the disk type resource describing which disk type to use to create the disk. Provide this when creating the disk. | false | None | None |
| `interface` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html), Deprecated) Specifies the disk interface to use for attaching this disk, which is either SCSI or NVME. The default is SCSI. ~> **Warning:** `interface` is deprecated and will be removed in a future major release. This field is no longer used and can be safely removed from your configurations; disk interfaces are automatically determined on attachment. | false | None | None |
| `source_disk` | The source disk used to create this disk. You can provide this as a partial or full URL to the resource. For example, the following are valid values: * https://www.googleapis.com/compute/v1/projects/{project}/zones/{zone}/disks/{disk} * https://www.googleapis.com/compute/v1/projects/{project}/regions/{region}/disks/{disk} * projects/{project}/zones/{zone}/disks/{disk} * projects/{project}/regions/{region}/disks/{disk} * zones/{zone}/disks/{disk} * regions/{region}/disks/{disk} | false | None | None |
| `licenses` | Any applicable license URI. | false | None | None |
| `access_mode` | The access mode of the disk. For example: * READ_WRITE_SINGLE: The default AccessMode, means the disk can be attached to single instance in RW mode. * READ_WRITE_MANY: The AccessMode means the disk can be attached to multiple instances in RW mode. * READ_ONLY_SINGLE: The AccessMode means the disk can be attached to multiple instances in RO mode. The AccessMode is only valid for Hyperdisk disk types. | false | None | None |
| `provisioned_iops` | Indicates how many IOPS to provision for the disk. This sets the number of I/O operations per second that the disk can handle. Values must be between 10,000 and 120,000. For more details, see the Extreme persistent disk [documentation](https://cloud.google.com/compute/docs/disks/extreme-persistent-disk). | false | None | None |
| `provisioned_throughput` | Indicates how much throughput to provision for the disk. This sets the number of throughput mb per second that the disk can handle. Values must be greater than or equal to 1. | false | None | None |
| `region` | A reference to the region where the disk resides. | false | None | None |
| `snapshot` | The source snapshot used to create this disk. You can provide this as a partial or full URL to the resource. For example, the following are valid values: * `https://www.googleapis.com/compute/v1/projects/project/global/snapshots/snapshot` * `projects/project/global/snapshots/snapshot` * `global/snapshots/snapshot` * `snapshot` | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `create_snapshot_before_destroy` | If your disk is encrypted with customer managed encryption keys these will be reused for the snapshot creation. The name of the snapshot by default will be `{{disk-name}}-YYYYMMDD-HHmm` | none | None | None |
| `create_snapshot_before_destroy_prefix` |  | none | None | None |

### disk_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_key` | Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `rsa_encrypted_key` | Specifies an RFC 4648 base64 encoded, RSA-wrapped 2048-bit customer-supplied encryption key to either encrypt or decrypt this resource. You can provide either the rawKey or the rsaEncryptedKey. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `sha256` | (Output) The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource. | none | None | None |
| `kms_key_name` | The name of the encryption key that is stored in Google Cloud KMS. | false | None | None |

### source_snapshot_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_key` | Specifies a 256-bit customer-supplied encryption key, encoded in RFC 4648 base64 to either encrypt or decrypt this resource. | false | None | None |
| `kms_key_name` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The name of the encryption key that is stored in Google Cloud KMS. | false | None | None |
| `sha256` | (Output) The RFC 4648 base64 encoded SHA-256 hash of the customer-supplied encryption key that protects this resource. | none | None | None |

### async_primary_disk Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disk` | Primary disk for asynchronous disk replication. | true | None | None |

### guest_os_features Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The type of supported feature. Read [Enabling guest operating system features](https://cloud.google.com/compute/docs/images/create-delete-deprecate-private-images#guest-os-features) to see a list of available options. Possible values are: `MULTI_IP_SUBNET`, `SECURE_BOOT`, `SEV_CAPABLE`, `UEFI_COMPATIBLE`, `VIRTIO_SCSI_MULTIQUEUE`, `WINDOWS`, `GVNIC`, `SEV_LIVE_MIGRATABLE`, `SEV_SNP_CAPABLE`, `SUSPEND_RESUME_COMPATIBLE`, `TDX_CAPABLE`. | true | None | None |
