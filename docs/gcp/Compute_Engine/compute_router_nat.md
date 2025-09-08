## 🛡️ Policy Deployment Engine: `compute_router_nat`

This section provides a concise policy evaluation for the `compute_router_nat` resource in GCP.

Reference: [Terraform Registry – compute_router_nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the NAT service. The name must be 1-63 characters long and comply with RFC1035. | true | None | None |
| `source_subnetwork_ip_ranges_to_nat` | How NAT should be configured per Subnetwork. If `ALL_SUBNETWORKS_ALL_IP_RANGES`, all of the IP ranges in every Subnetwork are allowed to Nat. If `ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES`, all of the primary IP ranges in every Subnetwork are allowed to Nat. `LIST_OF_SUBNETWORKS`: A list of Subnetworks are allowed to Nat (specified in the field subnetwork below). Note that if this field contains ALL_SUBNETWORKS_ALL_IP_RANGES or ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, then there should not be any other RouterNat section in any Router for this network in this region. Possible values are: `ALL_SUBNETWORKS_ALL_IP_RANGES`, `ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES`, `LIST_OF_SUBNETWORKS`. | true | None | None |
| `router` | The name of the Cloud Router in which this NAT will be configured. | true | None | None |
| `nat_ip_allocate_option` | How external IPs should be allocated for this NAT. Valid values are `AUTO_ONLY` for only allowing NAT IPs allocated by Google Cloud Platform, or `MANUAL_ONLY` for only user-allocated NAT IP addresses. Possible values are: `MANUAL_ONLY`, `AUTO_ONLY`. | false | None | None |
| `initial_nat_ips` | Self-links of NAT IPs to be used as initial value for creation alongside a RouterNatAddress resource. Conflicts with natIps and drainNatIps. Only valid if natIpAllocateOption is set to MANUAL_ONLY. | false | None | None |
| `nat_ips` | Self-links of NAT IPs. Only valid if natIpAllocateOption is set to MANUAL_ONLY. If this field is used alongside with a count created list of address resources `google_compute_address.foobar.*.self_link`, the access level resource for the address resource must have a `lifecycle` block with `create_before_destroy = true` so the number of resources can be increased/decreased without triggering the `resourceInUseByAnotherResource` error. | false | None | None |
| `drain_nat_ips` | A list of URLs of the IP resources to be drained. These IPs must be valid static external IPs that have been assigned to the NAT. | false | None | None |
| `source_subnetwork_ip_ranges_to_nat64` | Specify the Nat option for NAT64, which can take one of the following values: ALL_IPV6_SUBNETWORKS: All of the IP ranges in every Subnetwork are allowed to Nat. LIST_OF_IPV6_SUBNETWORKS: A list of Subnetworks are allowed to Nat (specified in the field nat64Subnetwork below). Note that if this field contains NAT64_ALL_V6_SUBNETWORKS no other Router.Nat section in this region can also enable NAT64 for any Subnetworks in this network. Other Router.Nat sections can still be present to enable NAT44 only. Possible values are: `ALL_IPV6_SUBNETWORKS`, `LIST_OF_IPV6_SUBNETWORKS`. | false | None | None |
| `min_ports_per_vm` | Minimum number of ports allocated to a VM from this NAT. Defaults to 64 for static port allocation and 32 dynamic port allocation if not set. | false | None | None |
| `max_ports_per_vm` | Maximum number of ports allocated to a VM from this NAT. This field can only be set when enableDynamicPortAllocation is enabled. | false | None | None |
| `enable_dynamic_port_allocation` | Enable Dynamic Port Allocation. If minPortsPerVm is set, minPortsPerVm must be set to a power of two greater than or equal to 32. If minPortsPerVm is not set, a minimum of 32 ports will be allocated to a VM from this NAT config. If maxPortsPerVm is set, maxPortsPerVm must be set to a power of two greater than minPortsPerVm. If maxPortsPerVm is not set, a maximum of 65536 ports will be allocated to a VM from this NAT config. Mutually exclusive with enableEndpointIndependentMapping. | false | None | None |
| `udp_idle_timeout_sec` | Timeout (in seconds) for UDP connections. Defaults to 30s if not set. | false | None | None |
| `icmp_idle_timeout_sec` | Timeout (in seconds) for ICMP connections. Defaults to 30s if not set. | false | None | None |
| `tcp_established_idle_timeout_sec` | Timeout (in seconds) for TCP established connections. Defaults to 1200s if not set. | false | None | None |
| `tcp_transitory_idle_timeout_sec` | Timeout (in seconds) for TCP transitory connections. Defaults to 30s if not set. | false | None | None |
| `tcp_time_wait_timeout_sec` | Timeout (in seconds) for TCP connections that are in TIME_WAIT state. Defaults to 120s if not set. | false | None | None |
| `endpoint_types` | Specifies the endpoint Types supported by the NAT Gateway. Supported values include: `ENDPOINT_TYPE_VM`, `ENDPOINT_TYPE_SWG`, `ENDPOINT_TYPE_MANAGED_PROXY_LB`. | false | None | None |
| `enable_endpoint_independent_mapping` | Enable endpoint independent mapping. For more information see the [official documentation](https://cloud.google.com/nat/docs/overview#specs-rfcs). | false | None | None |
| `type` | Indicates whether this NAT is used for public or private IP translation. If unspecified, it defaults to PUBLIC. If `PUBLIC` NAT used for public IP translation. If `PRIVATE` NAT used for private IP translation. Default value is `PUBLIC`. Possible values are: `PUBLIC`, `PRIVATE`. | false | None | None |
| `auto_network_tier` | The network tier to use when automatically reserving NAT IP addresses. Must be one of: PREMIUM, STANDARD. If not specified, then the current project-level default tier is used. Possible values are: `PREMIUM`, `STANDARD`. | false | None | None |
| `region` | Region where the router and NAT reside. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### subnetwork Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Self-link of subnetwork to NAT | true | None | None |
| `source_ip_ranges_to_nat` | List of options for which source IPs in the subnetwork should have NAT enabled. Supported values include: `ALL_IP_RANGES`, `LIST_OF_SECONDARY_IP_RANGES`, `PRIMARY_IP_RANGE`. | true | None | None |
| `secondary_ip_range_names` | List of the secondary ranges of the subnetwork that are allowed to use NAT. This can be populated only if `LIST_OF_SECONDARY_IP_RANGES` is one of the values in sourceIpRangesToNat | false | None | None |

### nat64_subnetwork Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Self-link of the subnetwork resource that will use NAT64 | true | None | None |

### log_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable` | Indicates whether or not to export logs. | true | None | None |
| `filter` | Specifies the desired filtering of logs on this NAT. Possible values are: `ERRORS_ONLY`, `TRANSLATIONS_ONLY`, `ALL`. | true | None | None |

### rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `rule_number` | An integer uniquely identifying a rule in the list. The rule number must be a positive value between 0 and 65000, and must be unique among rules within a NAT. | true | None | None |
| `description` | An optional description of this rule. | false | None | None |
| `match` | CEL expression that specifies the match condition that egress traffic from a VM is evaluated against. If it evaluates to true, the corresponding action is enforced. The following examples are valid match expressions for public NAT: "inIpRange(destination.ip, '1.1.0.0/16') || inIpRange(destination.ip, '2.2.0.0/16')" "destination.ip == '1.1.0.1' || destination.ip == '8.8.8.8'" The following example is a valid match expression for private NAT: "nexthop.hub == 'https://networkconnectivity.googleapis.com/v1alpha1/projects/my-project/global/hub/hub-1'" | true | None | None |
| `action` | The action to be enforced for traffic that matches this rule. Structure is [documented below](#nested_rules_rules_action). | false | None | None |

### action Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source_nat_active_ips` | A list of URLs of the IP resources used for this NAT rule. These IP addresses must be valid static external IP addresses assigned to the project. This field is used for public NAT. | false | None | None |
| `source_nat_drain_ips` | A list of URLs of the IP resources to be drained. These IPs must be valid static external IPs that have been assigned to the NAT. These IPs should be used for updating/patching a NAT rule only. This field is used for public NAT. | false | None | None |
| `source_nat_active_ranges` | A list of URLs of the subnetworks used as source ranges for this NAT Rule. These subnetworks must have purpose set to PRIVATE_NAT. This field is used for private NAT. | false | None | None |
| `source_nat_drain_ranges` | A list of URLs of subnetworks representing source ranges to be drained. This is only supported on patch/update, and these subnetworks must have previously been used as active ranges in this NAT Rule. This field is used for private NAT. | false | None | None |
