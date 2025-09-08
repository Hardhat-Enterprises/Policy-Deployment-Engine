## 🛡️ Policy Deployment Engine: `secure_source_manager_branch_rule`

This section provides a concise policy evaluation for the `secure_source_manager_branch_rule` resource in GCP.

Reference: [Terraform Registry – secure_source_manager_branch_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secure_source_manager_branch_rule)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `include_pattern` | The BranchRule matches branches based on the specified regular expression. Use .* to match all branches. | true | None | None |
| `branch_rule_id` | The ID for the BranchRule. | true | None | None |
| `location` | The location for the Repository. | true | None | None |
| `repository_id` | The ID for the Repository. | true | None | None |
| `disabled` | Determines if the branch rule is disabled or not. | false | None | None |
| `require_pull_request` | Determines if the branch rule requires a pull request or not. | false | None | None |
| `minimum_reviews_count` | The minimum number of reviews required for the branch rule to be matched. | false | None | None |
| `minimum_approvals_count` | The minimum number of approvals required for the branch rule to be matched. | false | None | None |
| `require_comments_resolved` | Determines if require comments resolved before merging to the branch. | false | None | None |
| `allow_stale_reviews` | Determines if allow stale reviews or approvals before merging to the branch. | false | None | None |
| `require_linear_history` | Determines if require linear history before merging to the branch. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
