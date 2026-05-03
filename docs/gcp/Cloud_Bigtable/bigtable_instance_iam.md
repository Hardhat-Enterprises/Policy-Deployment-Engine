## 🛡️ Policy Deployment Engine: `bigtable_instance_iam`

This section provides a concise policy evaluation for the `bigtable_instance_iam` resource in GCP.

Reference: [Terraform Registry – bigtable_instance_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | The project in which the instance belongs. If it is not provided, Terraform will use the provider default. | false | false | Non-secret project id for the Terraform resource; actual access grants still come from `member`/`members` + `role`, not from repeating the project id here. | None | None |
| `instance` | The name or relative resource ID of the Bigtable instance for member/binding resources. | true | false | Selects the Bigtable instance resource to attach the binding to; it is a target reference, not a credential and not the list of who is allowed. | None | None |
| `member/members` | Identities granted the privilege in `role` (`member` on `google_bigtable_instance_iam_member`, `members` on binding). Includes special principals such as allUsers and allAuthenticatedUsers. | true | true | Defines who receives the role on the instance; public principals broaden access beyond least privilege. | "serviceAccount:test-sa@test-project.iam.gserviceaccount.com" | "allUsers" or "allAuthenticatedUsers" |
| `role` | The role to grant. Custom roles use `[projects|organizations]/{parent}/roles/{role-name}`. See Bigtable IAM roles in GCP docs. | true | false | The role id describes permissions only; without a principal (`member`/`members`) it grants nothing—similar to naming an api role without attaching a caller. | None | None |
| `condition` | Optional IAM condition that limits when this binding applies. | false | false | The parent block for optional conditional IAM; the block being present does not by itself add or remove a member—security impact is in the nested `expression` and in which principal is bound. | None | None |
| `policy_data` | For `google_bigtable_instance_iam_policy` only: the policy document from a `google_iam_policy` data source. | true | false | A container for the rendered IAM policy body; the attribute is the delivery mechanism—actual grants are in the policy’s bindings, not the fact that this field exists. | None | None |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression evaluated when the condition is enforced. | true | false | Constrains when a binding is active; misconfiguration can widen effective access, but the expression text itself is policy logic—not a password—and still sits behind IAM’s principal checks. | None | None |
| `title` | Short title for the IAM condition in consoles. | true | false | UI metadata for operators only; not evaluated for authorization decisions. | None | None |
| `description` | Longer description of the IAM condition. | false | false | Optional prose documentation; ignored by IAM enforcement engines. | None | None |
