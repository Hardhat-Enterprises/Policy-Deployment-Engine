## 🛡️ Policy Deployment Engine: `firebase_project`

This section provides a concise policy evaluation for the `firebase_project` resource in GCP.

Reference: [Terraform Registry – firebase_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_project)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | If it is not provided, the provider project is used. | false | false | The 'project' attribute is used to associate the Firebase resource with a specific Google Cloud project. It does not directly affect security or data protection since access and permissions are controlled through project-level IAM policies rather than this field itself. | None | None |
