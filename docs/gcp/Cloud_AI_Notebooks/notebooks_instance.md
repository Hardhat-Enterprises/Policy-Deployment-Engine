## 🛡️ Policy Deployment Engine: `notebooks_instance`

This section provides a concise policy evaluation for the `notebooks_instance` resource in GCP.

Reference: [Terraform Registry – notebooks_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/notebooks_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name specified for the Notebook instance. | true | None | None |
| `machine_type` | A reference to a machine type which defines VM kind. | true | None | None |
| `location` | A reference to the zone where the machine resides. | true | None | None |
| `post_startup_script` | Path to a Bash script that automatically runs after a notebook instance fully boots up. The path must be a URL or Cloud Storage path (gs://path-to-file/file-name). | false | None | None |
| `instance_owners` | The list of owners of this instance after creation. Format: alias@example.com. Currently supports one owner only. If not specified, all of the service account users of your VM instance's service account can use the instance. | false | None | None |
| `service_account` | The service account on this instance, giving access to other Google Cloud services. You can use any service account within the same project, but you must have the service account user permission to use the instance. If not specified, the Compute Engine default service account is used. | false | None | None |
| `service_account_scopes` | Optional. The URIs of service account scopes to be included in Compute Engine instances. If not specified, the following scopes are defined: - https://www.googleapis.com/auth/cloud-platform - https://www.googleapis.com/auth/userinfo.email | false | None | None |
| `nic_type` | The type of vNIC driver. Possible values are: `UNSPECIFIED_NIC_TYPE`, `VIRTIO_NET`, `GVNIC`. | false | None | None |
| `install_gpu_driver` | Whether the end user authorizes Google Cloud to install GPU driver on this instance. If this field is empty or set to false, the GPU driver won't be installed. Only applicable to instances with GPUs. | false | None | None |
| `custom_gpu_driver_path` | Specify a custom Cloud Storage path where the GPU driver is stored. If not specified, we'll automatically choose from official GPU drivers. | false | None | None |
| `boot_disk_type` | Possible disk types for notebook instances. Possible values are: `DISK_TYPE_UNSPECIFIED`, `PD_STANDARD`, `PD_SSD`, `PD_BALANCED`, `PD_EXTREME`. | false | None | None |
| `boot_disk_size_gb` | The size of the boot disk in GB attached to this instance, up to a maximum of 64000 GB (64 TB). The minimum recommended value is 100 GB. If not specified, this defaults to 100. | false | None | None |
| `data_disk_type` | Possible disk types for notebook instances. Possible values are: `DISK_TYPE_UNSPECIFIED`, `PD_STANDARD`, `PD_SSD`, `PD_BALANCED`, `PD_EXTREME`. | false | None | None |
| `data_disk_size_gb` | The size of the data disk in GB attached to this instance, up to a maximum of 64000 GB (64 TB). You can choose the size of the data disk based on how big your notebooks and data are. If not specified, this defaults to 100. | false | None | None |
| `no_remove_data_disk` | If true, the data disk will not be auto deleted when deleting the instance. | false | None | None |
| `disk_encryption` | Disk encryption method used on the boot and data disks, defaults to GMEK. Possible values are: `DISK_ENCRYPTION_UNSPECIFIED`, `GMEK`, `CMEK`. | false | None | None |
| `kms_key` | The KMS key used to encrypt the disks, only applicable if diskEncryption is CMEK. Format: projects/{project_id}/locations/{location}/keyRings/{key_ring_id}/cryptoKeys/{key_id} | false | None | None |
| `no_public_ip` | No public IP will be assigned to this instance. | false | None | None |
| `no_proxy_access` | The notebook instance will not register with the proxy.. | false | None | None |
| `network` | The name of the VPC that this instance is in. Format: projects/{project_id}/global/networks/{network_id} | false | None | None |
| `subnet` | The name of the subnet that this instance is in. Format: projects/{project_id}/regions/{region}/subnetworks/{subnetwork_id} | false | None | None |
| `labels` | Labels to apply to this instance. These can be later modified by the setLabels method. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `tags` | The Compute Engine tags to add to instance. | false | None | None |
| `metadata` | Custom metadata to apply to this instance. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `desired_state` |  | none | None | None |

### accelerator_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Type of this accelerator. Possible values are: `ACCELERATOR_TYPE_UNSPECIFIED`, `NVIDIA_TESLA_K80`, `NVIDIA_TESLA_P100`, `NVIDIA_TESLA_V100`, `NVIDIA_TESLA_P4`, `NVIDIA_TESLA_T4`, `NVIDIA_TESLA_T4_VWS`, `NVIDIA_TESLA_P100_VWS`, `NVIDIA_TESLA_P4_VWS`, `NVIDIA_TESLA_A100`, `TPU_V2`, `TPU_V3`. | true | None | None |
| `core_count` | Count of cores of this accelerator. | true | None | None |

### shielded_instance_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_integrity_monitoring` | Defines whether the instance has integrity monitoring enabled. Enables monitoring and attestation of the boot integrity of the instance. The attestation is performed against the integrity policy baseline. This baseline is initially derived from the implicitly trusted boot image when the instance is created. Enabled by default. | false | None | None |
| `enable_secure_boot` | Defines whether the instance has Secure Boot enabled. Secure Boot helps ensure that the system only runs authentic software by verifying the digital signature of all boot components, and halting the boot process if signature verification fails. Disabled by default. | false | None | None |
| `enable_vtpm` | Defines whether the instance has the vTPM enabled. Enabled by default. | false | None | None |

### reservation_affinity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `consume_reservation_type` | The type of Compute Reservation. Possible values are: `NO_RESERVATION`, `ANY_RESERVATION`, `SPECIFIC_RESERVATION`. | true | None | None |
| `key` | Corresponds to the label key of reservation resource. | false | None | None |
| `values` | Corresponds to the label values of reservation resource. | false | None | None |

### vm_image Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project` | The name of the Google Cloud project that this VM image belongs to. Format: projects/{project_id} | true | None | None |
| `image_family` | Use this VM image family to find the image; the newest image in this family will be used. | false | None | None |
| `image_name` | Use VM image name to find the image. | false | None | None |

### container_image Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `repository` | The path to the container image repository. For example: gcr.io/{project_id}/{imageName} | true | None | None |
| `tag` | The tag of the container image. If not specified, this defaults to the latest tag. | false | None | None |
