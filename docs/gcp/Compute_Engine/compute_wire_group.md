## 🛡️ Policy Deployment Engine: `compute_wire_group`

This section provides a concise policy evaluation for the `compute_wire_group` resource in GCP.

Reference: [Terraform Registry – compute_wire_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_wire_group)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cross_site_network`
- Description: (Required) Required cross site network to which wire group belongs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. Provide this property when you create the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoints`
- Description: (Optional) Endpoints grouped by location, each mapping to interconnect configurations. Structure is [documented below](#nested_endpoints).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `admin_enabled`
- Description: (Optional) Indicates whether the wire group is administratively enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `wire_group_properties`
- Description: (Optional) Properties specific to the wire group. Structure is [documented below](#nested_wire_group_properties).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `wire_properties`
- Description: (Optional) Default properties for wires within the group. Structure is [documented below](#nested_wire_properties).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_endpoints"></a>The `endpoints` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoint`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interconnects`
- Description: (Optional) Structure is [documented below](#nested_endpoints_endpoints_interconnects). <a name="nested_endpoints_endpoints_interconnects"></a>The `interconnects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interconnect_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interconnect`
- Description: (Optional)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vlan_tags`
- Description: (Optional) VLAN tags for the interconnect. <a name="nested_wire_group_properties"></a>The `wire_group_properties` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Type of wire group (enum). WIRE: a single pseudowire over two Interconnect connections   with no redundancy. REDUNDANT: two pseudowires over four Interconnect connections, with two connections in one metro and two connections in another metro. BOX_AND_CROSS: four pseudowires over four Interconnect connections, with two connections in one metro and two connections in another metro. <a name="nested_wire_properties"></a>The `wire_properties` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bandwidth_unmetered`
- Description: (Optional) The unmetered bandwidth setting.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fault_response`
- Description: (Optional) Response when a fault is detected in a pseudowire: NONE: default. DISABLE_PORT: set the port line protocol down when inline probes detect a fault. This setting is only permitted on port mode pseudowires.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
