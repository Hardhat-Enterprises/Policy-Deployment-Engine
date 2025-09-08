## 🛡️ Policy Deployment Engine: `compute_vpn_tunnel`

This section provides a concise policy evaluation for the `compute_vpn_tunnel` resource in GCP.

Reference: [Terraform Registry – compute_vpn_tunnel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_vpn_tunnel)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `shared_secret` | Shared secret used to set the secure session between the Cloud VPN gateway and the peer VPN gateway. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `target_vpn_gateway` | URL of the Target VPN gateway with which this VPN tunnel is associated. | false | None | None |
| `vpn_gateway` | URL of the VPN gateway with which this VPN tunnel is associated. This must be used if a High Availability VPN gateway resource is created. This field must reference a `google_compute_ha_vpn_gateway` resource. | false | None | None |
| `vpn_gateway_interface` | The interface ID of the VPN gateway with which this VPN tunnel is associated. | false | None | None |
| `peer_external_gateway` | URL of the peer side external VPN gateway to which this VPN tunnel is connected. | false | None | None |
| `peer_external_gateway_interface` | The interface ID of the external VPN gateway to which this VPN tunnel is connected. | false | None | None |
| `peer_gcp_gateway` | URL of the peer side HA GCP VPN gateway to which this VPN tunnel is connected. If provided, the VPN tunnel will automatically use the same vpn_gateway_interface ID in the peer GCP VPN gateway. This field must reference a `google_compute_ha_vpn_gateway` resource. | false | None | None |
| `router` | URL of router resource to be used for dynamic routing. | false | None | None |
| `peer_ip` | IP address of the peer VPN gateway. Only IPv4 is supported. | false | None | None |
| `ike_version` | IKE protocol version to use when establishing the VPN tunnel with peer VPN gateway. Acceptable IKE versions are 1 or 2. Default version is 2. | false | None | None |
| `local_traffic_selector` | Local traffic selector to use when establishing the VPN tunnel with peer VPN gateway. The value should be a CIDR formatted string, for example `192.168.0.0/16`. The ranges should be disjoint. Only IPv4 is supported. | false | None | None |
| `remote_traffic_selector` | Remote traffic selector to use when establishing the VPN tunnel with peer VPN gateway. The value should be a CIDR formatted string, for example `192.168.0.0/16`. The ranges should be disjoint. Only IPv4 is supported. | false | None | None |
| `labels` | Labels to apply to this VpnTunnel. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `region` | The region where the tunnel is located. If unset, is set to the region of `target_vpn_gateway`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### cipher_suite Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `phase1` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Cipher configuration for phase 1 of the IKE protocol. Structure is [documented below](#nested_cipher_suite_phase1). | false | None | None |
| `phase2` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Cipher configuration for phase 2 of the IKE protocol. Structure is [documented below](#nested_cipher_suite_phase2). | false | None | None |

### phase1 Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `encryption` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Encryption algorithms. | false | None | None |
| `integrity` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Integrity algorithms. | false | None | None |
| `prf` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Pseudo-random functions. | false | None | None |
| `dh` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Diffie-Hellman groups. | false | None | None |

### phase2 Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `encryption` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Encryption algorithms. | false | None | None |
| `integrity` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Integrity algorithms. | false | None | None |
| `pfs` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Perfect forward secrecy groups. | false | None | None |
