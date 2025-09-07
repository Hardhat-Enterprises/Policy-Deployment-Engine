## 🛡️ Policy Deployment Engine: `eventarc_message_bus`

This section provides a concise policy evaluation for the `eventarc_message_bus` resource in GCP.

Reference: [Terraform Registry – eventarc_message_bus](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/eventarc_message_bus)

---

## 1. Argument Reference

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `message_bus_id`
- Description: (Required) Required. The user-provided ID to be assigned to the MessageBus. It should match the format `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: (Optional) The configuration for Platform Telemetry logging for Eventarc Advanced resources. Structure is [documented below](#nested_logging_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Resource labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Optional. Resource annotations. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Optional. Resource display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `crypto_key_name`
- Description: (Optional) Optional. Resource name of a KMS crypto key (managed by the user) used to encrypt/decrypt their event data. It must match the pattern `projects/*/locations/*/keyRings/*/cryptoKeys/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_logging_config"></a>The `logging_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_severity`
- Description: (Optional) Optional. The minimum severity of logs that will be sent to Stackdriver/Platform Telemetry. Logs at severitiy ≥ this value will be sent, unless it is NONE. Possible values are: `NONE`, `DEBUG`, `INFO`, `NOTICE`, `WARNING`, `ERROR`, `CRITICAL`, `ALERT`, `EMERGENCY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
