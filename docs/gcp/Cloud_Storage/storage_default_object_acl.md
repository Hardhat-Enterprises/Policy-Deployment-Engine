## 🛡️ Policy Deployment Engine: `storage_default_object_acl`

This section provides a concise policy evaluation for the `storage_default_object_acl` resource in GCP.

Reference: [Terraform Registry – storage_default_object_acl](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_default_object_acl)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` | --- | none | None | None |
| `role_entity` | See [GCS Object ACL documentation](https://cloud.google.com/storage/docs/json_api/v1/objectAccessControls) for more details. Omitting the field is the same as providing an empty list. | none | None | None |
