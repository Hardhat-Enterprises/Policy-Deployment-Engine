## 🛡️ Policy Deployment Engine: `dialogflow_fulfillment`

This section provides a concise policy evaluation for the `dialogflow_fulfillment` resource in GCP.

Reference: [Terraform Registry – dialogflow_fulfillment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_fulfillment)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The human-readable name of the fulfillment, unique within the agent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Whether fulfillment is enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `features`
- Description: (Optional) The field defines whether the fulfillment is enabled for certain features. Structure is [documented below](#nested_features).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generic_web_service`
- Description: (Optional) Represents configuration for a generic web service. Dialogflow supports two mechanisms for authentications: - Basic authentication with username and password. - Authentication with additional authentication headers. Structure is [documented below](#nested_generic_web_service).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_features"></a>The `features` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) The type of the feature that enabled for fulfillment. * SMALLTALK: Fulfillment is enabled for SmallTalk. Possible values are: `SMALLTALK`. <a name="nested_generic_web_service"></a>The `generic_web_service` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) The fulfillment URI for receiving POST requests. It must use https protocol.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Optional) The user name for HTTP Basic authentication.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) The password for HTTP Basic authentication.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers`
- Description: (Optional) The HTTP request headers to send together with fulfillment requests.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
