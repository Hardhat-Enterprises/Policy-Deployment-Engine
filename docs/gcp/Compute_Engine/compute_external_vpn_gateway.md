## 🛡️ Policy Deployment Engine: `compute_external_vpn_gateway`

This section provides a concise policy evaluation for the `compute_external_vpn_gateway` resource in GCP.

Reference: [Terraform Registry – compute_external_vpn_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_external_vpn_gateway)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035.  Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels for the external VPN gateway resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redundancy_type`
- Description: (Optional) Indicates the redundancy type of this external VPN gateway Possible values are: `FOUR_IPS_REDUNDANCY`, `SINGLE_IP_INTERNALLY_REDUNDANT`, `TWO_IPS_REDUNDANCY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interface`
- Description: (Optional) A list of interfaces on this external VPN gateway. Structure is [documented below](#nested_interface).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_interface"></a>The `interface` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Optional) The numeric ID for this interface. Allowed values are based on the redundancy type of this external VPN gateway
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Optional) IP address of the interface in the external VPN gateway. Only IPv4 is supported. This IP address can be either from your on-premise gateway or another Cloud provider's VPN gateway, it cannot be an IP address from Google Compute Engine.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ipv6_address`
- Description: (Optional) IPv6 address of the interface in the external VPN gateway. This IPv6 address can be either from your on-premise gateway or another Cloud provider's VPN gateway, it cannot be an IP address from Google Compute Engine. Must specify an IPv6 address (not IPV4-mapped) using any format described in RFC 4291 (e.g. 2001:db8:0:0:2d9:51:0:0). The output format is RFC 5952 format (e.g. 2001:db8::2d9:51:0:0).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
