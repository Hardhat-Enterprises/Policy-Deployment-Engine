## 🛡️ Policy Deployment Engine: `resource_manager_lien`

This section provides a concise policy evaluation for the `resource_manager_lien` resource in GCP.

Reference: [Terraform Registry – resource_manager_lien](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/resource_manager_lien)

---

## 1. Argument Reference

### `reason`
- Description: (Required) Concise user-visible strings indicating why an action cannot be performed on a resource. Maximum length of 200 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `origin`
- Description: (Required) A stable, user-visible/meaningful string identifying the origin of the Lien, intended to be inspected programmatically. Maximum length of 200 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) A reference to the resource this Lien is attached to. The server will validate the parent against those for which Liens are supported. Since a variety of objects can have Liens against them, you must provide the type prefix (e.g. "projects/my-project-name").
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `restrictions`
- Description: (Required) The types of operations which should be blocked as a result of this Lien. Each value should correspond to an IAM permission. The server will validate the permissions against those for which Liens are supported.  An empty list is meaningless and will be rejected. e.g. ['resourcemanager.projects.delete']
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
