## 🛡️ Policy Deployment Engine: `storage_bucket_access_control`

This section provides a concise policy evaluation for the `storage_bucket_access_control` resource in GCP.

Reference: [Terraform Registry – storage_bucket_access_control](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_access_control)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | The name of the bucket. | true | false | Naming bucket is not related to security | None | None |
| `entity` | The entity holding the permission, in one of the following forms: user-userId user-email group-groupId group-email domain-domain project-team-projectId allUsers allAuthenticatedUsers Examples: The user liz@example.com would be user-liz@example.com. The group example@googlegroups.com would be group-example@googlegroups.com. To refer to all members of the Google Apps for Business domain example.com, the entity would be domain-example.com. | true | true | The entity should be restricted to valid and allowed users/group/domain only | group-example@googlegroups.com | allUsers |
| `role` | The access permission for the entity. Possible values are: `OWNER`, `READER`, `WRITER`. | false | false | Entity handles the restriction itself so we dont have to worry about role | None | None |
