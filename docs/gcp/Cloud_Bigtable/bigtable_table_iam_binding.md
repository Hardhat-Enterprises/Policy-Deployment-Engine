## 🛡️ Policy Deployment Engine: `bigtable_table_iam_binding`

This section provides a concise policy evaluation for the `bigtable_table_iam_binding` resource in GCP.

Reference: [Terraform Registry – bigtable_table_iam_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_table_iam_binding)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | The project in which the table belongs. If it is not provided, Terraform uses the provider default. | false | false | Non-secret project id for the Terraform resource; access is still determined by `members` and `role`, not by repeating the project id here. | None | None |
| `instance_name` | The name or relative resource id of the instance that owns the table. | true | false | Selects the instance; it is a resource locator, not a credential. | None | None |
| `table` | The name or relative resource id of the table to manage IAM for. | true | false | Selects the table the binding attaches to; the table name alone does not authorize callers. | None | None |
| `role` | The role to apply. Only one `google_bigtable_table_iam_binding` may exist per role on a table. Custom roles use `[projects|organizations]/{parent-name}/roles/{role-name}`. See [Bigtable access control](https://cloud.google.com/bigtable/docs/access-control#roles). | true | true | Combined with `members`, this grants permissions on the table; overly broad roles weaken least privilege. | roles/bigtable.reader | roles/owner |
| `members` | Identities granted the privilege in `role`. Each entry can be one of: **allUsers**, **allAuthenticatedUsers**, **user:{email}**, **serviceAccount:{email}**, **group:{email}**, **domain:{domain}**. | true | true | Defines who receives the role; public principals broaden access beyond least privilege. | serviceAccount:reader@pde-test-project.iam.gserviceaccount.com | allUsers |
| `condition` | Optional IAM condition limiting when this binding applies. | false | false | Parent block for conditional IAM; impact depends on the nested `expression` and principals. | None | None |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression evaluated when the condition is enforced. | true | false | Constrains when a binding is active; the expression text is policy logic, not a secret. | None | None |
| `title` | Short title for the IAM condition. | true | false | UI metadata for operators; not used in authorization decisions. | None | None |
| `description` | Optional longer description of the IAM condition. | false | false | Optional prose documentation; ignored by IAM enforcement engines. | None | None |
