## 🛡️ Policy Deployment Engine: `access_context_manager_access_policy`

This section provides a concise policy evaluation for the `access_context_manager_access_policy` resource in GCP.

Reference: [Terraform Registry – access_context_manager_access_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_access_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `parent` | The parent of this AccessPolicy in the Cloud Resource Hierarchy. Format: 'organizations/{{organization_id}}' | true | false | None | None | None |
| `title` | Human readable title. Does not affect behavior. | true | false | None | None | None |
| `scopes` | Folder or project on which this policy is applicable. Format: 'folders/{{folder_id}}' or 'projects/{{project_number}}' | false | false | None | None | None |
