## 🛡️ Policy Deployment Engine: `storage_default_object_access_control`

This section provides a concise policy evaluation for the `storage_default_object_access_control` resource in GCP.

Reference: [Terraform Registry – storage_default_object_access_control](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_default_object_access_control)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | The name of the bucket. | true | false | None | None | None |
| `entity` | The entity holding the permission, in one of the following forms: * user-{{userId}} * user-{{email}} (such as "user-liz@example.com") * group-{{groupId}} * group-{{email}} (such as "group-example@googlegroups.com") * domain-{{domain}} (such as "domain-example.com") * project-team-{{projectId}} * allUsers * allAuthenticatedUsers | true | true | Objects should not be exposed to public as they may contain sensitive data | domain-example.com | allUsers |
| `role` | The access permission for the entity. Possible values are: `OWNER`, `READER`. | true | false | None | None | None |
| `object` | The name of the object, if applied to an object. | false | false | None | None | None |
