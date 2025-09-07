## 🛡️ Policy Deployment Engine: `logging_log_scope`

This section provides a concise policy evaluation for the `logging_log_scope` resource in GCP.

Reference: [Terraform Registry – logging_log_scope](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_log_scope)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name of the log scope. For example: \`projects/my-project/locations/global/logScopes/my-log-scope\`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_names`
- Description: (Required) Names of one or more parent resources : *  \`projects/[PROJECT_ID]\` May alternatively be one or more views : * \`projects/[PROJECT_ID]/locations/[LOCATION_ID]/buckets/[BUCKET_ID]/views/[VIEW_ID]\` A log scope can include a maximum of 50 projects and a maximum of 100 resources in total.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Describes this log scopes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The parent of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location of the resource. The only supported location is global so far.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
