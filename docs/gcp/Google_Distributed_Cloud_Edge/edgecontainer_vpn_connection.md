## 🛡️ Policy Deployment Engine: `edgecontainer_vpn_connection`

This section provides a concise policy evaluation for the `edgecontainer_vpn_connection` resource in GCP.

Reference: [Terraform Registry – edgecontainer_vpn_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgecontainer_vpn_connection)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster` | The canonical Cluster name to connect to. It is in the form of projects/{project}/locations/{location}/clusters/{cluster}. | true | true | Proper cluster reference ensures the VPN connection is established with the correct, authorized cluster with appropriate security controls. | projects/my-project/locations/us-central1/clusters/my-cluster | Incorrect or unauthorized cluster reference |
| `name` | The resource name of VPN connection. | true | false | VPN connection name is an identifier and doesn't directly impact security. | None | None |
| `location` | Google Cloud Platform location. | true | true | Location selection impacts data residency, compliance with regional regulations, and network latency for VPN connections. | us-central1 | Unapproved or restricted regions |
| `labels` | Labels associated with this resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Proper labeling ensures VPN connections can be properly identified, tracked, and managed according to organizational policies and security requirements. | Contains required labels: environment, purpose, network-tier | Missing required labels or using non-standard label names |
| `nat_gateway_ip` | NAT gateway IP, or WAN IP address. If a customer has multiple NAT IPs, the customer needs to configure NAT such that only one external IP maps to the GMEC Anthos cluster. This is empty if NAT is not used. | false | true | NAT gateway IP configuration impacts network security, traffic routing, and exposure of internal resources to external networks. | Properly configured NAT IP with appropriate firewall rules | Misconfigured NAT or overly permissive NAT settings |
| `vpc` | The network ID of VPC to connect to. | false | true | VPC selection determines which network resources the VPN can access and impacts network segmentation and security boundaries. | Proper VPC network reference with appropriate security controls | Unauthorized or improperly secured VPC network |
| `vpc_project` | Project detail of the VPC network. Required if VPC is in a different project than the cluster project. | false | true | Cross-project VPC connections require proper authorization and security controls to prevent unauthorized access between projects. | Properly authorized cross-project VPC configuration | Unauthorized cross-project VPC connections |
| `enable_high_availability` | Whether this VPN connection has HA enabled on cluster side. If enabled, when creating VPN connection we will attempt to use 2 ANG floating IPs. | false | true | High availability ensures VPN connection resilience and continuous connectivity, which is critical for production environments. | true (for production environments) | false (for production environments where HA is required) |
| `router` | The VPN connection Cloud Router name. | false | true | Cloud Router configuration impacts routing policies, BGP peering, and network traffic control between VPN endpoints. | Properly configured Cloud Router with secure routing policies | Misconfigured or insecure router settings |
| `project` | If it is not provided, the provider project is used. | false | true | Project selection impacts resource isolation, billing accountability, and access control boundaries for the VPN connection. | Proper project reference | Incorrect or unauthorized project |

### vpc_project Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project_id` | The project of the VPC to connect to. If not specified, it is the same as the cluster project. | false | true | Project ID must reference an authorized project with proper security controls and network policies. | authorized-vpc-project | Unauthorized or incorrect project reference |
