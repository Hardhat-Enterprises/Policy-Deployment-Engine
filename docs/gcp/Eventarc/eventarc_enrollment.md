## 🛡️ Policy Deployment Engine: `eventarc_enrollment`

This section provides a concise policy evaluation for the `eventarc_enrollment` resource in GCP.

Reference: [Terraform Registry – eventarc_enrollment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/eventarc_enrollment)

---

## 1. Argument Reference

### `message_bus`
- Description: (Required) Resource name of the message bus identifying the source of the messages. It matches the form projects/{project}/locations/{location}/messageBuses/{messageBus}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cel_match`
- Description: (Required) A CEL expression identifying which messages this enrollment applies to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination`
- Description: (Required) Destination is the Pipeline that the Enrollment is delivering to. It must point to the full resource name of a Pipeline. Format: "projects/{PROJECT_ID}/locations/{region}/pipelines/{PIPELINE_ID)"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enrollment_id`
- Description: (Required) The user-provided ID to be assigned to the Enrollment. It should match the format `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Resource display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Resource annotations. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
