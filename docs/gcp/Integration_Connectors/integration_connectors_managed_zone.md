## 🛡️ Policy Deployment Engine: `integration_connectors_managed_zone`

This section provides a concise policy evaluation for the `integration_connectors_managed_zone` resource in GCP.

Reference: [Terraform Registry – integration_connectors_managed_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integration_connectors_managed_zone)

---

## 1. Argument Reference

### `dns`
- Description: (Required) DNS Name of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_project`
- Description: (Required) The name of the Target Project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_vpc`
- Description: (Required) The name of the Target Project VPC Network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of Managed Zone needs to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the resource.
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
