## 🛡️ Policy Deployment Engine: `org_policy_custom_constraint`

This section provides a concise policy evaluation for the `org_policy_custom_constraint` resource in GCP.

Reference: [Terraform Registry – org_policy_custom_constraint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/org_policy_custom_constraint)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Immutable. The name of the custom constraint. This is unique within the organization. | true | None | None |
| `condition` | A CEL condition that refers to a supported service resource, for example `resource.management.autoUpgrade == false`. For details about CEL usage, see [Common Expression Language](https://cloud.google.com/resource-manager/docs/organization-policy/creating-managing-custom-constraints#common_expression_language). | true | None | None |
| `action_type` | The action to take if the condition is met. Possible values are: `ALLOW`, `DENY`. | true | None | None |
| `method_types` | A list of RESTful methods for which to enforce the constraint. Can be `CREATE`, `UPDATE`, or both. Not all Google Cloud services support both methods. To see supported methods for each service, find the service in [Supported services](https://cloud.google.com/resource-manager/docs/organization-policy/custom-constraint-supported-services). | true | None | None |
| `resource_types` | Immutable. The fully qualified name of the Google Cloud REST resource containing the object and field you want to restrict. For example, `container.googleapis.com/NodePool`. | true | None | None |
| `parent` | The parent of the resource, an organization. Format should be `organizations/{organization_id}`. | true | None | None |
| `display_name` | A human-friendly name for the constraint. | false | None | None |
| `description` | A human-friendly description of the constraint to display as an error message when the policy is violated. | false | None | None |
