## 🛡️ Policy Deployment Engine: `compute_router_nat`

This section provides a concise policy evaluation for the `compute_router_nat` resource in GCP.

Reference: [Terraform Registry – compute_router_nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the NAT service. The name must be 1-63 characters long and comply with RFC1035.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_subnetwork_ip_ranges_to_nat`
- Description: (Required) How NAT should be configured per Subnetwork. If `ALL_SUBNETWORKS_ALL_IP_RANGES`, all of the IP ranges in every Subnetwork are allowed to Nat. If `ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES`, all of the primary IP ranges in every Subnetwork are allowed to Nat. `LIST_OF_SUBNETWORKS`: A list of Subnetworks are allowed to Nat (specified in the field subnetwork below). Note that if this field contains ALL_SUBNETWORKS_ALL_IP_RANGES or ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, then there should not be any other RouterNat section in any Router for this network in this region. Possible values are: `ALL_SUBNETWORKS_ALL_IP_RANGES`, `ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES`, `LIST_OF_SUBNETWORKS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `router`
- Description: (Required) The name of the Cloud Router in which this NAT will be configured.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nat_ip_allocate_option`
- Description: (Optional) How external IPs should be allocated for this NAT. Valid values are `AUTO_ONLY` for only allowing NAT IPs allocated by Google Cloud Platform, or `MANUAL_ONLY` for only user-allocated NAT IP addresses. Possible values are: `MANUAL_ONLY`, `AUTO_ONLY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initial_nat_ips`
- Description: (Optional) Self-links of NAT IPs to be used as initial value for creation alongside a RouterNatAddress resource. Conflicts with natIps and drainNatIps. Only valid if natIpAllocateOption is set to MANUAL_ONLY.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nat_ips`
- Description: (Optional) Self-links of NAT IPs. Only valid if natIpAllocateOption is set to MANUAL_ONLY. If this field is used alongside with a count created list of address resources `google_compute_address.foobar.*.self_link`, the access level resource for the address resource must have a `lifecycle` block with `create_before_destroy = true` so the number of resources can be increased/decreased without triggering the `resourceInUseByAnotherResource` error.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `drain_nat_ips`
- Description: (Optional) A list of URLs of the IP resources to be drained. These IPs must be valid static external IPs that have been assigned to the NAT.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: (Optional) One or more subnetwork NAT configurations. Only used if `source_subnetwork_ip_ranges_to_nat` is set to `LIST_OF_SUBNETWORKS` Structure is [documented below](#nested_subnetwork).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_subnetwork_ip_ranges_to_nat64`
- Description: (Optional) Specify the Nat option for NAT64, which can take one of the following values: ALL_IPV6_SUBNETWORKS: All of the IP ranges in every Subnetwork are allowed to Nat. LIST_OF_IPV6_SUBNETWORKS: A list of Subnetworks are allowed to Nat (specified in the field nat64Subnetwork below). Note that if this field contains NAT64_ALL_V6_SUBNETWORKS no other Router.Nat section in this region can also enable NAT64 for any Subnetworks in this network. Other Router.Nat sections can still be present to enable NAT44 only. Possible values are: `ALL_IPV6_SUBNETWORKS`, `LIST_OF_IPV6_SUBNETWORKS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nat64_subnetwork`
- Description: (Optional) One or more subnetwork NAT configurations whose traffic should be translated by NAT64 Gateway. Only used if `source_subnetwork_ip_ranges_to_nat64` is set to `LIST_OF_IPV6_SUBNETWORKS` Structure is [documented below](#nested_nat64_subnetwork).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_ports_per_vm`
- Description: (Optional) Minimum number of ports allocated to a VM from this NAT. Defaults to 64 for static port allocation and 32 dynamic port allocation if not set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_ports_per_vm`
- Description: (Optional) Maximum number of ports allocated to a VM from this NAT. This field can only be set when enableDynamicPortAllocation is enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_dynamic_port_allocation`
- Description: (Optional) Enable Dynamic Port Allocation. If minPortsPerVm is set, minPortsPerVm must be set to a power of two greater than or equal to 32. If minPortsPerVm is not set, a minimum of 32 ports will be allocated to a VM from this NAT config. If maxPortsPerVm is set, maxPortsPerVm must be set to a power of two greater than minPortsPerVm. If maxPortsPerVm is not set, a maximum of 65536 ports will be allocated to a VM from this NAT config. Mutually exclusive with enableEndpointIndependentMapping.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `udp_idle_timeout_sec`
- Description: (Optional) Timeout (in seconds) for UDP connections. Defaults to 30s if not set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `icmp_idle_timeout_sec`
- Description: (Optional) Timeout (in seconds) for ICMP connections. Defaults to 30s if not set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tcp_established_idle_timeout_sec`
- Description: (Optional) Timeout (in seconds) for TCP established connections. Defaults to 1200s if not set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tcp_transitory_idle_timeout_sec`
- Description: (Optional) Timeout (in seconds) for TCP transitory connections. Defaults to 30s if not set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tcp_time_wait_timeout_sec`
- Description: (Optional) Timeout (in seconds) for TCP connections that are in TIME_WAIT state. Defaults to 120s if not set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_config`
- Description: (Optional) Configuration for logging on NAT Structure is [documented below](#nested_log_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoint_types`
- Description: (Optional) Specifies the endpoint Types supported by the NAT Gateway. Supported values include: `ENDPOINT_TYPE_VM`, `ENDPOINT_TYPE_SWG`, `ENDPOINT_TYPE_MANAGED_PROXY_LB`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rules`
- Description: (Optional) A list of rules associated with this NAT. Structure is [documented below](#nested_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_endpoint_independent_mapping`
- Description: (Optional) Enable endpoint independent mapping. For more information see the [official documentation](https://cloud.google.com/nat/docs/overview#specs-rfcs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Indicates whether this NAT is used for public or private IP translation. If unspecified, it defaults to PUBLIC. If `PUBLIC` NAT used for public IP translation. If `PRIVATE` NAT used for private IP translation. Default value is `PUBLIC`. Possible values are: `PUBLIC`, `PRIVATE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_network_tier`
- Description: (Optional) The network tier to use when automatically reserving NAT IP addresses. Must be one of: PREMIUM, STANDARD. If not specified, then the current project-level default tier is used. Possible values are: `PREMIUM`, `STANDARD`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) Region where the router and NAT reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_subnetwork"></a>The `subnetwork` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Self-link of subnetwork to NAT
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_ip_ranges_to_nat`
- Description: (Required) List of options for which source IPs in the subnetwork should have NAT enabled. Supported values include: `ALL_IP_RANGES`, `LIST_OF_SECONDARY_IP_RANGES`, `PRIMARY_IP_RANGE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_ip_range_names`
- Description: (Optional) List of the secondary ranges of the subnetwork that are allowed to use NAT. This can be populated only if `LIST_OF_SECONDARY_IP_RANGES` is one of the values in sourceIpRangesToNat <a name="nested_nat64_subnetwork"></a>The `nat64_subnetwork` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Self-link of the subnetwork resource that will use NAT64 <a name="nested_log_config"></a>The `log_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable`
- Description: (Required) Indicates whether or not to export logs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Required) Specifies the desired filtering of logs on this NAT. Possible values are: `ERRORS_ONLY`, `TRANSLATIONS_ONLY`, `ALL`. <a name="nested_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rule_number`
- Description: (Required) An integer uniquely identifying a rule in the list. The rule number must be a positive value between 0 and 65000, and must be unique among rules within a NAT.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match`
- Description: (Required) CEL expression that specifies the match condition that egress traffic from a VM is evaluated against. If it evaluates to true, the corresponding action is enforced. The following examples are valid match expressions for public NAT: "inIpRange(destination.ip, '1.1.0.0/16') || inIpRange(destination.ip, '2.2.0.0/16')" "destination.ip == '1.1.0.1' || destination.ip == '8.8.8.8'" The following example is a valid match expression for private NAT: "nexthop.hub == 'https://networkconnectivity.googleapis.com/v1alpha1/projects/my-project/global/hub/hub-1'"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Optional) The action to be enforced for traffic that matches this rule. Structure is [documented below](#nested_rules_rules_action). <a name="nested_rules_rules_action"></a>The `action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_nat_active_ips`
- Description: (Optional) A list of URLs of the IP resources used for this NAT rule. These IP addresses must be valid static external IP addresses assigned to the project. This field is used for public NAT.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_nat_drain_ips`
- Description: (Optional) A list of URLs of the IP resources to be drained. These IPs must be valid static external IPs that have been assigned to the NAT. These IPs should be used for updating/patching a NAT rule only. This field is used for public NAT.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_nat_active_ranges`
- Description: (Optional) A list of URLs of the subnetworks used as source ranges for this NAT Rule. These subnetworks must have purpose set to PRIVATE_NAT. This field is used for private NAT.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_nat_drain_ranges`
- Description: (Optional) A list of URLs of subnetworks representing source ranges to be drained. This is only supported on patch/update, and these subnetworks must have previously been used as active ranges in this NAT Rule. This field is used for private NAT.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
