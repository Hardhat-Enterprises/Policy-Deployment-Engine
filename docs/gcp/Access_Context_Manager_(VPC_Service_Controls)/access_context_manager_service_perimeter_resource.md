## 🛡️ Policy Deployment Engine: `access_context_manager_service_perimeter_resource`

This section provides a concise policy evaluation for the `access_context_manager_service_perimeter_resource` resource in GCP.

Reference: [Terraform Registry – access_context_manager_service_perimeter_resource](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_service_perimeter_resource)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource` | A GCP resource that is inside of the service perimeter. Currently only projects are allowed. Format: projects/{project_number} | true | None | None |
| `perimeter_name` | The name of the Service Perimeter to add this resource to. | true | None | None |
