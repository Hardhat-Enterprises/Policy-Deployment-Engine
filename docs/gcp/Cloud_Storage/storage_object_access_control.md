## 🛡️ Policy Deployment Engine: `storage_object_access_control`

This section provides a concise policy evaluation for the `storage_object_access_control` resource in GCP.

Reference: [Terraform Registry – storage_object_access_control](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_object_access_control)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | The name of the bucket. | true | false | None | None | None |
| `entity` | The entity holding the permission, in one of the following forms: * user-{{userId}} * user-{{email}} (such as "user-liz@example.com") * group-{{groupId}} * group-{{email}} (such as "group-example@googlegroups.com") * domain-{{domain}} (such as "domain-example.com") * project-team-{{projectId}} * allUsers * allAuthenticatedUsers | true | true | Entities should not have overly broad public access | user-liz@example.com | allUsers |
| `object` | The name of the object to apply the access control to. | true | false | None | None | None |
| `role` | The access permission for the entity. Possible values are: `OWNER`, `READER`. | true | false | None | None | None |
