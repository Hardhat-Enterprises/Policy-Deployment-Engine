## 🛡️ Policy Deployment Engine: `workbench_instance`

This section provides a concise policy evaluation for the `workbench_instance` resource in GCP.

Reference: [Terraform Registry – workbench_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workbench_instance)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of this workbench instance. Format: `projects/{project_id}/locations/{location}/instances/{instance_id}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Part of `parent`. See documentation of `projectsId`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gce_setup`
- Description: (Optional) The definition of how to configure a VM instance outside of Resources and Identity. Structure is [documented below](#nested_gce_setup).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_owners`
- Description: (Optional) 'Optional. Input only. The owner of this instance after creation. Format: `alias@example.com` Currently supports one owner only. If not specified, all of the service account users of your VM instance''s service account can use the instance. If specified, sets the access mode to `Single user`. For more details, see https://cloud.google.com/vertex-ai/docs/workbench/instances/manage-access-jupyterlab'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_proxy_access`
- Description: (Optional) Optional. If true, the workbench instance will not register with the proxy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Labels to apply to this instance. These can be later modified by the UpdateInstance method. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_third_party_identity`
- Description: (Optional) Flag that specifies that a notebook can be accessed with third party identity provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_managed_euc`
- Description: (Optional) Flag to enable managed end user credentials for the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_id`
- Description: (Optional) Required. User-defined unique ID of this instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `desired_state`
- Description: <a name="nested_gce_setup"></a>The `gce_setup` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: (Optional) Optional. The machine type of the VM instance. https://cloud.google.com/compute/docs/machine-resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_configs`
- Description: (Optional) The hardware accelerators used on this instance. If you use accelerators, make sure that your configuration has [enough vCPUs and memory to support the `machine_type` you have selected](https://cloud.google.com/compute/docs/gpus/#gpus-list). Currently supports only one accelerator configuration. Structure is [documented below](#nested_gce_setup_accelerator_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shielded_instance_config`
- Description: (Optional) A set of Shielded Instance options. See [Images using supported Shielded VM features](https://cloud.google.com/compute/docs/instances/modifying-shielded-vm). Not all combinations are valid. Structure is [documented below](#nested_gce_setup_shielded_instance_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_accounts`
- Description: (Optional) The service account that serves as an identity for the VM instance. Currently supports only one service account. Structure is [documented below](#nested_gce_setup_service_accounts).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vm_image`
- Description: (Optional) Definition of a custom Compute Engine virtual machine image for starting a workbench instance with the environment installed directly on the VM. Structure is [documented below](#nested_gce_setup_vm_image).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_image`
- Description: (Optional) Use a container image to start the workbench instance. Structure is [documented below](#nested_gce_setup_container_image).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk`
- Description: (Optional) The definition of a boot disk. Structure is [documented below](#nested_gce_setup_boot_disk).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_disks`
- Description: (Optional) Data disks attached to the VM instance. Currently supports only one data disk. Structure is [documented below](#nested_gce_setup_data_disks).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_interfaces`
- Description: (Optional) The network interfaces for the VM. Supports only one interface. Structure is [documented below](#nested_gce_setup_network_interfaces).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_public_ip`
- Description: (Optional) Optional. If true, no external IP will be assigned to this VM instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) Optional. The Compute Engine tags to add to instance (see [Tagging instances](https://cloud.google.com/compute/docs/label-or-tag-resources#tags)).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) Optional. Custom metadata to apply to this instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_ip_forwarding`
- Description: (Optional) Optional. Flag to enable ip forwarding or not, default false/off. https://cloud.google.com/vpc/docs/using-routes#canipforward
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `confidential_instance_config`
- Description: (Optional) Confidential instance configuration. Structure is [documented below](#nested_gce_setup_confidential_instance_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reservation_affinity`
- Description: (Optional) Reservations that this instance can consume from. Structure is [documented below](#nested_gce_setup_reservation_affinity). <a name="nested_gce_setup_accelerator_configs"></a>The `accelerator_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Optional. Type of this accelerator. Possible values are: `NVIDIA_TESLA_P100`, `NVIDIA_TESLA_V100`, `NVIDIA_TESLA_P4`, `NVIDIA_TESLA_T4`, `NVIDIA_TESLA_A100`, `NVIDIA_A100_80GB`, `NVIDIA_L4`, `NVIDIA_TESLA_T4_VWS`, `NVIDIA_TESLA_P100_VWS`, `NVIDIA_TESLA_P4_VWS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `core_count`
- Description: (Optional) Optional. Count of cores of this accelerator. <a name="nested_gce_setup_shielded_instance_config"></a>The `shielded_instance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_secure_boot`
- Description: (Optional) Optional. Defines whether the VM instance has Secure Boot enabled. Secure Boot helps ensure that the system only runs authentic software by verifying the digital signature of all boot components, and halting the boot process if signature verification fails. Disabled by default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_vtpm`
- Description: (Optional) Optional. Defines whether the VM instance has the vTPM enabled. Enabled by default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_integrity_monitoring`
- Description: (Optional) Optional. Defines whether the VM instance has integrity monitoring enabled. Enables monitoring and attestation of the boot integrity of the VM instance. The attestation is performed against the integrity policy baseline. This baseline is initially derived from the implicitly trusted boot image when the VM instance is created. Enabled by default. <a name="nested_gce_setup_service_accounts"></a>The `service_accounts` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Optional) Optional. Email address of the service account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scopes`
- Description: (Output) Output only. The list of scopes to be made available for this service account. Set by the CLH to https://www.googleapis.com/auth/cloud-platform <a name="nested_gce_setup_vm_image"></a>The `vm_image` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The name of the Google Cloud project that this VM image belongs to. Format: {project_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Optional. Use VM image name to find the image.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `family`
- Description: (Optional) Optional. Use this VM image family to find the image; the newest image in this family will be used. <a name="nested_gce_setup_container_image"></a>The `container_image` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Required) The path to the container image repository. For example: gcr.io/{project_id}/{imageName}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag`
- Description: (Optional) The tag of the container image. If not specified, this defaults to the latest tag. <a name="nested_gce_setup_boot_disk"></a>The `boot_disk` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_size_gb`
- Description: (Optional) Optional. The size of the boot disk in GB attached to this instance, up to a maximum of 64000 GB (64 TB). If not specified, this defaults to the recommended value of 150GB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_type`
- Description: (Optional) Optional. Indicates the type of the disk. Possible values are: `PD_STANDARD`, `PD_SSD`, `PD_BALANCED`, `PD_EXTREME`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_encryption`
- Description: (Optional) Optional. Input only. Disk encryption method used on the boot and data disks, defaults to GMEK. Possible values are: `GMEK`, `CMEK`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) 'Optional. The KMS key used to encrypt the disks, only applicable if disk_encryption is CMEK. Format: `projects/{project_id}/locations/{location}/keyRings/{key_ring_id}/cryptoKeys/{key_id}` Learn more about using your own encryption keys.' <a name="nested_gce_setup_data_disks"></a>The `data_disks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_size_gb`
- Description: (Optional) Optional. The size of the disk in GB attached to this VM instance, up to a maximum of 64000 GB (64 TB). If not specified, this defaults to 100.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_type`
- Description: (Optional) Optional. Input only. Indicates the type of the disk. Possible values are: `PD_STANDARD`, `PD_SSD`, `PD_BALANCED`, `PD_EXTREME`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_encryption`
- Description: (Optional) Optional. Input only. Disk encryption method used on the boot and data disks, defaults to GMEK. Possible values are: `GMEK`, `CMEK`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) 'Optional. The KMS key used to encrypt the disks, only applicable if disk_encryption is CMEK. Format: `projects/{project_id}/locations/{location}/keyRings/{key_ring_id}/cryptoKeys/{key_id}` Learn more about using your own encryption keys.' <a name="nested_gce_setup_network_interfaces"></a>The `network_interfaces` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) Optional. The name of the VPC that this VM instance is in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnet`
- Description: (Optional) Optional. The name of the subnet that this VM instance is in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nic_type`
- Description: (Optional) Optional. The type of vNIC to be used on this interface. This may be gVNIC or VirtioNet. Possible values are: `VIRTIO_NET`, `GVNIC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_configs`
- Description: (Optional) Optional. An array of configurations for this interface. Currently, only one access config, ONE_TO_ONE_NAT, is supported. If no accessConfigs specified, the instance will have an external internet access through an ephemeral external IP address. Structure is [documented below](#nested_gce_setup_network_interfaces_network_interfaces_access_configs). <a name="nested_gce_setup_network_interfaces_network_interfaces_access_configs"></a>The `access_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_ip`
- Description: (Required) An external IP address associated with this instance. Specify an unused static external IP address available to the project or leave this field undefined to use an IP from a shared ephemeral IP address pool. If you specify a static external IP address, it must live in the same region as the zone of the instance. <a name="nested_gce_setup_confidential_instance_config"></a>The `confidential_instance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `confidential_instance_type`
- Description: (Optional) Defines the type of technology used by the confidential instance. Possible values are: `SEV`. <a name="nested_gce_setup_reservation_affinity"></a>The `reservation_affinity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consume_reservation_type`
- Description: (Optional) Specifies the type of reservation from which this instance can consume resources: RESERVATION_ANY (default), RESERVATION_SPECIFIC, or RESERVATION_NONE. Possible values are: `RESERVATION_NONE`, `RESERVATION_ANY`, `RESERVATION_SPECIFIC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) Corresponds to the label key of a reservation resource. To target a RESERVATION_SPECIFIC by name, use compute.googleapis.com/reservation-name as the key and specify the name of your reservation as its value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `values`
- Description: (Optional) Corresponds to the label values of a reservation resource. This can be either a name to a reservation in the same project or "projects/different-project/reservations/some-reservation-name" to target a shared reservation in the same zone but in a different project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
