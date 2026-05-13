## 🛡️ Policy Deployment Engine: `monitoring_service`

This section provides a concise policy evaluation for the `monitoring_service` resource in GCP.

Reference: [Terraform Registry – monitoring_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_service)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_id` | An optional service ID to use. If not given, the server will generate a service ID. | true | false | Identifier field with no security impact. | None | None |
| `display_name` | Name used for UI elements listing this Service. | false | false | Display metadata with no security impact. | None | None |
| `user_labels` | Labels which have been used to annotate the service. Label keys must start with a letter. Label keys and values may contain lowercase letters, numbers, underscores, and dashes. Label keys and values have a maximum length of 63 characters, and must be less than 128 bytes in size. Up to 64 label entries may be stored. For labels which do not have a semantic value, the empty string may be supplied for the label value. | false | false | Organisational metadata with no security impact. | None | None |
| `basic_service` | A well-known service type, defined by its service type and service labels. Valid values of service types and services labels are described at https://cloud.google.com/stackdriver/docs/solutions/slo-monitoring/api/api-structures#basic-svc-w-basic-sli Structure is [documented below](#nested_basic_service). | false | false | Functional configuration setting with no direct security impact. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Organisational field, not a security control. | None | None |

### basic_service Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_type` | The type of service that this basic service defines, e.g. APP_ENGINE service type | false | false | Service type selector with no direct security impact. | None | None |
| `service_labels` | Labels that specify the resource that emits the monitoring data which is used for SLO reporting of this `Service`. | false | false | Functional identifiers with no security impact. | None | None |
