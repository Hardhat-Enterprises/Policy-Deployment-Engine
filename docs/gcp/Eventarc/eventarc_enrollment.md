## 🛡️ Policy Deployment Engine: `eventarc_enrollment`

This section provides a concise policy evaluation for the `eventarc_enrollment` resource in GCP.

Reference: [Terraform Registry – eventarc_enrollment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/eventarc_enrollment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `message_bus` | Resource name of the message bus identifying the source of the messages. It matches the form projects/{project}/locations/{location}/messageBuses/{messageBus}. | true | None | None |
| `cel_match` | A CEL expression identifying which messages this enrollment applies to. | true | None | None |
| `destination` | Destination is the Pipeline that the Enrollment is delivering to. It must point to the full resource name of a Pipeline. Format: "projects/{PROJECT_ID}/locations/{region}/pipelines/{PIPELINE_ID)" | true | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | None | None |
| `enrollment_id` | The user-provided ID to be assigned to the Enrollment. It should match the format `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`. | true | None | None |
| `display_name` | Resource display name. | false | None | None |
| `labels` | Resource labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `annotations` | Resource annotations. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
