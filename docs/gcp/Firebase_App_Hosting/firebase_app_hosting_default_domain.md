## 🛡️ Policy Deployment Engine: `firebase_app_hosting_default_domain`

This section provides a concise policy evaluation for the `firebase_app_hosting_default_domain` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_default_domain](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_default_domain)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location of the Backend that this Domain is associated with
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend`
- Description: (Required) The ID of the Backend that this Domain is associated with
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain_id`
- Description: (Required) Id of the domain. For default domain, it should be {{backend}}--{{project_id}}.{{location}}.hosted.app
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Whether the domain is disabled. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
