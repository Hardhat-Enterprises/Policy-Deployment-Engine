## 🛡️ Policy Deployment Engine: `storage_default_object_access_control`

This section provides a concise policy evaluation for the `storage_default_object_access_control` resource in GCP.

Reference: [Terraform Registry – storage_default_object_access_control](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_default_object_access_control)

---

## 1. Argument Reference

### `bucket`
- Description: (Required) The name of the bucket.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entity`
- Description: (Required) The entity holding the permission, in one of the following forms: * user-{{userId}} * user-{{email}} (such as "user-liz@example.com") * group-{{groupId}} * group-{{email}} (such as "group-example@googlegroups.com") * domain-{{domain}} (such as "domain-example.com") * project-team-{{projectId}} * allUsers * allAuthenticatedUsers
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: (Required) The access permission for the entity. Possible values are: `OWNER`, `READER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: (Optional) The name of the object, if applied to an object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
