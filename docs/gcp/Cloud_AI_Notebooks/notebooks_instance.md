## 🛡️ Policy Deployment Engine: `notebooks_instance`

This section provides a concise policy evaluation for the `notebooks_instance` resource in GCP.

Reference: [Terraform Registry – notebooks_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/notebooks_instance)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name specified for the Notebook instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: (Required) A reference to a machine type which defines VM kind.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) A reference to the zone where the machine resides.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `post_startup_script`
- Description: (Optional) Path to a Bash script that automatically runs after a notebook instance fully boots up. The path must be a URL or Cloud Storage path (gs://path-to-file/file-name).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_owners`
- Description: (Optional) The list of owners of this instance after creation. Format: alias@example.com. Currently supports one owner only. If not specified, all of the service account users of your VM instance's service account can use the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) The service account on this instance, giving access to other Google Cloud services. You can use any service account within the same project, but you must have the service account user permission to use the instance. If not specified, the Compute Engine default service account is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_scopes`
- Description: (Optional) Optional. The URIs of service account scopes to be included in Compute Engine instances. If not specified, the following scopes are defined: - https://www.googleapis.com/auth/cloud-platform - https://www.googleapis.com/auth/userinfo.email
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_config`
- Description: (Optional) The hardware accelerator used on this instance. If you use accelerators, make sure that your configuration has enough vCPUs and memory to support the machineType you have selected. Structure is [documented below](#nested_accelerator_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shielded_instance_config`
- Description: (Optional) A set of Shielded Instance options. Check [Images using supported Shielded VM features] Not all combinations are valid Structure is [documented below](#nested_shielded_instance_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nic_type`
- Description: (Optional) The type of vNIC driver. Possible values are: `UNSPECIFIED_NIC_TYPE`, `VIRTIO_NET`, `GVNIC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reservation_affinity`
- Description: (Optional) Reservation Affinity for consuming Zonal reservation. Structure is [documented below](#nested_reservation_affinity).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `install_gpu_driver`
- Description: (Optional) Whether the end user authorizes Google Cloud to install GPU driver on this instance. If this field is empty or set to false, the GPU driver won't be installed. Only applicable to instances with GPUs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_gpu_driver_path`
- Description: (Optional) Specify a custom Cloud Storage path where the GPU driver is stored. If not specified, we'll automatically choose from official GPU drivers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_type`
- Description: (Optional) Possible disk types for notebook instances. Possible values are: `DISK_TYPE_UNSPECIFIED`, `PD_STANDARD`, `PD_SSD`, `PD_BALANCED`, `PD_EXTREME`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_size_gb`
- Description: (Optional) The size of the boot disk in GB attached to this instance, up to a maximum of 64000 GB (64 TB). The minimum recommended value is 100 GB. If not specified, this defaults to 100.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_disk_type`
- Description: (Optional) Possible disk types for notebook instances. Possible values are: `DISK_TYPE_UNSPECIFIED`, `PD_STANDARD`, `PD_SSD`, `PD_BALANCED`, `PD_EXTREME`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_disk_size_gb`
- Description: (Optional) The size of the data disk in GB attached to this instance, up to a maximum of 64000 GB (64 TB). You can choose the size of the data disk based on how big your notebooks and data are. If not specified, this defaults to 100.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `no_remove_data_disk`
- Description: (Optional) If true, the data disk will not be auto deleted when deleting the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_encryption`
- Description: (Optional) Disk encryption method used on the boot and data disks, defaults to GMEK. Possible values are: `DISK_ENCRYPTION_UNSPECIFIED`, `GMEK`, `CMEK`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) The KMS key used to encrypt the disks, only applicable if diskEncryption is CMEK. Format: projects/{project_id}/locations/{location}/keyRings/{key_ring_id}/cryptoKeys/{key_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `no_public_ip`
- Description: (Optional) No public IP will be assigned to this instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `no_proxy_access`
- Description: (Optional) The notebook instance will not register with the proxy..
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The name of the VPC that this instance is in. Format: projects/{project_id}/global/networks/{network_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnet`
- Description: (Optional) The name of the subnet that this instance is in. Format: projects/{project_id}/regions/{region}/subnetworks/{subnetwork_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels to apply to this instance. These can be later modified by the setLabels method. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) The Compute Engine tags to add to instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) Custom metadata to apply to this instance. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vm_image`
- Description: (Optional) Use a Compute Engine VM image to start the notebook instance. Structure is [documented below](#nested_vm_image).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_image`
- Description: (Optional) Use a container image to start the notebook instance. Structure is [documented below](#nested_container_image).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `desired_state`
- Description: <a name="nested_accelerator_config"></a>The `accelerator_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Type of this accelerator. Possible values are: `ACCELERATOR_TYPE_UNSPECIFIED`, `NVIDIA_TESLA_K80`, `NVIDIA_TESLA_P100`, `NVIDIA_TESLA_V100`, `NVIDIA_TESLA_P4`, `NVIDIA_TESLA_T4`, `NVIDIA_TESLA_T4_VWS`, `NVIDIA_TESLA_P100_VWS`, `NVIDIA_TESLA_P4_VWS`, `NVIDIA_TESLA_A100`, `TPU_V2`, `TPU_V3`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `core_count`
- Description: (Required) Count of cores of this accelerator. <a name="nested_shielded_instance_config"></a>The `shielded_instance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_integrity_monitoring`
- Description: (Optional) Defines whether the instance has integrity monitoring enabled. Enables monitoring and attestation of the boot integrity of the instance. The attestation is performed against the integrity policy baseline. This baseline is initially derived from the implicitly trusted boot image when the instance is created. Enabled by default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_secure_boot`
- Description: (Optional) Defines whether the instance has Secure Boot enabled. Secure Boot helps ensure that the system only runs authentic software by verifying the digital signature of all boot components, and halting the boot process if signature verification fails. Disabled by default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_vtpm`
- Description: (Optional) Defines whether the instance has the vTPM enabled. Enabled by default. <a name="nested_reservation_affinity"></a>The `reservation_affinity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consume_reservation_type`
- Description: (Required) The type of Compute Reservation. Possible values are: `NO_RESERVATION`, `ANY_RESERVATION`, `SPECIFIC_RESERVATION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) Corresponds to the label key of reservation resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `values`
- Description: (Optional) Corresponds to the label values of reservation resource. <a name="nested_vm_image"></a>The `vm_image` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Required) The name of the Google Cloud project that this VM image belongs to. Format: projects/{project_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_family`
- Description: (Optional) Use this VM image family to find the image; the newest image in this family will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_name`
- Description: (Optional) Use VM image name to find the image. <a name="nested_container_image"></a>The `container_image` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Required) The path to the container image repository. For example: gcr.io/{project_id}/{imageName}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag`
- Description: (Optional) The tag of the container image. If not specified, this defaults to the latest tag.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
