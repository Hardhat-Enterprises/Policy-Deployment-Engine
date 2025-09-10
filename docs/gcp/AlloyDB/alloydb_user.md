## 🛡️ Policy Deployment Engine: `alloydb_user`

This section provides a concise policy evaluation for the `alloydb_user` resource in GCP.

Reference: [Terraform Registry – alloydb_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_user)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster` | Identifies the alloydb cluster. Must be in the format 'projects/{project}/locations/{location}/clusters/{cluster_id}' | true | none | None | None | None |
| `user_id` | The database role name of the user. | true | none | None | None | None |
| `user_type` | The type of this user. Possible values are: `ALLOYDB_BUILT_IN`, `ALLOYDB_IAM_USER`. | true | none | None | None | None |
| `password` | Password for this database user. **Note**: This property is sensitive and will not be displayed in the plan. | false | none | None | None | None |
| `database_roles` | List of database roles this database user has. | false | none | None | None | None |
