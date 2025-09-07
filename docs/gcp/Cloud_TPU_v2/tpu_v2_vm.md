## 🛡️ Policy Deployment Engine: `tpu_v2_vm`

This section provides a concise policy evaluation for the `tpu_v2_vm` resource in GCP.

Reference: [Terraform Registry – tpu_v2_vm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tpu_v2_vm)

---

## 1. Argument Reference

### `name`
- Description: (Required) The immutable name of the TPU.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime_version`
- Description: (Required) Runtime version for the TPU.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: (Optional) TPU accelerator type for the TPU. `accelerator_type` cannot be used at the same time as `accelerator_config`. If neither is specified, `accelerator_type` defaults to 'v2-8'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Text description of the TPU.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cidr_block`
- Description: (Optional) The CIDR block that the TPU node will use when selecting an IP address. This CIDR block must be a /29 block; the Compute Engine networks API forbids a smaller block, and using a larger block would be wasteful (a node can only consume one IP address). Errors will occur if the CIDR block has already been used for a currently existing TPU node, the CIDR block conflicts with any subnetworks in the user's provided network, or the provided network is peered with another network that is using that CIDR block.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_config`
- Description: (Optional) Network configurations for the TPU node. Structure is [documented below](#nested_network_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_configs`
- Description: (Optional) Repeated network configurations for the TPU node. This field is used to specify multiple network configs for the TPU node. Structure is [documented below](#nested_network_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) The Google Cloud Platform Service Account to be used by the TPU node VMs. If None is specified, the default compute service account will be used. Structure is [documented below](#nested_service_account).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scheduling_config`
- Description: (Optional) The scheduling options for this node. Structure is [documented below](#nested_scheduling_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_disks`
- Description: (Optional) The additional data disks for the Node. Structure is [documented below](#nested_data_disks).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shielded_instance_config`
- Description: (Optional) Shielded Instance options. Structure is [documented below](#nested_shielded_instance_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_config`
- Description: (Optional) The AccleratorConfig for the TPU Node. `accelerator_config` cannot be used at the same time as `accelerator_type`. If neither is specified, `accelerator_type` defaults to 'v2-8'. Structure is [documented below](#nested_accelerator_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) Custom metadata to apply to the TPU Node. Can set startup-script and shutdown-script.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) Tags to apply to the TPU Node. Tags are used to identify valid sources or targets for network firewalls.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) The GCP location for the TPU. If it is not provided, the provider zone is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_network_config"></a>The `network_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The name of the network for the TPU node. It must be a preexisting Google Compute Engine network. If none is provided, "default" will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: (Optional) The name of the subnetwork for the TPU node. It must be a preexisting Google Compute Engine subnetwork. If none is provided, "default" will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_external_ips`
- Description: (Optional) Indicates that external IP addresses would be associated with the TPU workers. If set to false, the specified subnetwork or network should have Private Google Access enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `can_ip_forward`
- Description: (Optional) Allows the TPU node to send and receive packets with non-matching destination or source IPs. This is required if you plan to use the TPU workers to forward routes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `queue_count`
- Description: (Optional) Specifies networking queue count for TPU VM instance's network interface. <a name="nested_network_configs"></a>The `network_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The name of the network for the TPU node. It must be a preexisting Google Compute Engine network. If none is provided, "default" will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: (Optional) The name of the subnetwork for the TPU node. It must be a preexisting Google Compute Engine subnetwork. If none is provided, "default" will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_external_ips`
- Description: (Optional) Indicates that external IP addresses would be associated with the TPU workers. If set to false, the specified subnetwork or network should have Private Google Access enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `can_ip_forward`
- Description: (Optional) Allows the TPU node to send and receive packets with non-matching destination or source IPs. This is required if you plan to use the TPU workers to forward routes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `queue_count`
- Description: (Optional) Specifies networking queue count for TPU VM instance's network interface. <a name="nested_service_account"></a>The `service_account` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Optional) Email address of the service account. If empty, default Compute service account will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: (Optional) The list of scopes to be made available for this service account. If empty, access to all Cloud APIs will be allowed. <a name="nested_scheduling_config"></a>The `scheduling_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preemptible`
- Description: (Optional) Defines whether the node is preemptible.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reserved`
- Description: (Optional) Whether the node is created under a reservation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spot`
- Description: (Optional) Optional. Defines whether the node is Spot VM. <a name="nested_data_disks"></a>The `data_disks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_disk`
- Description: (Required) Specifies the full path to an existing disk. For example: "projects/my-project/zones/us-central1-c/disks/my-disk".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) The mode in which to attach this disk. If not specified, the default is READ_WRITE mode. Only applicable to dataDisks. Default value is `READ_WRITE`. Possible values are: `READ_WRITE`, `READ_ONLY`. <a name="nested_shielded_instance_config"></a>The `shielded_instance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_secure_boot`
- Description: (Required) Defines whether the instance has Secure Boot enabled. <a name="nested_accelerator_config"></a>The `accelerator_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Type of TPU. Please select one of the allowed types: https://cloud.google.com/tpu/docs/reference/rest/v2/AcceleratorConfig#Type
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topology`
- Description: (Required) Topology of TPU in chips.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
