## 🛡️ Policy Deployment Engine: `compute_packet_mirroring`

This section provides a concise policy evaluation for the `compute_packet_mirroring` resource in GCP.

Reference: [Terraform Registry – compute_packet_mirroring](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_packet_mirroring)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of the packet mirroring rule
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) Specifies the mirrored VPC network. Only packets in this network will be mirrored. All mirrored VMs should have a NIC in the given network. All mirrored subnetworks should belong to the given network. Structure is [documented below](#nested_network).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `collector_ilb`
- Description: (Required) The Forwarding Rule resource (of type load_balancing_scheme=INTERNAL) that will be used as collector for mirrored traffic. The specified forwarding rule must have is_mirroring_collector set to true. Structure is [documented below](#nested_collector_ilb).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mirrored_resources`
- Description: (Required) A means of specifying which resources to mirror. Structure is [documented below](#nested_mirrored_resources).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human-readable description of the rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The Region in which the created address should reside. If it is not provided, the provider region is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `priority`
- Description: (Optional) Since only one rule can be active at a time, priority is used to break ties in the case of two rules that apply to the same instances.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Optional) A filter for mirrored traffic.  If unset, all traffic is mirrored. Structure is [documented below](#nested_filter).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_network"></a>The `network` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url`
- Description: (Required) The full self_link URL of the network where this rule is active. <a name="nested_collector_ilb"></a>The `collector_ilb` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url`
- Description: (Required) The URL of the forwarding rule. <a name="nested_mirrored_resources"></a>The `mirrored_resources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetworks`
- Description: (Optional) All instances in one of these subnetworks will be mirrored. Structure is [documented below](#nested_mirrored_resources_subnetworks).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instances`
- Description: (Optional) All the listed instances will be mirrored.  Specify at most 50. Structure is [documented below](#nested_mirrored_resources_instances).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) All instances with these tags will be mirrored. <a name="nested_mirrored_resources_subnetworks"></a>The `subnetworks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url`
- Description: (Required) The URL of the subnetwork where this rule should be active. <a name="nested_mirrored_resources_instances"></a>The `instances` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url`
- Description: (Required) The URL of the instances where this rule should be active. <a name="nested_filter"></a>The `filter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_protocols`
- Description: (Optional) Possible IP protocols including tcp, udp, icmp and esp
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cidr_ranges`
- Description: (Optional) IP CIDR ranges that apply as a filter on the source (ingress) or destination (egress) IP in the IP header. Only IPv4 is supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `direction`
- Description: (Optional) Direction of traffic to mirror. Default value is `BOTH`. Possible values are: `INGRESS`, `EGRESS`, `BOTH`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
