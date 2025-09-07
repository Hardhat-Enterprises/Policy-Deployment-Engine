## 🛡️ Policy Deployment Engine: `chronicle_rule`

This section provides a concise policy evaluation for the `chronicle_rule` resource in GCP.

Reference: [Terraform Registry – chronicle_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_rule)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Required) The unique identifier for the Chronicle instance, which is the same as the customer ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text`
- Description: (Optional) The YARA-L content of the rule. Populated in FULL view.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: (Optional) Resource name of the DataAccessScope bound to this rule. Populated in BASIC view and FULL view. If reference lists are used in the rule, validations will be performed against this scope to ensure that the reference lists are compatible with both the user's and the rule's scopes. The scope should be in the format: "projects/{project}/locations/{location}/instances/{instance}/dataAccessScopes/{scope}".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `etag`
- Description: (Optional) The etag for this rule. If this is provided on update, the request will succeed if and only if it matches the server-computed value, and will fail with an ABORTED error otherwise. Populated in BASIC view and FULL view.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: If deletion_policy = "FORCE", any retrohunts and any detections associated with the rule will also be deleted. If deletion_policy = "DEFAULT", the call will only succeed if the rule has no associated retrohunts, including completed retrohunts, and no associated detections. Regardless of this field's value, the rule deployment associated with this rule will also be deleted. Possible values: DEFAULT, FORCE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
