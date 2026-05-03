## 🛡️ Policy Deployment Engine: `iam_principal_access_boundary_policy`

This section provides a concise policy evaluation for the `iam_principal_access_boundary_policy` resource in GCP.

Reference: [Terraform Registry – iam_principal_access_boundary_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_principal_access_boundary_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `organization` | The parent organization of the principal access boundary policy. | true | true | Restricting policies to approved organizations ensures IAM governance boundaries and prevents cross-tenant privilege escalation. | PDE1, PDE2, PDE3 | random-org-123 |
| `location` | The location the principal access boundary policy is in. | true | true | Enforcing global location ensures consistent IAM policy enforcement and avoids regional misconfiguration risks. | global | us-central1 |
| `principal_access_boundary_policy_id` | The ID to use to create the principal access boundary policy. This value must start with a lowercase letter followed by up to 62 lowercase letters, numbers, hyphens, or dots. | true | false | Ensures consistent naming conventions for policy identification and avoids invalid resource creation. | pab-policy-01 | PAB_POLICY_01 |
| `display_name` | The description of the principal access boundary policy. Must be less than or equal to 63 characters. | false | false | None | Standard Access Boundary Policy | Very long or unclear name exceeding limits |
| `annotations` | User defined annotations for metadata tagging and governance tracking. | false | false | Used for auditability and classification of IAM policies. | env=prod, owner=security-team | free-form or unstructured metadata |
| `details` | Principal access boundary policy details. | false | true | Defines enforcement rules that restrict principal access to approved resources. |  |  |
| `rules` | Policy rules defining access boundaries for principals. | true | true | Rules define the actual enforcement of access boundaries across resources. |  |  |

### details Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `rules` | A list of principal access boundary policy rules. | true | true | Rules define which resources principals can access under the boundary policy. | ALLOW only approved organizations/projects/folders | ALLOW all or overly broad resources |
| `enforcement_version` | Version of enforcement for Google Cloud services included in policy. | false | false | Ensures controlled rollout of enforcement changes across services. | latest or pinned version | empty or unmanaged versioning |

### rules Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `description` | The description of the principal access boundary policy rule. | false | false | None | Allow access to approved project set only | Unrestricted or vague rule description |
| `resources` | Cloud Resource Manager resources included in this rule. | true | true | Restricts access to approved organizations, folders, or projects only. | ['//cloudresourcemanager.googleapis.com/organizations/123', '//cloudresourcemanager.googleapis.com/folders/123', '//cloudresourcemanager.googleapis.com/projects/approved-project'] | ['//cloudresourcemanager.googleapis.com/projects/*'] |
| `effect` | The access relationship of principals to resources. | true | true | Defines whether access is allowed under the boundary policy. | ALLOW | DENY or undefined behavior |
