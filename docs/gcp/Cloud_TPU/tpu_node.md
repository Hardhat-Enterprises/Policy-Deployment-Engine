## 🛡️ Policy Deployment Engine: `tpu_node`

This section provides a concise policy evaluation for the `tpu_node` resource in GCP.

Reference: [Terraform Registry – tpu_node](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tpu_node)

---

## 1. Argument Reference

### `name`
- Description: (Required) The immutable name of the TPU.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: (Required) The type of hardware accelerators associated with this node.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tensorflow_version`
- Description: (Required) The version of Tensorflow running in the Node.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The user-supplied description of the TPU. Maximum of 512 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The name of a network to peer the TPU node to. It must be a preexisting Compute Engine network inside of the project on which this API has been activated. If none is provided, "default" will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cidr_block`
- Description: (Optional) The CIDR block that the TPU node will use when selecting an IP address. This CIDR block must be a /29 block; the Compute Engine networks API forbids a smaller block, and using a larger block would be wasteful (a node can only consume one IP address). Errors will occur if the CIDR block has already been used for a currently existing TPU node, the CIDR block conflicts with any subnetworks in the user's provided network, or the provided network is peered with another network that is using that CIDR block.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_service_networking`
- Description: (Optional) Whether the VPC peering for the node is set up through Service Networking API. The VPC Peering should be set up before provisioning the node. If this field is set, cidr_block field should not be specified. If the network that you want to peer the TPU Node to is a Shared VPC network, the node must be created with this this field enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scheduling_config`
- Description: (Optional) Sets the scheduling options for this TPU instance. Structure is [documented below](#nested_scheduling_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) The GCP location for the TPU. If it is not provided, the provider zone is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_scheduling_config"></a>The `scheduling_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preemptible`
- Description: (Required) Defines whether the TPU instance is preemptible.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
