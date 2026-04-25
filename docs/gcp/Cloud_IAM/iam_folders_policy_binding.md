## 🛡️ Policy Deployment Engine: `iam_folders_policy_binding`

This section provides a concise policy evaluation for the `iam_folders_policy_binding` resource in GCP.

Reference: [Terraform Registry – iam_folders_policy_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_folders_policy_binding)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `folder` | The parent folder for the IAM policy binding. Must be a valid numeric GCP folder ID. | true | true | Ensures IAM policy is applied only at a valid folder scope. | 224774388 | my-folder |
| `location` | The location of the policy binding. Must always be global for folder IAM bindings. | true | true | IAM folder bindings are global to ensure consistent access control. | global | us-central1 |
| `policy_binding_id` | Unique identifier for the policy binding. | true | true | Ensures each binding is uniquely identifiable. | folder-binding-01 | Folder Binding 01 |
| `display_name` | Optional human-readable name for the policy binding (max 63 characters). | false | false | Used only for display purposes. | Folder IAM Binding | This name is way too long and not valid for IAM folder binding display name usage |
| `annotations` | Optional metadata used for tagging and classification. | false | false | Does not affect IAM security enforcement. | {'environment': 'dev', 'team': 'security'} | {'notes': 'this is an invalid overly long annotation example used for testing purposes and should not be used in production environments because it violates expected size constraints'} |
| `policy_kind` | Type of IAM policy being applied (e.g., ACCESS or PRINCIPAL_ACCESS_BOUNDARY). | false | true | Defines how IAM policy is enforced. | ACCESS | INVALID_TYPE |
| `target` | Full resource name of the target folder where the policy is applied. | true | true | Defines the exact scope of IAM enforcement. | //cloudresourcemanager.googleapis.com/folders/224774388 | //invalid/resource |
| `condition` | Optional CEL condition for conditional IAM access control. | false | true | Enables fine-grained access control rules. | {'expression': "resource.name.startsWith('folders/')", 'title': 'Folder access rule', 'description': 'Allows access only to folder resources'} | {'expression': 'true'} |

### target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principal_set` | Principal set used for access boundary enforcement within the folder. | false | true | Restricts access to approved identities within folder boundary. | //cloudresourcemanager.googleapis.com/folders/224774388 | //cloudresourcemanager.googleapis.com/projects/123 |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression defining IAM condition logic. | false | true | Controls conditional access behavior. | resource.name.startsWith('folders/') | true |
| `title` | Short title for the condition. | false | false | For readability only. | Folder Condition |  |
| `description` | Detailed explanation of the condition. | false | false | Documentation purpose only. | Restricts access to folder-level resources |  |
| `location` | Debug location for condition evaluation. | false | false | Used for error tracing. | global |  |
