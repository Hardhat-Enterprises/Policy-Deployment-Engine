## 🛡️ Policy Deployment Engine: `colab_runtime_template`

This section provides a concise policy evaluation for the `colab_runtime_template` resource in GCP.

Reference: [Terraform Registry – colab_runtime_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/colab_runtime_template)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) Required. The display name of the Runtime Template.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource: https://cloud.google.com/colab/docs/locations
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The resource name of the Runtime Template
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of the Runtime Template.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_spec`
- Description: (Optional) 'The machine configuration of the runtime.' Structure is [documented below](#nested_machine_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_persistent_disk_spec`
- Description: (Optional) The configuration for the data disk of the runtime. Structure is [documented below](#nested_data_persistent_disk_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_spec`
- Description: (Optional) The network configuration for the runtime. Structure is [documented below](#nested_network_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels to identify and group the runtime template. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idle_shutdown_config`
- Description: (Optional) Notebook Idle Shutdown configuration for the runtime. Structure is [documented below](#nested_idle_shutdown_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `euc_config`
- Description: (Optional) EUC configuration of the NotebookRuntimeTemplate. Structure is [documented below](#nested_euc_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shielded_vm_config`
- Description: (Optional) Runtime Shielded VM spec. Structure is [documented below](#nested_shielded_vm_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_tags`
- Description: (Optional) Applies the given Compute Engine tags to the runtime.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_spec`
- Description: (Optional) Customer-managed encryption key spec for the notebook runtime. Structure is [documented below](#nested_encryption_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `software_config`
- Description: (Optional) The notebook software configuration of the notebook runtime. Structure is [documented below](#nested_software_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_machine_spec"></a>The `machine_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: (Optional) The Compute Engine machine type selected for the runtime.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: (Optional) The type of hardware accelerator used by the runtime. If specified, acceleratorCount must also be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_count`
- Description: (Optional) The number of accelerators used by the runtime. <a name="nested_data_persistent_disk_spec"></a>The `data_persistent_disk_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_type`
- Description: (Optional) The type of the persistent disk.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_size_gb`
- Description: (Optional) The disk size of the runtime in GB. If specified, the diskType must also be specified. The minimum size is 10GB and the maximum is 65536GB. <a name="nested_network_spec"></a>The `network_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_internet_access`
- Description: (Optional) Enable public internet access for the runtime.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The name of the VPC that this runtime is in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: (Optional) The name of the subnetwork that this runtime is in. <a name="nested_idle_shutdown_config"></a>The `idle_shutdown_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idle_timeout`
- Description: (Optional) The duration after which the runtime is automatically shut down. An input of 0s disables the idle shutdown feature, and a valid range is [10m, 24h]. <a name="nested_euc_config"></a>The `euc_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `euc_disabled`
- Description: (Optional) Disable end user credential access for the runtime. <a name="nested_shielded_vm_config"></a>The `shielded_vm_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_secure_boot`
- Description: (Optional) Enables secure boot for the runtime. <a name="nested_encryption_spec"></a>The `encryption_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The Cloud KMS encryption key (customer-managed encryption key) used to protect the runtime. <a name="nested_software_config"></a>The `software_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `env`
- Description: (Optional) Environment variables to be passed to the container. Structure is [documented below](#nested_software_config_env).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `post_startup_script_config`
- Description: (Optional, Deprecated) Post startup script config. Structure is [documented below](#nested_software_config_post_startup_script_config). ~> **Warning:** `post_startup_script_config` is deprecated and will be removed in a future major release. New resource creation with this field is unavailable at this time. <a name="nested_software_config_env"></a>The `env` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the environment variable. Must be a valid C identifier.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Variables that reference a $(VAR_NAME) are expanded using the previous defined environment variables in the container and any service environment variables. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. <a name="nested_software_config_post_startup_script_config"></a>The `post_startup_script_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `post_startup_script`
- Description: (Optional) Post startup script to run after runtime is started.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `post_startup_script_url`
- Description: (Optional) Post startup script url to download. Example: https://bucket/script.sh.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `post_startup_script_behavior`
- Description: (Optional) Post startup script behavior that defines download and execution behavior. Possible values are: `RUN_ONCE`, `RUN_EVERY_START`, `DOWNLOAD_AND_RUN_EVERY_START`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
