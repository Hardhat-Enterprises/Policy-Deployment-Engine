## 🛡️ Policy Deployment Engine: `logging_log_scope`

This section provides a concise policy evaluation for the `logging_log_scope` resource in GCP.

Reference: [Terraform Registry – logging_log_scope](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_log_scope)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name of the log scope. For example: \`projects/my-project/locations/global/logScopes/my-log-scope\` | true | None | None |
| `resource_names` | Names of one or more parent resources : *  \`projects/[PROJECT_ID]\` May alternatively be one or more views : * \`projects/[PROJECT_ID]/locations/[LOCATION_ID]/buckets/[BUCKET_ID]/views/[VIEW_ID]\` A log scope can include a maximum of 50 projects and a maximum of 100 resources in total. | true | None | None |
| `description` | Describes this log scopes. | false | None | None |
| `parent` | The parent of the resource. | false | None | None |
| `location` | The location of the resource. The only supported location is global so far. | false | None | None |
