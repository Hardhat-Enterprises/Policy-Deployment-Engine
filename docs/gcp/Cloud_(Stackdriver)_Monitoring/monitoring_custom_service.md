## 🛡️ Policy Deployment Engine: `monitoring_custom_service`

This section provides a concise policy evaluation for the `monitoring_custom_service` resource in GCP.

Reference: [Terraform Registry – monitoring_custom_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_custom_service)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Name used for UI elements listing this Service. | false | false | Display metadata with no security impact. | None | None |
| `user_labels` | Labels which have been used to annotate the service. Label keys must start with a letter. Label keys and values may contain lowercase letters, numbers, underscores, and dashes. Label keys and values have a maximum length of 63 characters, and must be less than 128 bytes in size. Up to 64 label entries may be stored. For labels which do not have a semantic value, the empty string may be supplied for the label value. | false | false | Organisational metadata with no security impact. | None | None |
| `telemetry` | Configuration for how to query telemetry on a Service. Structure is [documented below](#nested_telemetry). | false | false | Functional configuration setting with no direct security impact. | None | None |
| `service_id` | An optional service ID to use. If not given, the server will generate a service ID. | false | false | Identifier field with no security impact. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Organisational field, not a security control. | None | None |

### telemetry Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_name` | The full name of the resource that defines this service. Formatted as described in https://cloud.google.com/apis/design/resource_names. | false | false | A resource reference identifier with no direct security impact. | None | None |
