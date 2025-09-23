## 🛡️ Policy Deployment Engine: `scc_source_iam_binding`

This section provides a concise policy evaluation for the `scc_source_iam_binding` resource in GCP.

Reference: [Terraform Registry – scc_source_iam_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_source_iam_binding)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source` |  | false | false | None | None | None |
| `members` | Identities that will be bound to the role. Supported formats include: allUsers, allAuthenticatedUsers, user:{emailid}, serviceAccount:{emailid}, group:{emailid}, domain:{domain}, projectOwner:{projectid}, projectEditor:{projectid}, projectViewer:{projectid}. | true | false | IAM bindings should be restricted to specific, trusted principals to avoid privilege escalation or data exposure. | Members list contains only approved principals (e.g., specific users, groups, or service accounts). | Members list includes public identities (e.g., allUsers, allAuthenticatedUsers) or unapproved principals. |
| `role` | The role assigned to members. Example: roles/viewer, roles/editor, roles/admin. Custom roles must follow the format [projects|organizations]/{parent-name}/roles/{role-name}. | true | false | Restrict roles to the minimum required for SCC operations, following the principle of least privilege. | Role is set to approved values such as Viewer, Editor, or Admin as per organizational policy. | Role is set to Owner or other disallowed roles, granting excessive privileges. |
| `policy_data` | A `google_iam_policy` data source. | false | false | None | None | None |
