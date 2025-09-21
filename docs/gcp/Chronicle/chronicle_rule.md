## 🛡️ Policy Deployment Engine: `chronicle_rule`

This section provides a concise policy evaluation for the `chronicle_rule` resource in GCP.

Reference: [Terraform Registry – chronicle_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_rule)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2". | true | true | Restricting Chronicle resources to approved regions ensures compliance with data residency and service availability requirements. | australia-southeast1 | Any location other than 'australia-southeast1', such as 'europe-west3', is considered non-compliant. |
| `instance` | The unique identifier for the Chronicle instance, which is the same as the customer ID. | true | false | None | None | None |
| `text` | The YARA-L content of the rule. Populated in FULL view. | false | false | None | None | None |
| `scope` | Resource name of the DataAccessScope bound to this rule. Populated in BASIC view and FULL view. If reference lists are used in the rule, validations will be performed against this scope to ensure that the reference lists are compatible with both the user's and the rule's scopes. The scope should be in the format: "projects/{project}/locations/{location}/instances/{instance}/dataAccessScopes/{scope}". | false | false | None | None | None |
| `etag` | The etag for this rule. If this is provided on update, the request will succeed if and only if it matches the server-computed value, and will fail with an ABORTED error otherwise. Populated in BASIC view and FULL view. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `deletion_policy` | If deletion_policy = "FORCE", any retrohunts and any detections associated with the rule will also be deleted. If deletion_policy = "DEFAULT", the call will only succeed if the rule has no associated retrohunts, including completed retrohunts, and no associated detections. Regardless of this field's value, the rule deployment associated with this rule will also be deleted. Possible values: DEFAULT, FORCE | false | false | None | None | None |
