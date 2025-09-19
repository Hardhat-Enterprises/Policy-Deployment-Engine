## 🛡️ Policy Deployment Engine: `org_policy_custom_constraint`

This section provides a concise policy evaluation for the `org_policy_custom_constraint` resource in GCP.

Reference: [Terraform Registry – org_policy_custom_constraint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/org_policy_custom_constraint)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Immutable. The name of the custom constraint. This is unique within the organization. | true | false | Unique names prevent overlap or accidental override of constraints. | custom.restrictExternalBuckets | constraint1 |
| `condition` | A CEL condition that refers to a supported service resource, for example `resource.management.autoUpgrade == false`. For details about CEL usage, see [Common Expression Language](https://cloud.google.com/resource-manager/docs/organization-policy/creating-managing-custom-constraints#common_expression_language). | true | false | Improper conditions may weaken or break enforcement. | resource.name.startsWith("projects/secure-") | resource.name == "*" |
| `action_type` | The action to take if the condition is met. Possible values are: `ALLOW`, `DENY`. | true | false | Correctly setting this ensures insecure actions are blocked instead of allowed. | DENY | ALLOW for sensitive constraints |
| `method_types` | A list of RESTful methods for which to enforce the constraint. Can be `CREATE`, `UPDATE`, or both. Not all Google Cloud services support both methods. To see supported methods for each service, find the service in [Supported services](https://cloud.google.com/resource-manager/docs/organization-policy/custom-constraint-supported-services). | true | false | Without restricting both methods, insecure updates may bypass enforcement. | ["CREATE", "UPDATE"] | ["CREATE"] only |
| `resource_types` | Immutable. The fully qualified name of the Google Cloud REST resource containing the object and field you want to restrict. For example, `container.googleapis.com/NodePool`. | true | false | Misconfigured resource types may lead to policies not being applied at all. | ["storage.googleapis.com/Bucket"] | [] |
| `parent` | The parent of the resource, an organization. Format should be `organizations/{organization_id}`. | true | false | Incorrect parent scope could leave projects without enforcement. | organizations/123456789 | folders/123 without intent |
| `display_name` | A human-friendly name for the constraint. | false | false | Descriptive display names improve clarity during reviews. | Restrict External Buckets | Constraint1 |
| `description` | A human-friendly description of the constraint to display as an error message when the policy is violated. | false | false | Clear error messages make violations easier to resolve securely. | Buckets outside org are denied. | None |
