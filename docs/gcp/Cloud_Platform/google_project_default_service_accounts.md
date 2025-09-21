## 🛡️ Policy Deployment Engine: `google_project_default_service_accounts`

This section provides a concise policy evaluation for the `google_project_default_service_accounts` resource in GCP.

Reference: [Terraform Registry – google_project_default_service_accounts](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_default_service_accounts)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | The project ID where service accounts are created. | true | false | Identifier only and does not affect security directly | None | None |
| `action` | The action to be performed in the default service accounts. Valid values are: DEPRIVILEGE, DELETE, DISABLE. Note that DEPRIVILEGE action will ignore the REVERT configuration in the restore_policy | true | true | DELETE permanently removes default service accounts and may disrupt Google Cloud services.  Instead, DEPRIVILEGE reduces permissions, which is safer | action = "DEPRIVILEGE" | action = "DELETE" |
| `restore_policy` | Action to perform on destroy. Valid values are NONE, REVERT, REVERT_AND_IGNORE_FAILURE | false | true | Using REVERT_AND_IGNORE_FAILURE prevents error handling and can hide failed restores.  REVERT or NONE are safer choices | restore_policy = "REVERT" | restore_policy = "REVERT_AND_IGNORE_FAILURE" |
