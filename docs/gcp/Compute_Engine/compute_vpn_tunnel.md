## 🛡️ Policy Deployment Engine: `compute_vpn_tunnel`

This section provides a concise policy evaluation for the `compute_vpn_tunnel` resource in GCP.

Reference: [Terraform Registry – compute_vpn_tunnel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_vpn_tunnel)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shared_secret`
- Description: (Required) Shared secret used to set the secure session between the Cloud VPN gateway and the peer VPN gateway. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_vpn_gateway`
- Description: (Optional) URL of the Target VPN gateway with which this VPN tunnel is associated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpn_gateway`
- Description: (Optional) URL of the VPN gateway with which this VPN tunnel is associated. This must be used if a High Availability VPN gateway resource is created. This field must reference a `google_compute_ha_vpn_gateway` resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpn_gateway_interface`
- Description: (Optional) The interface ID of the VPN gateway with which this VPN tunnel is associated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_external_gateway`
- Description: (Optional) URL of the peer side external VPN gateway to which this VPN tunnel is connected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_external_gateway_interface`
- Description: (Optional) The interface ID of the external VPN gateway to which this VPN tunnel is connected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_gcp_gateway`
- Description: (Optional) URL of the peer side HA GCP VPN gateway to which this VPN tunnel is connected. If provided, the VPN tunnel will automatically use the same vpn_gateway_interface ID in the peer GCP VPN gateway. This field must reference a `google_compute_ha_vpn_gateway` resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `router`
- Description: (Optional) URL of router resource to be used for dynamic routing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_ip`
- Description: (Optional) IP address of the peer VPN gateway. Only IPv4 is supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ike_version`
- Description: (Optional) IKE protocol version to use when establishing the VPN tunnel with peer VPN gateway. Acceptable IKE versions are 1 or 2. Default version is 2.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_traffic_selector`
- Description: (Optional) Local traffic selector to use when establishing the VPN tunnel with peer VPN gateway. The value should be a CIDR formatted string, for example `192.168.0.0/16`. The ranges should be disjoint. Only IPv4 is supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remote_traffic_selector`
- Description: (Optional) Remote traffic selector to use when establishing the VPN tunnel with peer VPN gateway. The value should be a CIDR formatted string, for example `192.168.0.0/16`. The ranges should be disjoint. Only IPv4 is supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels to apply to this VpnTunnel. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cipher_suite`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) User specified list of ciphers to use for the phase 1 and phase 2 of the IKE protocol. Structure is [documented below](#nested_cipher_suite).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region where the tunnel is located. If unset, is set to the region of `target_vpn_gateway`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_cipher_suite"></a>The `cipher_suite` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `phase1`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Cipher configuration for phase 1 of the IKE protocol. Structure is [documented below](#nested_cipher_suite_phase1).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `phase2`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Cipher configuration for phase 2 of the IKE protocol. Structure is [documented below](#nested_cipher_suite_phase2). <a name="nested_cipher_suite_phase1"></a>The `phase1` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Encryption algorithms.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `integrity`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Integrity algorithms.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prf`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Pseudo-random functions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dh`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Diffie-Hellman groups. <a name="nested_cipher_suite_phase2"></a>The `phase2` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Encryption algorithms.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `integrity`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Integrity algorithms.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pfs`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Perfect forward secrecy groups.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
