## 🛡️ Policy Deployment Engine: `network_connectivity_spoke`

This section provides a concise policy evaluation for the `network_connectivity_spoke` resource in GCP.

Reference: [Terraform Registry – network_connectivity_spoke](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_spoke)

---

## 1. Argument Reference

### `name`
- Description: (Required) Immutable. The name of the spoke. Spoke names must be unique.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hub`
- Description: (Required) Immutable. The URI of the hub that this spoke is attached to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional labels in key:value format. For more information about labels, see [Requirements for labels](https://cloud.google.com/resource-manager/docs/creating-managing-labels#requirements). **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of the spoke.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group`
- Description: (Optional) The name of the group that this spoke is associated with.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `linked_vpn_tunnels`
- Description: (Optional) The URIs of linked VPN tunnel resources Structure is [documented below](#nested_linked_vpn_tunnels).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `linked_interconnect_attachments`
- Description: (Optional) A collection of VLAN attachment resources. These resources should be redundant attachments that all advertise the same prefixes to Google Cloud. Alternatively, in active/passive configurations, all attachments should be capable of advertising the same prefixes. Structure is [documented below](#nested_linked_interconnect_attachments).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `linked_router_appliance_instances`
- Description: (Optional) The URIs of linked Router appliance resources Structure is [documented below](#nested_linked_router_appliance_instances).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `linked_vpc_network`
- Description: (Optional) VPC network that is associated with the spoke. Structure is [documented below](#nested_linked_vpc_network).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `linked_producer_vpc_network`
- Description: (Optional) Producer VPC network that is associated with the spoke. Structure is [documented below](#nested_linked_producer_vpc_network).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_linked_vpn_tunnels"></a>The `linked_vpn_tunnels` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uris`
- Description: (Required) The URIs of linked VPN tunnel resources.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `site_to_site_data_transfer`
- Description: (Required) A value that controls whether site-to-site data transfer is enabled for these resources. Note that data transfer is available only in supported locations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_import_ranges`
- Description: (Optional) IP ranges allowed to be included during import from hub (does not control transit connectivity). The only allowed value for now is "ALL_IPV4_RANGES". <a name="nested_linked_interconnect_attachments"></a>The `linked_interconnect_attachments` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uris`
- Description: (Required) The URIs of linked interconnect attachment resources
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `site_to_site_data_transfer`
- Description: (Required) A value that controls whether site-to-site data transfer is enabled for these resources. Note that data transfer is available only in supported locations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_import_ranges`
- Description: (Optional) IP ranges allowed to be included during import from hub (does not control transit connectivity). The only allowed value for now is "ALL_IPV4_RANGES". <a name="nested_linked_router_appliance_instances"></a>The `linked_router_appliance_instances` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instances`
- Description: (Required) The list of router appliance instances Structure is [documented below](#nested_linked_router_appliance_instances_instances).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `site_to_site_data_transfer`
- Description: (Required) A value that controls whether site-to-site data transfer is enabled for these resources. Note that data transfer is available only in supported locations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_import_ranges`
- Description: (Optional) IP ranges allowed to be included during import from hub (does not control transit connectivity). The only allowed value for now is "ALL_IPV4_RANGES". <a name="nested_linked_router_appliance_instances_instances"></a>The `instances` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `virtual_machine`
- Description: (Required) The URI of the virtual machine resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Required) The IP address on the VM to use for peering. <a name="nested_linked_vpc_network"></a>The `linked_vpc_network` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) The URI of the VPC network resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_export_ranges`
- Description: (Optional) IP ranges encompassing the subnets to be excluded from peering.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_export_ranges`
- Description: (Optional) IP ranges allowed to be included from peering. <a name="nested_linked_producer_vpc_network"></a>The `linked_producer_vpc_network` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) The URI of the Service Consumer VPC that the Producer VPC is peered with.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peering`
- Description: (Required) The name of the VPC peering between the Service Consumer VPC and the Producer VPC (defined in the Tenant project) which is added to the NCC hub. This peering must be in ACTIVE state.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `producer_network`
- Description: (Output) The URI of the Producer VPC.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_export_ranges`
- Description: (Optional) IP ranges allowed to be included from peering.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_export_ranges`
- Description: (Optional) IP ranges encompassing the subnets to be excluded from peering.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
