## 🛡️ Policy Deployment Engine: `firebaserules_release`

This section provides a concise policy evaluation for the `firebaserules_release` resource in GCP.

Reference: [Terraform Registry – firebaserules_release](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebaserules_release)

---

## 1. Argument Reference

### `name`
- Description: (Required) Format: `projects/{project_id}/releases/{release_id}`\Firestore Rules Releases will **always** have the name 'cloud.firestore'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ruleset_name`
- Description: (Required) Name of the `Ruleset` referred to by this `Release`. The `Ruleset` must exist for the `Release` to be created. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
