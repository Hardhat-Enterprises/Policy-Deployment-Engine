## 🛡️ Policy Deployment Engine: `apphub_service_project_attachment`

This section provides a concise policy evaluation for the `apphub_service_project_attachment` resource in GCP.

Reference: [Terraform Registry – apphub_service_project_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apphub_service_project_attachment)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_project_attachment_id` | Required. The service project attachment identifier must contain the project_id of the service project specified in the service_project_attachment.service_project field. Hint: "projects/{project_id}" | true | true | This identifier ties the attachment to the intended service project. If it is missing or empty, the attachment can’t be reliably validated or enforced, and the configuration becomes ambiguous. | projects/my-service-project | null, "", [] |
| `service_project` | "Immutable. Service project name in the format: \"projects/abc\" or \"projects/123\". As input, project name with either project id or number are accepted. As output, this field will contain project number." | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
