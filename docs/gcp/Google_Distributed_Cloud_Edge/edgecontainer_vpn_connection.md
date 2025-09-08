## 🛡️ Policy Deployment Engine: `edgecontainer_vpn_connection`

This section provides a concise policy evaluation for the `edgecontainer_vpn_connection` resource in GCP.

Reference: [Terraform Registry – edgecontainer_vpn_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgecontainer_vpn_connection)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster` | The canonical Cluster name to connect to. It is in the form of projects/{project}/locations/{location}/clusters/{cluster}. | true | None | None |
| `name` | The resource name of VPN connection | true | None | None |
| `location` | Google Cloud Platform location. | true | None | None |
| `labels` | Labels associated with this resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `nat_gateway_ip` | NAT gateway IP, or WAN IP address. If a customer has multiple NAT IPs, the customer needs to configure NAT such that only one external IP maps to the GMEC Anthos cluster. This is empty if NAT is not used. | false | None | None |
| `vpc` | The network ID of VPC to connect to. | false | None | None |
| `enable_high_availability` | Whether this VPN connection has HA enabled on cluster side. If enabled, when creating VPN connection we will attempt to use 2 ANG floating IPs. | false | None | None |
| `router` | The VPN connection Cloud Router name. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### vpc_project Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | The project of the VPC to connect to. If not specified, it is the same as the cluster project. | false | None | None |
