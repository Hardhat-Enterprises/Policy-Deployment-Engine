## 🛡️ Policy Deployment Engine: `compute_router`

This section provides a concise policy evaluation for the `compute_router` resource in GCP.

Reference: [Terraform Registry – compute_router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) A reference to the network to which this router belongs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bgp`
- Description: (Optional) BGP information specific to this router. Structure is [documented below](#nested_bgp).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encrypted_interconnect_router`
- Description: (Optional) Indicates if a router is dedicated for use with encrypted VLAN attachments (interconnectAttachments).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `md5_authentication_keys`
- Description: (Optional) Keys used for MD5 authentication. Structure is [documented below](#nested_md5_authentication_keys).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `params`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Additional params passed with the request, but not persisted as part of resource payload Structure is [documented below](#nested_params).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) Region where the router resides.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_bgp"></a>The `bgp` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `asn`
- Description: (Required) Local BGP Autonomous System Number (ASN). Must be an RFC6996 private ASN, either 16-bit or 32-bit. The value will be fixed for this router resource. All VPN tunnels that link to this router will have the same local ASN.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advertise_mode`
- Description: (Optional) User-specified flag to indicate which mode to use for advertisement. Default value is `DEFAULT`. Possible values are: `DEFAULT`, `CUSTOM`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advertised_groups`
- Description: (Optional) User-specified list of prefix groups to advertise in custom mode. This field can only be populated if advertiseMode is CUSTOM and is advertised to all peers of the router. These groups will be advertised in addition to any specified prefixes. Leave this field blank to advertise no custom groups. This enum field has the one valid value: ALL_SUBNETS
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advertised_ip_ranges`
- Description: (Optional) User-specified list of individual IP ranges to advertise in custom mode. This field can only be populated if advertiseMode is CUSTOM and is advertised to all peers of the router. These IP ranges will be advertised in addition to any specified groups. Leave this field blank to advertise no custom IP ranges. Structure is [documented below](#nested_bgp_advertised_ip_ranges).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `keepalive_interval`
- Description: (Optional) The interval in seconds between BGP keepalive messages that are sent to the peer. Hold time is three times the interval at which keepalive messages are sent, and the hold time is the maximum number of seconds allowed to elapse between successive keepalive messages that BGP receives from a peer. BGP will use the smaller of either the local hold time value or the peer's hold time value as the hold time for the BGP connection between the two peers. If set, this value must be between 20 and 60. The default is 20.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `identifier_range`
- Description: (Optional) Explicitly specifies a range of valid BGP Identifiers for this Router. It is provided as a link-local IPv4 range (from 169.254.0.0/16), of size at least /30, even if the BGP sessions are over IPv6. It must not overlap with any IPv4 BGP session ranges. Other vendors commonly call this router ID. <a name="nested_bgp_advertised_ip_ranges"></a>The `advertised_ip_ranges` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range`
- Description: (Required) The IP range to advertise. The value must be a CIDR-formatted string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-specified description for the IP range. <a name="nested_md5_authentication_keys"></a>The `md5_authentication_keys` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name used to identify the key. Must be unique within a router. Must be referenced by exactly one bgpPeer. Must comply with RFC1035.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) Value of the key used for MD5 authentication. <a name="nested_params"></a>The `params` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_manager_tags`
- Description: (Optional) Resource manager tags to be bound to the router. Tag keys and values have the same definition as resource manager tags. Keys must be in the format tagKeys/{tag_key_id}, and values are in the format tagValues/456.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
