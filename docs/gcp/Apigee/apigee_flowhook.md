## 🛡️ Policy Deployment Engine: `apigee_flowhook`

This section provides a concise policy evaluation for the `apigee_flowhook` resource in GCP.

Reference: [Terraform Registry – apigee_flowhook](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_flowhook)

---

## 1. Argument Reference

### `org_id`
- Description: (Required) The Apigee Organization associated with the environment
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environment`
- Description: (Required) The resource ID of the environment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `flow_hook_point`
- Description: (Required) Where in the API call flow the flow hook is invoked. Must be one of PreProxyFlowHook, PostProxyFlowHook, PreTargetFlowHook, or PostTargetFlowHook.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the flow hook.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sharedflow`
- Description: (Required) Id of the Sharedflow attaching to a flowhook point.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `continue_on_error`
- Description: (Optional) Flag that specifies whether execution should continue if the flow hook throws an exception. Set to true to continue execution. Set to false to stop execution if the flow hook throws an exception. Defaults to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
