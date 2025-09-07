## 🛡️ Policy Deployment Engine: `compute_router_peer`

This section provides a concise policy evaluation for the `compute_router_peer` resource in GCP.

Reference: [Terraform Registry – compute_router_peer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_peer)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of this BGP peer. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interface`
- Description: (Required) Name of the interface the BGP peer is associated with.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_asn`
- Description: (Required) Peer BGP Autonomous System Number (ASN). Each BGP interface may use a different value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `router`
- Description: (Required) The name of the Cloud Router in which this BgpPeer will be configured. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Optional) IP address of the interface inside Google Cloud Platform. Only IPv4 is supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_ip_address`
- Description: (Optional) IP address of the BGP interface outside Google Cloud Platform. Only IPv4 is supported. Required if `ip_address` is set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advertised_route_priority`
- Description: (Optional) The priority of routes advertised to this BGP peer. Where there is more than one matching route of maximum length, the routes with the lowest priority value win.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zero_advertised_route_priority`
- Description: (Optional) The user-defined zero-advertised-route-priority for a advertised-route-priority in BGP session. This value has to be set true to force the advertised_route_priority to be 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advertise_mode`
- Description: (Optional) User-specified flag to indicate which mode to use for advertisement. Valid values of this enum field are: `DEFAULT`, `CUSTOM` Default value is `DEFAULT`. Possible values are: `DEFAULT`, `CUSTOM`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advertised_groups`
- Description: (Optional) User-specified list of prefix groups to advertise in custom mode, which currently supports the following option:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advertised_ip_ranges`
- Description: (Optional) User-specified list of individual IP ranges to advertise in custom mode. This field can only be populated if advertiseMode is `CUSTOM` and is advertised to all peers of the router. These IP ranges will be advertised in addition to any specified groups. Leave this field blank to advertise no custom IP ranges. Structure is [documented below](#nested_advertised_ip_ranges).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_learned_route_priority`
- Description: (Optional) The user-defined custom learned route priority for a BGP session. This value is applied to all custom learned route ranges for the session. You can choose a value from 0 to 65335. If you don't provide a value, Google Cloud assigns a priority of 100 to the ranges.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zero_custom_learned_route_priority`
- Description: (Optional) The user-defined zero-custom-learned-route-priority for a custom-learned-route-priority in BGP session. This value has to be set true to force the custom_learned_route_priority to be 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_learned_ip_ranges`
- Description: (Optional) The custom learned route IP address range. Must be a valid CIDR-formatted prefix. If an IP address is provided without a subnet mask, it is interpreted as, for IPv4, a /32 singular IP address range, and, for IPv6, /128. Structure is [documented below](#nested_custom_learned_ip_ranges).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bfd`
- Description: (Optional) BFD configuration for the BGP peering. Structure is [documented below](#nested_bfd).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable`
- Description: (Optional) The status of the BGP peer connection. If set to false, any active session with the peer is terminated and all associated routing information is removed. If set to true, the peer connection can be established with routing information. The default is true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `router_appliance_instance`
- Description: (Optional) The URI of the VM instance that is used as third-party router appliances such as Next Gen Firewalls, Virtual Routers, or Router Appliances. The VM instance must be located in zones contained in the same region as this Cloud Router. The VM instance is the peer side of the BGP session.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_ipv6`
- Description: (Optional) Enable IPv6 traffic over BGP Peer. If not specified, it is disabled by default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_ipv4`
- Description: (Optional) Enable IPv4 traffic over BGP Peer. It is enabled by default if the peerIpAddress is version 4.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ipv6_nexthop_address`
- Description: (Optional) IPv6 address of the interface inside Google Cloud Platform. The address must be in the range 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64. If you do not specify the next hop addresses, Google Cloud automatically assigns unused addresses from the 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64 range for you.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ipv4_nexthop_address`
- Description: (Optional) IPv4 address of the interface inside Google Cloud Platform.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_ipv6_nexthop_address`
- Description: (Optional) IPv6 address of the BGP interface outside Google Cloud Platform. The address must be in the range 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64. If you do not specify the next hop addresses, Google Cloud automatically assigns unused addresses from the 2600:2d00:0:2::/64 or 2600:2d00:0:3::/64 range for you.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_ipv4_nexthop_address`
- Description: (Optional) IPv4 address of the BGP interface outside Google Cloud Platform. *  `export_policies` - (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) routers.list of export policies applied to this peer, in the order they must be evaluated. The name must correspond to an existing policy that has ROUTE_POLICY_TYPE_EXPORT type. *  `import_policies` - (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) routers.list of import policies applied to this peer, in the order they must be evaluated. The name must correspond to an existing policy that has ROUTE_POLICY_TYPE_IMPORT type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) Region where the router and BgpPeer reside. If it is not provided, the provider region is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `md5_authentication_key`
- Description: Structure is [documented below](#nested_md5_authentication_key). <a name="nested_advertised_ip_ranges"></a>The `advertised_ip_ranges` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range`
- Description: (Required) The IP range to advertise. The value must be a CIDR-formatted string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-specified description for the IP range. <a name="nested_custom_learned_ip_ranges"></a>The `custom_learned_ip_ranges` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range`
- Description: (Required) The IP range to learn. The value must be a CIDR-formatted string. <a name="nested_bfd"></a>The `bfd` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_initialization_mode`
- Description: (Required) The BFD session initialization mode for this BGP peer. If set to `ACTIVE`, the Cloud Router will initiate the BFD session for this BGP peer. If set to `PASSIVE`, the Cloud Router will wait for the peer router to initiate the BFD session for this BGP peer. If set to `DISABLED`, BFD is disabled for this BGP peer. Possible values are: `ACTIVE`, `DISABLED`, `PASSIVE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_transmit_interval`
- Description: (Optional) The minimum interval, in milliseconds, between BFD control packets transmitted to the peer router. The actual value is negotiated between the two routers and is equal to the greater of this value and the corresponding receive interval of the other router. If set, this value must be between 1000 and 30000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_receive_interval`
- Description: (Optional) The minimum interval, in milliseconds, between BFD control packets received from the peer router. The actual value is negotiated between the two routers and is equal to the greater of this value and the transmit interval of the other router. If set, this value must be between 1000 and 30000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `multiplier`
- Description: (Optional) The number of consecutive BFD packets that must be missed before BFD declares that a peer is unavailable. If set, the value must be a value between 5 and 16. <a name="nested_md5_authentication_key"></a>The `md5_authentication_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name used to identify the key. Must be unique within a router. Must comply with RFC1035.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required, Input Only) The MD5 authentication key for this BGP peer. Maximum length is 80 characters. Can only contain printable ASCII characters
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
