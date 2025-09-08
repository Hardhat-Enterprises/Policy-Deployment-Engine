## 🛡️ Policy Deployment Engine: `compute_ha_vpn_gateway`

This section provides a concise policy evaluation for the `compute_ha_vpn_gateway` resource in GCP.

Reference: [Terraform Registry – compute_ha_vpn_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_ha_vpn_gateway)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035.  Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `network` | The network this VPN gateway is accepting traffic for. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `stack_type` | The stack type for this VPN gateway to identify the IP protocols that are enabled. If not specified, IPV4_ONLY will be used. Default value is `IPV4_ONLY`. Possible values are: `IPV4_ONLY`, `IPV4_IPV6`, `IPV6_ONLY`. | false | None | None |
| `gateway_ip_version` | The IP family of the gateway IPs for the HA-VPN gateway interfaces. If not specified, IPV4 will be used. Default value is `IPV4`. Possible values are: `IPV4`, `IPV6`. | false | None | None |
| `labels` | Labels for this resource. These can only be added or modified by the setLabels method. Each label key/value pair must comply with RFC1035. Label values may be empty. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `region` | The region this gateway should sit in. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### vpn_interfaces Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | The numeric ID of this VPN gateway interface. | false | None | None |
| `ip_address` | (Output) The external IP address for this VPN gateway interface. | none | None | None |
| `interconnect_attachment` | URL of the interconnect attachment resource. When the value of this field is present, the VPN Gateway will be used for IPsec-encrypted Cloud Interconnect; all Egress or Ingress traffic for this VPN Gateway interface will go through the specified interconnect attachment resource. Not currently available publicly. | false | None | None |
