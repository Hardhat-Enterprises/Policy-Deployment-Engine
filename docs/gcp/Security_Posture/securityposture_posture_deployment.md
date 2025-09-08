## 🛡️ Policy Deployment Engine: `securityposture_posture_deployment`

This section provides a concise policy evaluation for the `securityposture_posture_deployment` resource in GCP.

Reference: [Terraform Registry – securityposture_posture_deployment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/securityposture_posture_deployment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target_resource` | The resource on which the posture should be deployed. This can be in one of the following formats: projects/{project_number}, folders/{folder_number}, organizations/{organization_id} | true | None | None |
| `posture_id` | Relative name of the posture which needs to be deployed. It should be in the format: organizations/{organization_id}/locations/{location}/postures/{posture_id} | true | None | None |
| `posture_revision_id` | Revision_id the posture which needs to be deployed. | true | None | None |
| `parent` | The parent of the resource, an organization. Format should be `organizations/{organization_id}`. | true | None | None |
| `location` | The location of the resource, eg. global`. | true | None | None |
| `posture_deployment_id` | ID of the posture deployment. | true | None | None |
| `description` | Description of the posture deployment. | false | None | None |
