## 🛡️ Policy Deployment Engine: `tpu_v2_queued_resource`

This section provides a concise policy evaluation for the `tpu_v2_queued_resource` resource in GCP.

Reference: [Terraform Registry – tpu_v2_queued_resource](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tpu_v2_queued_resource)

---

## 1. Argument Reference

### `name`
- Description: (Required) The immutable name of the Queued Resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tpu`
- Description: (Optional) Defines a TPU resource. Structure is [documented below](#nested_tpu).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) The GCP location for the Queued Resource. If it is not provided, the provider zone is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_tpu"></a>The `tpu` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_spec`
- Description: (Optional) The TPU node(s) being requested. Structure is [documented below](#nested_tpu_node_spec). <a name="nested_tpu_node_spec"></a>The `node_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The parent resource name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_id`
- Description: (Optional) Unqualified node identifier used to identify the node in the project once provisioned.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node`
- Description: (Required) The node. Structure is [documented below](#nested_tpu_node_spec_node_spec_node). <a name="nested_tpu_node_spec_node_spec_node"></a>The `node` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime_version`
- Description: (Required) Runtime version for the TPU.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: (Optional) TPU accelerator type for the TPU. If not specified, this defaults to 'v2-8'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Text description of the TPU.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_config`
- Description: (Optional) Network configurations for the TPU node. Structure is [documented below](#nested_tpu_node_spec_node_spec_node_network_config). <a name="nested_tpu_node_spec_node_spec_node_network_config"></a>The `network_config` block supports:
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
- Description: (Optional) Specifies networking queue count for TPU VM instance's network interface.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
