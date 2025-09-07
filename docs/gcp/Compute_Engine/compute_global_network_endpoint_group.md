## 🛡️ Policy Deployment Engine: `compute_global_network_endpoint_group`

This section provides a concise policy evaluation for the `compute_global_network_endpoint_group` resource in GCP.

Reference: [Terraform Registry – compute_global_network_endpoint_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_network_endpoint_group)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource; provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_endpoint_type`
- Description: (Required) Type of network endpoints in this network endpoint group. Possible values are: `INTERNET_IP_PORT`, `INTERNET_FQDN_PORT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. Provide this property when you create the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_port`
- Description: (Optional) The default port used if the port number is not specified in the network endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
