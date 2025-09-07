## 🛡️ Policy Deployment Engine: `compute_service_attachment`

This section provides a concise policy evaluation for the `compute_service_attachment` resource in GCP.

Reference: [Terraform Registry – compute_service_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_service_attachment)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_preference`
- Description: (Required) The connection preference to use for this service attachment. Valid values include "ACCEPT_AUTOMATIC", "ACCEPT_MANUAL".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_service`
- Description: (Required) The URL of a service serving the endpoint identified by this service attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nat_subnets`
- Description: (Required) An array of subnets that is provided for NAT in this service attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_proxy_protocol`
- Description: (Required) If true, enable the proxy protocol which is for supplying client TCP/IP address data in TCP connections that traverse proxies on their way to destination servers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain_names`
- Description: (Optional) If specified, the domain name will be used during the integration between the PSC connected endpoints and the Cloud DNS. For example, this is a valid domain name: "p.mycompany.com.". Current max number of domain names supported is 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consumer_reject_lists`
- Description: (Optional) An array of projects that are not allowed to connect to this service attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consumer_accept_lists`
- Description: (Optional) An array of projects that are allowed to connect to this service attachment. Structure is [documented below](#nested_consumer_accept_lists).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reconcile_connections`
- Description: (Optional) This flag determines whether a consumer accept/reject list change can reconcile the statuses of existing ACCEPTED or REJECTED PSC endpoints. If false, connection policy update will only affect existing PENDING PSC endpoints. Existing ACCEPTED/REJECTED endpoints will remain untouched regardless how the connection policy is modified . If true, update will affect both PENDING and ACCEPTED/REJECTED PSC endpoints. For example, an ACCEPTED PSC endpoint will be moved to REJECTED if its project is added to the reject list.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `propagated_connection_limit`
- Description: (Optional) The number of consumer spokes that connected Private Service Connect endpoints can be propagated to through Network Connectivity Center. This limit lets the service producer limit how many propagated Private Service Connect connections can be established to this service attachment from a single consumer. If the connection preference of the service attachment is ACCEPT_MANUAL, the limit applies to each project or network that is listed in the consumer accept list. If the connection preference of the service attachment is ACCEPT_AUTOMATIC, the limit applies to each project that contains a connected endpoint. If unspecified, the default propagated connection limit is 250. To explicitly send a zero value, set `send_propagated_connection_limit_if_zero = true`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) URL of the region where the resource resides.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `send_propagated_connection_limit_if_zero`
- Description: When false, setting propagated_connection_limit to zero causes the provider to use to the API's default value. When true, the provider will set propagated_connection_limit to zero. Defaults to false. <a name="nested_consumer_accept_lists"></a>The `consumer_accept_lists` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id_or_num`
- Description: (Optional) A project that is allowed to connect to this service attachment. Only one of project_id_or_num and network_url may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_url`
- Description: (Optional) The network that is allowed to connect to this service attachment. Only one of project_id_or_num and network_url may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_limit`
- Description: (Required) The number of consumer forwarding rules the consumer project can create.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
