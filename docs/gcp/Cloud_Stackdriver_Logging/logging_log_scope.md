## 🛡️ Policy Deployment Engine: `logging_log_scope`

This section provides a concise policy evaluation for the `logging_log_scope` resource in GCP.

Reference: [Terraform Registry – logging_log_scope](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_log_scope)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The resource name of the log scope. Format: projects/PROJECT_ID/locations/global/logScopes/LOG_SCOPE_NAME | true | false | The log scope name is a unique identifier for the resource. It has no direct security implications beyond being a reference name. | projects/my-project/locations/global/logScopes/security-audit-scope | None |
| `resource_names` | Names of one or more parent resources that define which logs are included in this scope. Can be projects: 'projects/[PROJECT_ID]' or log views: 'projects/[PROJECT_ID]/locations/[LOCATION_ID]/buckets/[BUCKET_ID]/views/[VIEW_ID]'. A log scope can include a maximum of 50 projects and a maximum of 100 resources in total. | true | true | Resource names determine which logs are visible within the scope. Including sensitive projects or views can inadvertently expose logs to unauthorized users if the scope has broad IAM permissions. Conversely, excluding critical projects creates monitoring blind spots. | ["projects/prod-project-1", "projects/prod-project-2"] | ["projects/attacker-project", "projects/unmonitored-project"] |
| `description` | A user-provided description of the log scope. Maximum length of 8000 characters. | false | false | Description is metadata only and does not affect any security controls. | Log scope for security team to monitor production audit logs | None |
| `parent` | The parent resource of the log scope. Format: projects/PROJECT_ID/locations/global | false | false | Parent identifies the resource hierarchy location. Has no direct security impact on the log scope. | projects/my-project/locations/global | None |
| `location` | The location of the resource. The only supported location is global. | false | false | Location is fixed to global for log scopes. No security implications. | global | None |
