## 🛡️ Policy Deployment Engine: `google_monitoring_service`

This section provides a concise policy evaluation for the `google_monitoring_service` resource in GCP.

Reference: [Terraform Registry – google_monitoring_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_service)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_id` | An optional service ID to use. If not given, the server will generate one. | true | false | Identifier field with no security impact. | None | None |
| `display_name` | Name used for UI elements listing this service. | false | false | Display metadata with no security impact. | None | None |
| `user_labels` | Labels used to annotate the service. | false | false | Organisational metadata with no security impact. | None | None |
| `project` | The project in which the service resides. | false | false | Organisational field, not a security control. | None | None |

### basic_service Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_type` | The type of service (e.g. APP_ENGINE). | false | false | Service type selector with no direct security impact. | None | None |
| `service_labels` | Labels specifying the resource that emits monitoring data. | false | false | Functional identifiers with no security impact. | None | None |

---

## Policies Written

None. This resource defines a logical monitoring service entry used as a parent for SLOs. It contains no attributes related to access control, encryption, authentication, or network exposure.

## Policies Considered but Not Written

| Attribute | Reason |
|-----------|--------|
| `service_type` | Service type is a functional classification with no security implications |
| `user_labels` | Organisational metadata only |
