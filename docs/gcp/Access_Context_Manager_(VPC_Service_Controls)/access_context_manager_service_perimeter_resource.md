## 🛡️ Policy Deployment Engine: `access_context_manager_service_perimeter_resource`

This section provides a concise policy evaluation for the `access_context_manager_service_perimeter_resource` resource in GCP.

Reference: [Terraform Registry – access_context_manager_service_perimeter_resource](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_service_perimeter_resource)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource` | A GCP resource that is inside of the service perimeter. Currently only projects are allowed. Format: projects/{project_number} | true | true | Prevents data exfiltration by whitelisting specific project attachments. | ['projects/123456789'] | ['projects/999999999'] |
| `perimeter_name` | The name of the Service Perimeter to add this resource to. | true | true | Ensures resources are attached only to authorized security boundaries. | ['accessPolicies/123456/servicePerimeters/my_perimeter'] | ['accessPolicies/123456/servicePerimeters/WRONG_PERIMETER'] |
