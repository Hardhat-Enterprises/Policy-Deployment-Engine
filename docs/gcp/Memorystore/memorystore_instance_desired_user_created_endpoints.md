## 🛡️ Policy Deployment Engine: `memorystore_instance_desired_user_created_endpoints`

This section provides a concise policy evaluation for the `memorystore_instance_desired_user_created_endpoints` resource in GCP.

Reference: [Terraform Registry – memorystore_instance_desired_user_created_endpoints](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/memorystore_instance_desired_user_created_endpoints)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of the Memorystore instance these endpoints should be added to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Required) The name of the region of the Memorystore instance these endpoints should be added to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `desired_user_created_endpoints`
- Description: (Optional) A list of desired user endpoints Structure is [documented below](#nested_desired_user_created_endpoints).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_desired_user_created_endpoints"></a>The `desired_user_created_endpoints` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connections`
- Description: (Optional) Structure is [documented below](#nested_desired_user_created_endpoints_desired_user_created_endpoints_connections). <a name="nested_desired_user_created_endpoints_desired_user_created_endpoints_connections"></a>The `connections` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_connection`
- Description: (Optional) Detailed information of a PSC connection that is created by the customer who owns the cluster. Structure is [documented below](#nested_desired_user_created_endpoints_desired_user_created_endpoints_connections_connections_psc_connection). <a name="nested_desired_user_created_endpoints_desired_user_created_endpoints_connections_connections_psc_connection"></a>The `psc_connection` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_connection_id`
- Description: (Required) The PSC connection id of the forwarding rule connected to the service attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Required) The IP allocated on the consumer network for the PSC forwarding rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `forwarding_rule`
- Description: (Required) The URI of the consumer side forwarding rule. Format: projects/{project}/regions/{region}/forwardingRules/{forwarding_rule}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) The consumer project_id where the forwarding rule is created from.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) The consumer network where the IP address resides, in the form of projects/{project_id}/global/networks/{network_id}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_attachment`
- Description: (Required) The service attachment which is the target of the PSC connection, in the form of projects/{project-id}/regions/{region}/serviceAttachments/{service-attachment-id}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_connection_status`
- Description: (Output) Output Only. The status of the PSC connection: whether a connection exists and ACTIVE or it no longer exists. Possible values: ACTIVE NOT_FOUND
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_type`
- Description: (Output) Output Only. Type of a PSC Connection. Possible values: CONNECTION_TYPE_DISCOVERY CONNECTION_TYPE_PRIMARY CONNECTION_TYPE_READER
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
