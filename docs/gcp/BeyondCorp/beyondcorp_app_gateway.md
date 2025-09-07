## 🛡️ Policy Deployment Engine: `beyondcorp_app_gateway`

This section provides a concise policy evaluation for the `beyondcorp_app_gateway` resource in GCP.

Reference: [Terraform Registry – beyondcorp_app_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_app_gateway)

---

## 1. Argument Reference

### `name`
- Description: (Required) ID of the AppGateway.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the AppGateway.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The type of network connectivity used by the AppGateway. Default value is `TYPE_UNSPECIFIED`. Possible values are: `TYPE_UNSPECIFIED`, `TCP_PROXY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_type`
- Description: (Optional) The type of hosting used by the AppGateway. Default value is `HOST_TYPE_UNSPECIFIED`. Possible values are: `HOST_TYPE_UNSPECIFIED`, `GCP_REGIONAL_MIG`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) An arbitrary user-provided name for the AppGateway.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
