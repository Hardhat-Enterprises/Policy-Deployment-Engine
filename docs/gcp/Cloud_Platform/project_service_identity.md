## 🛡️ Policy Deployment Engine: `project_service_identity`

This section provides a concise policy evaluation for the `project_service_identity` resource in GCP.

Reference: [Terraform Registry – project_service_identity](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service_identity)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service` | The service to generate identity for. - - - | true | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
