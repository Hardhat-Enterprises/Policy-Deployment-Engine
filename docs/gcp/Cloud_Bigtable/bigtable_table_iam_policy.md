## 🛡️ Policy Deployment Engine: `bigtable_table_iam_policy`

This section provides a concise policy evaluation for the `bigtable_table_iam_policy` resource in GCP.

Reference: [Terraform Registry – bigtable_table_iam_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_table_iam_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | The project in which the table belongs. If it is not provided, Terraform uses the provider default. **Do not** manage the same table with `google_bigtable_table_iam_policy` alongside `google_bigtable_table_iam_binding` or `google_bigtable_table_iam_member`; authoritative policy replaces the full IAM policy and will conflict with incremental resources. | false | false | Project locator for the resource; exclusivity with binding or member resources is a Terraform lifecycle concern documented by the provider. | None | None |
| `instance_name` | The name or relative resource id of the instance that owns the table. | true | false | Selects the instance; the instance name alone does not authorize callers. | None | None |
| `table` | The name or relative resource id of the table whose IAM policy is set. | true | false | Selects the table; the table name alone does not authorize callers. | None | None |
| `policy_data` | Policy document from a `google_iam_policy` data source. This resource **replaces the entire IAM policy** on the table; omitting bindings can remove owners or admins unintentionally. Prefer binding or member resources unless you intentionally own the full policy document. | true | true | The full policy body defines every binding at once; mistakes can revoke access or grant excessive access in one apply. | None | None |
