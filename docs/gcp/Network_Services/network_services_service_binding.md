## 🛡️ Policy Deployment Engine: `network_services_service_binding`

This section provides a concise policy evaluation for the `network_services_service_binding` resource in GCP.

Reference: [Terraform Registry – network_services_service_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_service_binding)

---

## 1. Argument Reference

### `service`
- Description: (Required) The full Service Directory Service name of the format projects/*/locations/*/namespaces/*/services/*
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the ServiceBinding resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the ServiceBinding resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A free-text description of the resource. Max length 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
