## 🛡️ Policy Deployment Engine: `dns_policy`

This section provides a concise policy evaluation for the `dns_policy` resource in GCP.

Reference: [Terraform Registry – dns_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_policy)

---

## 1. Argument Reference

### `name`
- Description: (Required) User assigned name for this policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `alternative_name_server_config`
- Description: (Optional) Sets an alternative name server for the associated networks. When specified, all DNS queries are forwarded to a name server that you choose. Names such as .internal are not available when an alternative name server is specified. Structure is [documented below](#nested_alternative_name_server_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A textual description field. Defaults to 'Managed by Terraform'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns64_config`
- Description: (Optional) Configurations related to DNS64 for this Policy. Structure is [documented below](#nested_dns64_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_inbound_forwarding`
- Description: (Optional) Allows networks bound to this policy to receive DNS queries sent by VMs or applications over VPN connections. When enabled, a virtual IP address will be allocated from each of the sub-networks that are bound to this policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_logging`
- Description: (Optional) Controls whether logging is enabled for the networks bound to this policy. Defaults to no logging if not set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `networks`
- Description: (Optional) List of network names specifying networks to which this policy is applied. Structure is [documented below](#nested_networks).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_alternative_name_server_config"></a>The `alternative_name_server_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_name_servers`
- Description: (Required) Sets an alternative name server for the associated networks. When specified, all DNS queries are forwarded to a name server that you choose. Names such as .internal are not available when an alternative name server is specified. Structure is [documented below](#nested_alternative_name_server_config_target_name_servers). <a name="nested_alternative_name_server_config_target_name_servers"></a>The `target_name_servers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ipv4_address`
- Description: (Required) IPv4 address to forward to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `forwarding_path`
- Description: (Optional) Forwarding path for this TargetNameServer. If unset or `default` Cloud DNS will make forwarding decision based on address ranges, i.e. RFC1918 addresses go to the VPC, Non-RFC1918 addresses go to the Internet. When set to `private`, Cloud DNS will always send queries through VPC for this target Possible values are: `default`, `private`. <a name="nested_dns64_config"></a>The `dns64_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: (Required) The scope to which DNS64 config will be applied to. Structure is [documented below](#nested_dns64_config_scope). <a name="nested_dns64_config_scope"></a>The `scope` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `all_queries`
- Description: (Optional) Controls whether DNS64 is enabled globally at the network level. <a name="nested_networks"></a>The `networks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_url`
- Description: (Required) The id or fully qualified URL of the VPC network to forward queries to. This should be formatted like `projects/{project}/global/networks/{network}` or `https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
