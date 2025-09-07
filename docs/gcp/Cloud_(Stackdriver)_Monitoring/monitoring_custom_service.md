## 🛡️ Policy Deployment Engine: `monitoring_custom_service`

This section provides a concise policy evaluation for the `monitoring_custom_service` resource in GCP.

Reference: [Terraform Registry – monitoring_custom_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_custom_service)

---

## 1. Argument Reference

### `display_name`
- Description: (Optional) Name used for UI elements listing this Service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_labels`
- Description: (Optional) Labels which have been used to annotate the service. Label keys must start with a letter. Label keys and values may contain lowercase letters, numbers, underscores, and dashes. Label keys and values have a maximum length of 63 characters, and must be less than 128 bytes in size. Up to 64 label entries may be stored. For labels which do not have a semantic value, the empty string may be supplied for the label value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `telemetry`
- Description: (Optional) Configuration for how to query telemetry on a Service. Structure is [documented below](#nested_telemetry).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_id`
- Description: (Optional) An optional service ID to use. If not given, the server will generate a service ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_telemetry"></a>The `telemetry` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_name`
- Description: (Optional) The full name of the resource that defines this service. Formatted as described in https://cloud.google.com/apis/design/resource_names.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
