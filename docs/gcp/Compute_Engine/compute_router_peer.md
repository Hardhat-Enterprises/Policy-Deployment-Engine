## 🛡️ Policy Deployment Engine: `compute_router_peer`

This section provides a concise policy evaluation for the `compute_router_peer` resource in GCP.

Reference: [Terraform Registry – compute_router_peer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_peer)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of this BGP peer. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `interface` | Name of the interface the BGP peer is associated with. | true | None | None |
| `peer_asn` | Peer BGP Autonomous System Number (ASN). Each BGP interface may use a different value. | true | None | None |
| `router` | The name of the Cloud Router in which this BgpPeer will be configured. - - - | true | None | None |
| `ip_address` | IP address of the interface inside Google Cloud Platform. Only IPv4 is supported. | false | None | None |
| `peer_ip_address` | IP address of the BGP interface outside Google Cloud Platform. Only IPv4 is supported. Required if `ip_address` is set. | false | None | None |
| `advertised_route_priority` | The priority of routes advertised to this BGP peer. Where there is more than one matching route of maximum length, the routes with the lowest priority value win. | false | None | None |
| `zero_advertised_route_priority` | The user-defined zero-advertised-route-priority for a advertised-route-priority in BGP session. This value has to be set true to force the advertised_route_priority to be 0. | false | None | None |
| `advertise_mode` | User-specified flag to indicate which mode to use for advertisement. Valid values of this enum field are: `DEFAULT`, `CUSTOM` Default value is `DEFAULT`. Possible values are: `DEFAULT`, `CUSTOM`. | false | None | None |
| `advertised_groups` | User-specified list of prefix groups to advertise in custom mode, which currently supports the following option: * `ALL_SUBNETS`: Advertises all of the router's own VPC subnets. This excludes any routes learned for subnets that use VPC Network Peering. Note that this field can only be populated if advertiseMode is `CUSTOM` and overrides the list defined for the router (in the "bgp" message). These groups are advertised in addition to any specified prefixes. Leave this field blank to advertise no custom groups. | false | None | None |
| `custom_learned_route_priority` | The user-defined custom learned route priority for a BGP session. This value is applied to all custom learned route ranges for the session. You can choose a value from 0 to 65335. If you don't provide a value, Google Cloud assigns a priority of 100 to the ranges. | false | None | None |
| `zero_custom_learned_route_priority` | The user-defined zero-custom-learned-route-priority for a custom-learned-route-priority in BGP session. This value has to be set true to force the custom_learned_route_priority to be 0. | false | None | None |
| `enable` | The status of the BGP peer connection. If set to false, any active session with the peer is terminated and all associated routing information is removed. If set to true, the peer connection can be established with routing information. The default is true. | false | None | None |
| `router_appliance_instance` | The URI of the VM instance that is used as third-party router appliances such as Next Gen Firewalls, Virtual Routers, or Router Appliances. The VM instance must be located in zones contained in the same region as this Cloud Router. The VM instance is the peer side of the BGP session. | false | None | None |
| `enable_ipv6` | Enable IPv6 traffic over BGP Peer. If not specified, it is disabled by default. | false | None | None |
| `enable_ipv4` | Enable IPv4 traffic over BGP Peer. It is enabled by default if the peerIpAddress is version 4. | false | None | None |
| `ipv6_nexthop_address` | IPv6 address of the interface inside Google Cloud Platform. The address must be in the range 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64. If you do not specify the next hop addresses, Google Cloud automatically assigns unused addresses from the 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64 range for you. | false | None | None |
| `ipv4_nexthop_address` | IPv4 address of the interface inside Google Cloud Platform. | false | None | None |
| `peer_ipv6_nexthop_address` | IPv6 address of the BGP interface outside Google Cloud Platform. The address must be in the range 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64. If you do not specify the next hop addresses, Google Cloud automatically assigns unused addresses from the 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64 range for you. | false | None | None |
| `peer_ipv4_nexthop_address` | IPv4 address of the BGP interface outside Google Cloud Platform. | false | None | None |
| `export_policies` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) routers.list of export policies applied to this peer, in the order they must be evaluated. The name must correspond to an existing policy that has ROUTE_POLICY_TYPE_EXPORT type. | false | None | None |
| `import_policies` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) routers.list of import policies applied to this peer, in the order they must be evaluated. The name must correspond to an existing policy that has ROUTE_POLICY_TYPE_IMPORT type. | false | None | None |
| `region` | Region where the router and BgpPeer reside. If it is not provided, the provider region is used. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### advertised_ip_ranges Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `range` | The IP range to advertise. The value must be a CIDR-formatted string. | true | None | None |
| `description` | User-specified description for the IP range. | false | None | None |

### custom_learned_ip_ranges Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `range` | The IP range to learn. The value must be a CIDR-formatted string. | true | None | None |

### bfd Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `session_initialization_mode` | The BFD session initialization mode for this BGP peer. If set to `ACTIVE`, the Cloud Router will initiate the BFD session for this BGP peer. If set to `PASSIVE`, the Cloud Router will wait for the peer router to initiate the BFD session for this BGP peer. If set to `DISABLED`, BFD is disabled for this BGP peer. Possible values are: `ACTIVE`, `DISABLED`, `PASSIVE`. | true | None | None |
| `min_transmit_interval` | The minimum interval, in milliseconds, between BFD control packets transmitted to the peer router. The actual value is negotiated between the two routers and is equal to the greater of this value and the corresponding receive interval of the other router. If set, this value must be between 1000 and 30000. | false | None | None |
| `min_receive_interval` | The minimum interval, in milliseconds, between BFD control packets received from the peer router. The actual value is negotiated between the two routers and is equal to the greater of this value and the transmit interval of the other router. If set, this value must be between 1000 and 30000. | false | None | None |
| `multiplier` | The number of consecutive BFD packets that must be missed before BFD declares that a peer is unavailable. If set, the value must be a value between 5 and 16. | false | None | None |

### md5_authentication_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name used to identify the key. Must be unique within a router. Must comply with RFC1035. | true | None | None |
| `key` | , Input Only) The MD5 authentication key for this BGP peer. Maximum length is 80 characters. Can only contain printable ASCII characters | true | None | None |
