## 🛡️ Policy Deployment Engine: `network_connectivity_internal_range`

This section provides a concise policy evaluation for the `network_connectivity_internal_range` resource in GCP.

Reference: [Terraform Registry – network_connectivity_internal_range](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_internal_range)

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

### `usage`
- Description: (Required) The type of usage set for this InternalRange. Possible values are: `FOR_VPC`, `EXTERNAL_TO_VPC`, `FOR_MIGRATION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peering`
- Description: (Required) The type of peering set for this internal range. Possible values are: `FOR_SELF`, `FOR_PEER`, `NOT_SHARED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_cidr_range`
- Description: (Optional) The IP range that this internal range defines. NOTE: IPv6 ranges are limited to usage=EXTERNAL_TO_VPC and peering=FOR_SELF NOTE: For IPv6 Ranges this field is compulsory, i.e. the address range must be specified explicitly.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prefix_length`
- Description: (Optional) An alternate to ipCidrRange. Can be set when trying to create a reservation that automatically finds a free range of the given size. If both ipCidrRange and prefixLength are set, there is an error if the range sizes do not match. Can also be used during updates to change the range size. NOTE: For IPv6 this field only works if ip_cidr_range is set as well, and both fields must match. In other words, with IPv6 this field only works as a redundant parameter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_cidr_range`
- Description: (Optional) Optional. Can be set to narrow down or pick a different address space while searching for a free range. If not set, defaults to the "10.0.0.0/8" address space. This can be used to search in other rfc-1918 address spaces like "172.16.0.0/12" and "192.168.0.0/16" or non-rfc-1918 address spaces used in the VPC.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_cidr_ranges`
- Description: (Optional) Optional. List of IP CIDR ranges to be excluded. Resulting reserved Internal Range will not overlap with any CIDR blocks mentioned in this list. Only IPv4 CIDR ranges are supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allocation_options`
- Description: (Optional) Options for automatically allocating a free range with a size given by prefixLength. Structure is [documented below](#nested_allocation_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `overlaps`
- Description: (Optional) Optional. Types of resources that are allowed to overlap with the current internal range. Each value may be one of: `OVERLAP_ROUTE_RANGE`, `OVERLAP_EXISTING_SUBNET_RANGE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `migration`
- Description: (Optional) Specification for migration with source and target resource names. Structure is [documented below](#nested_migration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `immutable`
- Description: (Optional) Immutable ranges cannot have their fields modified, except for labels and description.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_allocation_options"></a>The `allocation_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allocation_strategy`
- Description: (Optional) Optional. Sets the strategy used to automatically find a free range of a size given by prefixLength. Can be set only when trying to create a reservation that automatically finds the free range to reserve. Possible values are: `RANDOM`, `FIRST_AVAILABLE`, `RANDOM_FIRST_N_AVAILABLE`, `FIRST_SMALLEST_FITTING`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `first_available_ranges_lookup_size`
- Description: (Optional) Must be set when allocation_strategy is RANDOM_FIRST_N_AVAILABLE, otherwise must remain unset. Defines the size of the set of free ranges from which RANDOM_FIRST_N_AVAILABLE strategy randomy selects one, in other words it sets the N in the RANDOM_FIRST_N_AVAILABLE. <a name="nested_migration"></a>The `migration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: (Required) Resource path as an URI of the source resource, for example a subnet. The project for the source resource should match the project for the InternalRange. An example /projects/{project}/regions/{region}/subnetworks/{subnet}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target`
- Description: (Required) Resource path of the target resource. The target project can be different, as in the cases when migrating to peer networks. The resource may not exist yet. For example /projects/{project}/regions/{region}/subnetworks/{subnet}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
