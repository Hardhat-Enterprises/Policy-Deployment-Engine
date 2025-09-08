## 🛡️ Policy Deployment Engine: `workbench_instance`

This section provides a concise policy evaluation for the `workbench_instance` resource in GCP.

Reference: [Terraform Registry – workbench_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workbench_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of this workbench instance. Format: `projects/{project_id}/locations/{location}/instances/{instance_id}` | true | None | None |
| `location` | Part of `parent`. See documentation of `projectsId`. | true | None | None |
| `instance_owners` | 'Optional. Input only. The owner of this instance after creation. Format: `alias@example.com` Currently supports one owner only. If not specified, all of the service account users of your VM instance''s service account can use the instance. If specified, sets the access mode to `Single user`. For more details, see https://cloud.google.com/vertex-ai/docs/workbench/instances/manage-access-jupyterlab' | false | None | None |
| `disable_proxy_access` | Optional. If true, the workbench instance will not register with the proxy. | false | None | None |
| `labels` | Optional. Labels to apply to this instance. These can be later modified by the UpdateInstance method. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `enable_third_party_identity` | Flag that specifies that a notebook can be accessed with third party identity provider. | false | None | None |
| `enable_managed_euc` | Flag to enable managed end user credentials for the instance. | false | None | None |
| `instance_id` | Required. User-defined unique ID of this instance. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `desired_state` |  | none | None | None |

### gce_setup Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `machine_type` | Optional. The machine type of the VM instance. https://cloud.google.com/compute/docs/machine-resource | false | None | None |
| `accelerator_configs` | The hardware accelerators used on this instance. If you use accelerators, make sure that your configuration has [enough vCPUs and memory to support the `machine_type` you have selected](https://cloud.google.com/compute/docs/gpus/#gpus-list). Currently supports only one accelerator configuration. Structure is [documented below](#nested_gce_setup_accelerator_configs). | false | None | None |
| `shielded_instance_config` | A set of Shielded Instance options. See [Images using supported Shielded VM features](https://cloud.google.com/compute/docs/instances/modifying-shielded-vm). Not all combinations are valid. Structure is [documented below](#nested_gce_setup_shielded_instance_config). | false | None | None |
| `service_accounts` | The service account that serves as an identity for the VM instance. Currently supports only one service account. Structure is [documented below](#nested_gce_setup_service_accounts). | false | None | None |
| `vm_image` | Definition of a custom Compute Engine virtual machine image for starting a workbench instance with the environment installed directly on the VM. Structure is [documented below](#nested_gce_setup_vm_image). | false | None | None |
| `container_image` | Use a container image to start the workbench instance. Structure is [documented below](#nested_gce_setup_container_image). | false | None | None |
| `boot_disk` | The definition of a boot disk. Structure is [documented below](#nested_gce_setup_boot_disk). | false | None | None |
| `data_disks` | Data disks attached to the VM instance. Currently supports only one data disk. Structure is [documented below](#nested_gce_setup_data_disks). | false | None | None |
| `network_interfaces` | The network interfaces for the VM. Supports only one interface. Structure is [documented below](#nested_gce_setup_network_interfaces). | false | None | None |
| `disable_public_ip` | Optional. If true, no external IP will be assigned to this VM instance. | false | None | None |
| `tags` | Optional. The Compute Engine tags to add to instance (see [Tagging instances](https://cloud.google.com/compute/docs/label-or-tag-resources#tags)). | false | None | None |
| `metadata` | Optional. Custom metadata to apply to this instance. | false | None | None |
| `enable_ip_forwarding` | Optional. Flag to enable ip forwarding or not, default false/off. https://cloud.google.com/vpc/docs/using-routes#canipforward | false | None | None |
| `confidential_instance_config` | Confidential instance configuration. Structure is [documented below](#nested_gce_setup_confidential_instance_config). | false | None | None |
| `reservation_affinity` | Reservations that this instance can consume from. Structure is [documented below](#nested_gce_setup_reservation_affinity). | false | None | None |

### accelerator_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Optional. Type of this accelerator. Possible values are: `NVIDIA_TESLA_P100`, `NVIDIA_TESLA_V100`, `NVIDIA_TESLA_P4`, `NVIDIA_TESLA_T4`, `NVIDIA_TESLA_A100`, `NVIDIA_A100_80GB`, `NVIDIA_L4`, `NVIDIA_TESLA_T4_VWS`, `NVIDIA_TESLA_P100_VWS`, `NVIDIA_TESLA_P4_VWS`. | false | None | None |
| `core_count` | Optional. Count of cores of this accelerator. | false | None | None |

### shielded_instance_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_secure_boot` | Optional. Defines whether the VM instance has Secure Boot enabled. Secure Boot helps ensure that the system only runs authentic software by verifying the digital signature of all boot components, and halting the boot process if signature verification fails. Disabled by default. | false | None | None |
| `enable_vtpm` | Optional. Defines whether the VM instance has the vTPM enabled. Enabled by default. | false | None | None |
| `enable_integrity_monitoring` | Optional. Defines whether the VM instance has integrity monitoring enabled. Enables monitoring and attestation of the boot integrity of the VM instance. The attestation is performed against the integrity policy baseline. This baseline is initially derived from the implicitly trusted boot image when the VM instance is created. Enabled by default. | false | None | None |

### service_accounts Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `email` | Optional. Email address of the service account. | false | None | None |
| `scopes` | (Output) Output only. The list of scopes to be made available for this service account. Set by the CLH to https://www.googleapis.com/auth/cloud-platform | none | None | None |

### vm_image Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project` | The name of the Google Cloud project that this VM image belongs to. Format: {project_id} | false | None | None |
| `name` | Optional. Use VM image name to find the image. | false | None | None |
| `family` | Optional. Use this VM image family to find the image; the newest image in this family will be used. | false | None | None |

### container_image Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `repository` | The path to the container image repository. For example: gcr.io/{project_id}/{imageName} | true | None | None |
| `tag` | The tag of the container image. If not specified, this defaults to the latest tag. | false | None | None |

### boot_disk Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disk_size_gb` | Optional. The size of the boot disk in GB attached to this instance, up to a maximum of 64000 GB (64 TB). If not specified, this defaults to the recommended value of 150GB. | false | None | None |
| `disk_type` | Optional. Indicates the type of the disk. Possible values are: `PD_STANDARD`, `PD_SSD`, `PD_BALANCED`, `PD_EXTREME`. | false | None | None |
| `disk_encryption` | Optional. Input only. Disk encryption method used on the boot and data disks, defaults to GMEK. Possible values are: `GMEK`, `CMEK`. | false | None | None |
| `kms_key` | 'Optional. The KMS key used to encrypt the disks, only applicable if disk_encryption is CMEK. Format: `projects/{project_id}/locations/{location}/keyRings/{key_ring_id}/cryptoKeys/{key_id}` Learn more about using your own encryption keys.' | false | None | None |

### data_disks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disk_size_gb` | Optional. The size of the disk in GB attached to this VM instance, up to a maximum of 64000 GB (64 TB). If not specified, this defaults to 100. | false | None | None |
| `disk_type` | Optional. Input only. Indicates the type of the disk. Possible values are: `PD_STANDARD`, `PD_SSD`, `PD_BALANCED`, `PD_EXTREME`. | false | None | None |
| `disk_encryption` | Optional. Input only. Disk encryption method used on the boot and data disks, defaults to GMEK. Possible values are: `GMEK`, `CMEK`. | false | None | None |
| `kms_key` | 'Optional. The KMS key used to encrypt the disks, only applicable if disk_encryption is CMEK. Format: `projects/{project_id}/locations/{location}/keyRings/{key_ring_id}/cryptoKeys/{key_id}` Learn more about using your own encryption keys.' | false | None | None |

### network_interfaces Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` | Optional. The name of the VPC that this VM instance is in. | false | None | None |
| `subnet` | Optional. The name of the subnet that this VM instance is in. | false | None | None |
| `nic_type` | Optional. The type of vNIC to be used on this interface. This may be gVNIC or VirtioNet. Possible values are: `VIRTIO_NET`, `GVNIC`. | false | None | None |
| `access_configs` | Optional. An array of configurations for this interface. Currently, only one access config, ONE_TO_ONE_NAT, is supported. If no accessConfigs specified, the instance will have an external internet access through an ephemeral external IP address. Structure is [documented below](#nested_gce_setup_network_interfaces_network_interfaces_access_configs). | false | None | None |

### access_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `external_ip` | An external IP address associated with this instance. Specify an unused static external IP address available to the project or leave this field undefined to use an IP from a shared ephemeral IP address pool. If you specify a static external IP address, it must live in the same region as the zone of the instance. | true | None | None |

### confidential_instance_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `confidential_instance_type` | Defines the type of technology used by the confidential instance. Possible values are: `SEV`. | false | None | None |

### reservation_affinity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `consume_reservation_type` | Specifies the type of reservation from which this instance can consume resources: RESERVATION_ANY (default), RESERVATION_SPECIFIC, or RESERVATION_NONE. Possible values are: `RESERVATION_NONE`, `RESERVATION_ANY`, `RESERVATION_SPECIFIC`. | false | None | None |
| `key` | Corresponds to the label key of a reservation resource. To target a RESERVATION_SPECIFIC by name, use compute.googleapis.com/reservation-name as the key and specify the name of your reservation as its value. | false | None | None |
| `values` | Corresponds to the label values of a reservation resource. This can be either a name to a reservation in the same project or "projects/different-project/reservations/some-reservation-name" to target a shared reservation in the same zone but in a different project. | false | None | None |
