## 🛡️ Policy Deployment Engine: `eventarc_google_api_source`

This section provides a concise policy evaluation for the `eventarc_google_api_source` resource in GCP.

Reference: [Terraform Registry – eventarc_google_api_source](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/eventarc_google_api_source)

---

## 1. Argument Reference

### `destination`
- Description: (Required) Destination is the message bus that the GoogleApiSource is delivering to. It must be point to the full resource name of a MessageBus. Format: "projects/{PROJECT_ID}/locations/{region}/messagesBuses/{MESSAGE_BUS_ID)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `google_api_source_id`
- Description: (Required) The user-provided ID to be assigned to the GoogleApiSource. It should match the format `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `crypto_key_name`
- Description: (Optional) Resource name of a KMS crypto key (managed by the user) used to encrypt/decrypt their event data. It must match the pattern `projects/*/locations/*/keyRings/*/cryptoKeys/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Resource annotations. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Resource display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: (Optional) The configuration for Platform Telemetry logging for Eventarc Advanced resources. Structure is [documented below](#nested_logging_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_logging_config"></a>The `logging_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_severity`
- Description: (Optional) The minimum severity of logs that will be sent to Stackdriver/Platform Telemetry. Logs at severitiy ≥ this value will be sent, unless it is NONE. Possible values are: `NONE`, `DEBUG`, `INFO`, `NOTICE`, `WARNING`, `ERROR`, `CRITICAL`, `ALERT`, `EMERGENCY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
