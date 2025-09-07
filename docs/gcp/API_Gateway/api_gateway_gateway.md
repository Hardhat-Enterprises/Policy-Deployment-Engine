## 🛡️ Policy Deployment Engine: `api_gateway_gateway`

This section provides a concise policy evaluation for the `api_gateway_gateway` resource in GCP.

Reference: [Terraform Registry – api_gateway_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/api_gateway_gateway)

---

## 1. Argument Reference

### `api_config`
- Description: (Required) Resource name of the API Config for this Gateway. Format: projects/{project}/locations/global/apis/{api}/configs/{apiConfig}. When changing api configs please ensure the new config is a new resource and the [lifecycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle) rule `create_before_destroy` is set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gateway_id`
- Description: (Required) Identifier to assign to the Gateway. Must be unique within scope of the parent resource(project).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) A user-visible name for the API.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the gateway for the API.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
