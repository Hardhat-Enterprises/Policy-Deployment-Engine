## 🛡️ Policy Deployment Engine: `securityposture_posture_deployment`

This section provides a concise policy evaluation for the `securityposture_posture_deployment` resource in GCP.

Reference: [Terraform Registry – securityposture_posture_deployment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/securityposture_posture_deployment)

---

## 1. Argument Reference

### `target_resource`
- Description: (Required) The resource on which the posture should be deployed. This can be in one of the following formats: projects/{project_number}, folders/{folder_number}, organizations/{organization_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `posture_id`
- Description: (Required) Relative name of the posture which needs to be deployed. It should be in the format: organizations/{organization_id}/locations/{location}/postures/{posture_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `posture_revision_id`
- Description: (Required) Revision_id the posture which needs to be deployed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The parent of the resource, an organization. Format should be `organizations/{organization_id}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the resource, eg. global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `posture_deployment_id`
- Description: (Required) ID of the posture deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the posture deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
