## 🛡️ Policy Deployment Engine: `iam_deny_policy`

This section provides a concise policy evaluation for the `iam_deny_policy` resource in GCP.

Reference: [Terraform Registry – iam_deny_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_deny_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the policy. | true | false | We enforce a simple naming rule using prefix 'pde-' so all deny policies are consistent and easy to track. | pde-deny-policy-prod | denyPolicy123 |
| `parent` | The attachment point is identified by its URL-encoded full resource name. | true | false | Parent must always follow valid GCP resource format so the deny policy is applied to the correct scope. | cloudresourcemanager.googleapis.com/projects/123456789 | projects/test-project |
| `rules` | Rules to be applied. | true | false | Rules are used to enforce strict deny controls on sensitive resources. | None | None |
| `display_name` | The display name of the rule. | false | false | Used for readability and easier management of policies. | Production Deny Policy | test123 |
| `deny_rule` |  | false | false | Used to enforce security restrictions and prevent unauthorized actions. | None | None |
| `denied_principals` | Users or identities that are blocked from access. | false | false | We block risky or unwanted identities using deny rules. | ['user:blocked-user@example.com'] | ['allUsers'] |
| `denied_permissions` | Permissions that are explicitly denied. | false | false | We deny high-risk permissions to enforce least privilege. | ['iam.googleapis.com/roles.list'] | ['*'] |
| `denial_condition` | Condition when the deny rule should apply. | false | false | Used to apply deny rules only in specific situations. | {'expression': "request.time < timestamp('2026-12-31T00:00:00Z')", 'title': 'Time restriction', 'description': 'Deny access after expiry date', 'location': 'global'} | {'expression': 'true'} |
