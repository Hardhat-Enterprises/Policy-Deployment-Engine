## 🛡️ Policy Deployment Engine: `beyondcorp_app_connection`

This section provides a concise policy evaluation for the `beyondcorp_app_connection` resource in GCP.

Reference: [Terraform Registry – beyondcorp_app_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_app_connection)

---

## 1. Argument Reference

### `name`
- Description: (Required) ID of the AppConnection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `application_endpoint`
- Description: (Required) Address of the remote application endpoint for the BeyondCorp AppConnection. Structure is [documented below](#nested_application_endpoint).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the AppConnection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) An arbitrary user-provided name for the AppConnection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The type of network connectivity used by the AppConnection. Refer to https://cloud.google.com/beyondcorp/docs/reference/rest/v1/projects.locations.appConnections#type for a list of possible values.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connectors`
- Description: (Optional) List of AppConnectors that are authorised to be associated with this AppConnection
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gateway`
- Description: (Optional) Gateway used by the AppConnection. Structure is [documented below](#nested_gateway).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_application_endpoint"></a>The `application_endpoint` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Required) Hostname or IP address of the remote application endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Required) Port of the remote application endpoint. <a name="nested_gateway"></a>The `gateway` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_gateway`
- Description: (Required) AppGateway name in following format: projects/{project_id}/locations/{locationId}/appgateways/{gateway_id}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The type of hosting used by the gateway. Refer to https://cloud.google.com/beyondcorp/docs/reference/rest/v1/projects.locations.appConnections#Type_1 for a list of possible values.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Output) Server-defined URI for this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingress_port`
- Description: (Output) Ingress port reserved on the gateways for this AppConnection, if not specified or zero, the default port is 19443.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
