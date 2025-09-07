## 🛡️ Policy Deployment Engine: `integration_connectors_endpoint_attachment`

This section provides a concise policy evaluation for the `integration_connectors_endpoint_attachment` resource in GCP.

Reference: [Terraform Registry – integration_connectors_endpoint_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integration_connectors_endpoint_attachment)

---

## 1. Argument Reference

### `service_attachment`
- Description: (Required) The path of the service attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Location in which Endpoint Attachment needs to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of Endpoint Attachment needs to be created.
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

### `endpoint_global_access`
- Description: (Optional) Enable global access for endpoint attachment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
