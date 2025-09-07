## 🛡️ Policy Deployment Engine: `compute_subnetwork`

This section provides a concise policy evaluation for the `compute_subnetwork` resource in GCP.

Reference: [Terraform Registry – compute_subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of the resource, provided by the client when initially creating the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) The network this subnet belongs to. Only networks that are in the distributed mode can have subnetworks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. Provide this property when you create the resource. This field can be set only at resource creation time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_cidr_range`
- Description: (Optional) The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork. For example, 10.0.0.0/8 or 192.168.0.0/16. Ranges must be unique and non-overlapping within a network. Only IPv4 is supported. Field is optional when `reserved_internal_range` is defined, otherwise required.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reserved_internal_range`
- Description: (Optional) The ID of the reserved internal range. Must be prefixed with `networkconnectivity.googleapis.com` E.g. `networkconnectivity.googleapis.com/projects/{project}/locations/global/internalRanges/{rangeId}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `purpose`
- Description: (Optional) The purpose of the resource. This field can be either `PRIVATE`, `REGIONAL_MANAGED_PROXY`, `GLOBAL_MANAGED_PROXY`, `PRIVATE_SERVICE_CONNECT`, `PEER_MIGRATION` or `PRIVATE_NAT`([Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)). A subnet with purpose set to `REGIONAL_MANAGED_PROXY` is a user-created subnetwork that is reserved for regional Envoy-based load balancers. A subnetwork in a given region with purpose set to `GLOBAL_MANAGED_PROXY` is a proxy-only subnet and is shared between all the cross-regional Envoy-based load balancers. A subnetwork with purpose set to `PRIVATE_SERVICE_CONNECT` reserves the subnet for hosting a Private Service Connect published service. A subnetwork with purpose set to `PEER_MIGRATION` is a user created subnetwork that is reserved for migrating resources from one peered network to another. A subnetwork with purpose set to `PRIVATE_NAT` is used as source range for Private NAT gateways. Note that `REGIONAL_MANAGED_PROXY` is the preferred setting for all regional Envoy load balancers. If unspecified, the purpose defaults to `PRIVATE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: (Optional) The role of subnetwork. Currently, this field is only used when `purpose` is `REGIONAL_MANAGED_PROXY`. The value can be set to `ACTIVE` or `BACKUP`. An `ACTIVE` subnetwork is one that is currently being used for Envoy-based load balancers in a region. A `BACKUP` subnetwork is one that is ready to be promoted to `ACTIVE` or is currently draining. Possible values are: `ACTIVE`, `BACKUP`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_ip_range`
- Description: (Optional) An array of configurations for secondary IP ranges for VM instances contained in this subnetwork. The primary IP of such VM must belong to the primary ipCidrRange of the subnetwork. The alias IPs may belong to either primary or secondary ranges. **Note**: This field uses [attr-as-block mode](https://www.terraform.io/docs/configuration/attr-as-blocks.html) to avoid breaking users during the 0.12 upgrade. To explicitly send a list of zero objects, set `send_secondary_ip_range_if_empty = true` Structure is [documented below](#nested_secondary_ip_range).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_ip_google_access`
- Description: (Optional) When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_ipv6_google_access`
- Description: (Optional) The private IPv6 google access type for the VMs in this subnet.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The GCP region for this subnetwork.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_config`
- Description: (Optional) This field denotes the VPC flow logging options for this subnetwork. If logging is enabled, logs are exported to Cloud Logging. Flow logging isn't supported if the subnet `purpose` field is set to subnetwork is `REGIONAL_MANAGED_PROXY` or `GLOBAL_MANAGED_PROXY`. Structure is [documented below](#nested_log_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stack_type`
- Description: (Optional) The stack type for this subnet to identify whether the IPv6 feature is enabled or not. If not specified IPV4_ONLY will be used. Possible values are: `IPV4_ONLY`, `IPV4_IPV6`, `IPV6_ONLY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ipv6_access_type`
- Description: (Optional) The access type of IPv6 address this subnet holds. It's immutable and can only be specified during creation or the first time the subnet is updated into IPV4_IPV6 dual stack. If the ipv6_type is EXTERNAL then this subnet cannot enable direct path. Possible values are: `EXTERNAL`, `INTERNAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_ipv6_prefix`
- Description: (Optional) The range of external IPv6 addresses that are owned by this subnetwork.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_collection`
- Description: (Optional) Resource reference of a PublicDelegatedPrefix. The PDP must be a sub-PDP in EXTERNAL_IPV6_SUBNETWORK_CREATION mode. Use one of the following formats to specify a sub-PDP when creating an IPv6 NetLB forwarding rule using BYOIP: Full resource URL, as in:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_subnet_cidr_routes_overlap`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Typically packets destined to IPs within the subnetwork range that do not match existing resources are dropped and prevented from leaving the VPC. Setting this field to true will allow these packets to match dynamic routes injected via BGP even if their destinations match existing subnet ranges.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_flow_logs`
- Description: (Optional, Deprecated) Whether to enable flow logging for this subnetwork. If this field is not explicitly set, it will not appear in get listings. If not set the default behavior is determined by the org policy, if there is no org policy specified, then it will default to disabled. This field isn't supported if the subnet purpose field is set to REGIONAL_MANAGED_PROXY. ~> **Warning:** This field is being removed in favor of log_config. If log_config is present, flow logs are enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `params`
- Description: (Optional) Additional params passed with the request, but not persisted as part of resource payload Structure is [documented below](#nested_params).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `send_secondary_ip_range_if_empty`
- Description: When false, removing secondary_ip_range from config will not produce a diff as the provider will default to the API's value. When true, the provider will treat removing secondary_ip_range as sending an empty list of secondary IP ranges to the API. Defaults to false. <a name="nested_secondary_ip_range"></a>The `secondary_ip_range` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range_name`
- Description: (Required) The name associated with this subnetwork secondary range, used when adding an alias IP range to a VM instance. The name must be 1-63 characters long, and comply with RFC1035. The name must be unique within the subnetwork.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_cidr_range`
- Description: (Optional) The range of IP addresses belonging to this subnetwork secondary range. Provide this property when you create the subnetwork. Ranges must be unique and non-overlapping with all primary and secondary IP ranges within a network. Only IPv4 is supported. Field is optional when `reserved_internal_range` is defined, otherwise required.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reserved_internal_range`
- Description: (Optional) The ID of the reserved internal range. Must be prefixed with `networkconnectivity.googleapis.com` E.g. `networkconnectivity.googleapis.com/projects/{project}/locations/global/internalRanges/{rangeId}` <a name="nested_log_config"></a>The `log_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aggregation_interval`
- Description: (Optional) Can only be specified if VPC flow logging for this subnetwork is enabled. Toggles the aggregation interval for collecting flow logs. Increasing the interval time will reduce the amount of generated flow logs for long lasting connections. Default is an interval of 5 seconds per connection. Default value is `INTERVAL_5_SEC`. Possible values are: `INTERVAL_5_SEC`, `INTERVAL_30_SEC`, `INTERVAL_1_MIN`, `INTERVAL_5_MIN`, `INTERVAL_10_MIN`, `INTERVAL_15_MIN`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `flow_sampling`
- Description: (Optional) Can only be specified if VPC flow logging for this subnetwork is enabled. The value of the field must be in [0, 1]. Set the sampling rate of VPC flow logs within the subnetwork where 1.0 means all collected logs are reported and 0.0 means no logs are reported. Default is 0.5 which means half of all collected logs are reported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) Can only be specified if VPC flow logging for this subnetwork is enabled. Configures whether metadata fields should be added to the reported VPC flow logs. Default value is `INCLUDE_ALL_METADATA`. Possible values are: `EXCLUDE_ALL_METADATA`, `INCLUDE_ALL_METADATA`, `CUSTOM_METADATA`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata_fields`
- Description: (Optional) List of metadata fields that should be added to reported logs. Can only be specified if VPC flow logs for this subnetwork is enabled and "metadata" is set to CUSTOM_METADATA.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter_expr`
- Description: (Optional) Export filter used to define which VPC flow logs should be logged, as as CEL expression. See https://cloud.google.com/vpc/docs/flow-logs#filtering for details on how to format this field. The default value is 'true', which evaluates to include everything. <a name="nested_params"></a>The `params` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_manager_tags`
- Description: (Optional) Resource manager tags to be bound to the subnetwork. Tag keys and values have the same definition as resource manager tags. Keys must be in the format tagKeys/{tag_key_id}, and values are in the format tagValues/456. The field is ignored when empty. The field is immutable and causes resource replacement when mutated. This field is only set at create time and modifying this field after creation will trigger recreation. To apply tags to an existing resource, see the google_tags_tag_binding resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
