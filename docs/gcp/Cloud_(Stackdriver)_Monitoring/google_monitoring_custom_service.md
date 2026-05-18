## 🛡️ Policy Deployment Engine: `google_monitoring_custom_service`

This section provides a concise policy evaluation for the `google_monitoring_custom_service` resource in GCP.

Reference: [Terraform Registry – google_monitoring_custom_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_custom_service)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Name used for UI elements listing this service. | false | false | Display metadata with no security impact. | None | None |
| `user_labels` | Labels used to annotate the service. | false | false | Organisational metadata with no security impact. | None | None |
| `service_id` | An optional service ID. If not given, the server will generate one. | false | false | Identifier field with no security impact. | None | None |
| `project` | The project in which the service resides. | false | false | Organisational field, not a security control. | None | None |

### telemetry Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_name` | The full name of the resource that defines this service. | false | false | A resource reference identifier with no direct security impact. | None | None |

---

## Policies Written

None. This resource defines a custom monitoring service used as a parent for SLOs. It contains no attributes related to access control, encryption, authentication, or network exposure.

## Policies Considered but Not Written

| Attribute | Reason |
|-----------|--------|
| `telemetry.resource_name` | A resource identifier pointing to the telemetry source; not a security control |
| `user_labels` | Organisational metadata only |
