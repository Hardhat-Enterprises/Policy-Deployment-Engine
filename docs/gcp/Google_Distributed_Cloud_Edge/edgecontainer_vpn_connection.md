## 🛡️ Policy Deployment Engine: `edgecontainer_vpn_connection`

This section provides a concise policy evaluation for the `edgecontainer_vpn_connection` resource in GCP.

Reference: [Terraform Registry – edgecontainer_vpn_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgecontainer_vpn_connection)

---

## 1. Argument Reference

### `cluster`
- Description: (Required) The canonical Cluster name to connect to. It is in the form of projects/{project}/locations/{location}/clusters/{cluster}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The resource name of VPN connection
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Google Cloud Platform location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels associated with this resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nat_gateway_ip`
- Description: (Optional) NAT gateway IP, or WAN IP address. If a customer has multiple NAT IPs, the customer needs to configure NAT such that only one external IP maps to the GMEC Anthos cluster. This is empty if NAT is not used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc`
- Description: (Optional) The network ID of VPC to connect to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_project`
- Description: (Optional) Project detail of the VPC network. Required if VPC is in a different project than the cluster project. Structure is [documented below](#nested_vpc_project).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_high_availability`
- Description: (Optional) Whether this VPN connection has HA enabled on cluster side. If enabled, when creating VPN connection we will attempt to use 2 ANG floating IPs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `router`
- Description: (Optional) The VPN connection Cloud Router name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_vpc_project"></a>The `vpc_project` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) The project of the VPC to connect to. If not specified, it is the same as the cluster project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
