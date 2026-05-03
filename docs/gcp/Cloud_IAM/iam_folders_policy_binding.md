## 🛡️ Policy Deployment Engine: `iam_folders_policy_binding`

This section provides a concise policy evaluation for the `iam_folders_policy_binding` resource in GCP.

Reference: [Terraform Registry – iam_folders_policy_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_folders_policy_binding)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location of the PolicyBinding. | true | false | IAM folder policy bindings must be deployed only in a controlled location to ensure consistent enforcement. | global | us-central1 |
| `policy_kind` | The kind of the policy to attach in this binding. | false | false | Only Principal Access Boundary policies are allowed in folder-level bindings to enforce least privilege. | PRINCIPAL_ACCESS_BOUNDARY | ACCESS |
| `policy` | The resource name of the policy to be bound. | true | false | Binding must reference only approved Principal Access Boundary policies created by the organization security team. | ['organizations/123456789/locations/global/principalAccessBoundaryPolicies/pde-policy-1', 'organizations/123456789/locations/global/principalAccessBoundaryPolicies/pde-policy-2'] | ['organizations/999999999/locations/global/principalAccessBoundaryPolicies/unapproved-policy'] |
| `target` | Target is the full resource name of the resource to which the policy will be bound. | true | false | Ensures policy bindings apply only to controlled folder-level resources. | //cloudresourcemanager.googleapis.com/folders/123456789 | //cloudresourcemanager.googleapis.com/folders/external-folder |
| `policy_binding_id` | The Policy Binding ID. | true | false | Each binding must have a unique controlled identifier. | pde-folder-binding-1 | test-binding |
| `display_name` | Optional description of the policy binding. | false | false | Standard naming improves traceability in enterprise IAM systems. | pde-secure-folder-binding | test |

### target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principal_set` | Full Resource Name of the principal set used for policy bindings. | false | false | Only folder-level principal sets should be allowed for IAM folder policy bindings. | //cloudresourcemanager.googleapis.com/folders/123456789 | //cloudresourcemanager.googleapis.com/folders/999999999 |
