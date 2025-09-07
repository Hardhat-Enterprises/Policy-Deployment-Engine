## 🛡️ Policy Deployment Engine: `network_connectivity_policy_based_route`

This section provides a concise policy evaluation for the `network_connectivity_policy_based_route` resource in GCP.

Reference: [Terraform Registry – network_connectivity_policy_based_route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_policy_based_route)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of the policy based route.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) Fully-qualified URL of the network that this route applies to, for example: projects/my-project/global/networks/my-network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Required) The filter to match L4 traffic. Structure is [documented below](#nested_filter).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `next_hop_other_routes`
- Description: (Optional) Other routes that will be referenced to determine the next hop of the packet. Possible values are: `DEFAULT_ROUTING`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `next_hop_ilb_ip`
- Description: (Optional) The IP address of a global-access-enabled L4 ILB that is the next hop for matching packets.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `priority`
- Description: (Optional) The priority of this policy-based route. Priority is used to break ties in cases where there are more than one matching policy-based routes found. In cases where multiple policy-based routes are matched, the one with the lowest-numbered priority value wins. The default value is 1000. The priority value must be from 1 to 65535, inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `virtual_machine`
- Description: (Optional) VM instances to which this policy-based route applies to. Structure is [documented below](#nested_virtual_machine).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interconnect_attachment`
- Description: (Optional) The interconnect attachments that this policy-based route applies to. Structure is [documented below](#nested_interconnect_attachment).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_filter"></a>The `filter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `protocol_version`
- Description: (Required) Internet protocol versions this policy-based route applies to. Possible values are: `IPV4`, `IPV6`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_protocol`
- Description: (Optional) The IP protocol that this policy-based route applies to. Valid values are 'TCP', 'UDP', and 'ALL'. Default is 'ALL'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `src_range`
- Description: (Optional) The source IP range of outgoing packets that this policy-based route applies to. Default is "0.0.0.0/0".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dest_range`
- Description: (Optional) The destination IP range of outgoing packets that this policy-based route applies to. Default is "0.0.0.0/0". <a name="nested_virtual_machine"></a>The `virtual_machine` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Required) A list of VM instance tags that this policy-based route applies to. VM instances that have ANY of tags specified here will install this PBR. <a name="nested_interconnect_attachment"></a>The `interconnect_attachment` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Required) Cloud region to install this policy-based route on for Interconnect attachments. Use `all` to install it on all Interconnect attachments.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
