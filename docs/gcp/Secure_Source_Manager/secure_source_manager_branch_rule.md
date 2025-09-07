## 🛡️ Policy Deployment Engine: `secure_source_manager_branch_rule`

This section provides a concise policy evaluation for the `secure_source_manager_branch_rule` resource in GCP.

Reference: [Terraform Registry – secure_source_manager_branch_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secure_source_manager_branch_rule)

---

## 1. Argument Reference

### `include_pattern`
- Description: (Required) The BranchRule matches branches based on the specified regular expression. Use .* to match all branches.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `branch_rule_id`
- Description: (Required) The ID for the BranchRule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the Repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository_id`
- Description: (Required) The ID for the Repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Determines if the branch rule is disabled or not.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_pull_request`
- Description: (Optional) Determines if the branch rule requires a pull request or not.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minimum_reviews_count`
- Description: (Optional) The minimum number of reviews required for the branch rule to be matched.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minimum_approvals_count`
- Description: (Optional) The minimum number of approvals required for the branch rule to be matched.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_comments_resolved`
- Description: (Optional) Determines if require comments resolved before merging to the branch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_stale_reviews`
- Description: (Optional) Determines if allow stale reviews or approvals before merging to the branch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_linear_history`
- Description: (Optional) Determines if require linear history before merging to the branch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
