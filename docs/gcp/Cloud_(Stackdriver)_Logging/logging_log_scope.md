## 🛡️ Policy Deployment Engine: `logging_log_scope`

This section provides a concise policy evaluation for the `logging_log_scope` resource in GCP.

Reference: [Terraform Registry – logging_log_scope](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_log_scope)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The resource name of the log scope. This uniquely identifies the log scope resource within the Google Cloud project and location. | true | false | The name is primarily an identifier and follows a structured format, but does not directly impact the security of the log data or access controls. | projects/my-security-project/locations/global/logScopes/security-audit-scope | my-log-scope |
| `resource_names` | An array of parent resource names or view names that define the scope of log collection. This can include projects and specific log views, with limits of 50 projects and 100 total resources. | true | true | The resource names define the scope of log collection and must be carefully selected to ensure appropriate log capture without including unauthorized or unintended resources. | ['projects/security-audit-project', 'projects/compliance-project'] | ['projects/*', 'projects/public-project'] |
| `description` | A human-readable description explaining the purpose, scope, and intended use of this log scope configuration. | false | true | Clear documentation helps maintain audit trails, ensures proper configuration management, and aids security teams in understanding the purpose and boundaries of the log scope. | Collects security-related logs from all production projects for centralized monitoring and threat detection | log scope for some projects |
| `parent` | The parent resource under which this log scope is created. This provides the organizational context and inheritance for the log scope configuration. | false | true | Proper parent configuration ensures the log scope is created in the correct organizational context and inherits appropriate security policies and permissions. | projects/my-security-project | None |
| `location` | The geographic location where the log scope resource is managed. Currently, only the global location is supported for log scopes. | false | true | While currently limited to global, the location setting may impact future data residency considerations and should be set appropriately for organizational policies. | global | us-central1 |
