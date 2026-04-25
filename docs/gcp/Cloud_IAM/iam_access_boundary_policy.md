## 🛡️ Policy Deployment Engine: `iam_access_boundary_policy`

This section provides a concise policy evaluation for the `iam_access_boundary_policy` resource in GCP.

Reference: [Terraform Registry – iam_access_boundary_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_access_boundary_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the policy. | true | false | We enforce a simple naming rule (pde-*) so all policies follow the same pattern and are easy to identify. | pde-access-boundary-prod | myPolicy123 |
| `parent` | The resource where this policy is attached. | true | false | Parent must always be a valid GCP project or organization path so the policy applies correctly. | cloudresourcemanager.googleapis.com/projects/123456789 | projects/test-project |
| `rules` | Rules that define what resources and permissions are allowed. | true | false | We use rules to enforce least privilege and limit access only to required resources. | None | None |
| `display_name` | A simple name shown in the console. | false | false | Used for readability and easier management. | Production Access Boundary Policy | test |
| `access_boundary_rule` | Defines which resources and permissions are allowed. | false | false | We use this to enforce least privilege access in GCP. | None | None |
| `available_resource` | The GCP resource that is allowed. | false | false | Avoids access to wrong or sensitive projects. | //cloudresourcemanager.googleapis.com/projects/123456789 | //cloudresourcemanager.googleapis.com/projects/random-project |
| `available_permissions` | Permissions allowed for the resource. | false | false | We only allow required permissions instead of full access. | ['resourcemanager.projects.get'] | ['*'] |
| `availability_condition` | Extra condition to control when access is allowed. | false | false | Used to restrict access under specific conditions only. | {'expression': "request.time < timestamp('2026-12-31T00:00:00Z')", 'title': 'Time limit', 'description': 'Access allowed only before expiry date', 'location': 'global'} | {'expression': 'true'} |
