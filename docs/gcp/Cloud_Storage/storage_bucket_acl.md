## 🛡️ Policy Deployment Engine: `storage_bucket_acl`

This section provides a concise policy evaluation for the `storage_bucket_acl` resource in GCP.

Reference: [Terraform Registry – storage_bucket_acl](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_acl)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | The name of the bucket. | true | false | Naming of bucket is not security related | None | None |
| `predefined_acl` | The canned GCS ACL to apply. Must be set if role_entity is not. | false | true | By applying a predefined ACL to an existing bucket or object, you completely replace the existing bucket or object ACL with the predefined ACL. This change might cause you to lose access to the bucket | null | publicRead |
| `role_entity` | List of role/entity pairs in the form ROLE:entity | false | true | Role/entity should be restricted to allowed users/domain/group/projects | project-team-projectId | READER:allUsers |
| `default_acl` | Configure this ACL to be the default ACL | false | true | role_entity is preferred to manage access instead because it gives fine-grained access controls | null | publicReadWrite |
