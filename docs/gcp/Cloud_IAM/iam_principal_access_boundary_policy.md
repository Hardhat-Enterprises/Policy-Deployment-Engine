## 🛡️ Policy Deployment Engine: `iam_principal_access_boundary_policy`

This section provides a concise policy evaluation for the `iam_principal_access_boundary_policy` resource in GCP.

Reference: [Terraform Registry – iam_principal_access_boundary_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_principal_access_boundary_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `organization` | The parent organization of the principal access boundary policy. | true | true | Principal Access Boundary policies must use only approved organization IDs to ensure proper IAM governance and organizational compliance. | ['PDE1', 'PDE2', 'PDE3'] | 234 |
| `location` | The location the principal access boundary policy is in. | true | true | Principal access boundary policies must be deployed only in approved Australian regions to meet organizational residency and compliance requirements. | ['australia-southeast1', 'australia-southeast2'] | global |
| `principal_access_boundary_policy_id` | The ID to use to create the principal access boundary policy. This value must start with a lowercase letter followed by up to 62 lowercase letters, numbers, hyphens, or dots. Pattern, /a-z{2,62}/. | true | false | This field uniquely identifies the principal access boundary policy resource. | None | None |
| `display_name` | The description of the principal access boundary policy. Must be less than or equal to 63 characters. | false | false | This field is used only for readability and identification purposes. | None | None |
| `annotations` | User defined annotations. See https://google.aip.dev/148#annotations for more details such as format and size limitations **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Annotations are metadata fields and do not directly affect IAM policy enforcement. | None | None |
| `details` | Principal access boundary policy details Structure is [documented below](#nested_details). | false | true | The details section defines how the principal access boundary policy is enforced. | None | None |
| `rules` |  | false | true | Rules define the allowed access boundaries for principals. | None | None |

### details Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `rules` | A list of principal access boundary policy rules. The number of rules in a policy is limited to 500. Structure is [documented below](#nested_details_rules). | true | true | Rules define which resources principals are allowed to access. | None | None |
| `enforcement_version` | The version number that indicates which Google Cloud services are included in the enforcement (e.g. \"latest\", \"1\", ...). If empty, the PAB policy version will be set to the current latest version, and this version won't get updated when new versions are released. | false | true | The enforcement version controls which services are covered by the security policy enforcement. | None | None |

### rules Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `description` | The description of the principal access boundary policy rule. Must be less than or equal to 256 characters. | false | false | This field is used only for documentation and readability purposes. | None | None |
| `resources` | A list of Cloud Resource Manager resources. The resource and all the descendants are included. The number of resources in a policy is limited to 500 across all rules. The following resource types are supported: * Organizations, such as `//cloudresourcemanager.googleapis.com/organizations/123`. * Folders, such as `//cloudresourcemanager.googleapis.com/folders/123`. * Projects, such as `//cloudresourcemanager.googleapis.com/projects/123` or `//cloudresourcemanager.googleapis.com/projects/my-project-id`. | true | true | Resources define which cloud resources are included within the access boundary policy scope. | None | None |
| `effect` | The access relationship of principals to the resources in this rule. Possible values: ALLOW | true | true | The effect determines whether access to resources is permitted under the policy rule. | None | None |
