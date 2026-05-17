## 🛡️ Policy Deployment Engine: `logging_organization_exclusion`

This section provides a concise policy evaluation for the `logging_organization_exclusion` resource in GCP.

Reference: [Terraform Registry – logging_organization_exclusion](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_organization_exclusion)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the logging exclusion. Must be unique within the organization. | true | false | Name is a unique identifier for the exclusion filter. It has no security implications beyond being a reference name. | org-audit-log-exclusion | None |
| `org_id` | The organization that will own the exclusion filter. Format: organizations/ORGANIZATION_ID | true | false | This identifies which organization owns the exclusion filter. It has no direct security impact on the exclusion's behavior. | organizations/123456789012 | None |
| `description` | A user-provided description of the exclusion filter. Maximum length of 800 characters. | false | false | Description is metadata only and does not affect any security controls. | Exclude health check logs from organization-level logging | None |
| `disabled` | Whether the exclusion is disabled. If set to true, the exclusion will not be applied to logs. Default: false. | false | true | If disabled is set to false (default), the exclusion actively filters out logs at the organization level. Security-critical logs should never be excluded as it creates organization-wide blind spots for security monitoring and incident response. | false | true |
| `filter` | An advanced logs filter that matches the log entries to be excluded. See [Advanced Log Filters](https://cloud.google.com/logging/docs/view/advanced-filters) for information on how to write a filter. | true | true | The filter determines which logs are excluded at the organization level. Excluding security-relevant logs (audit logs, high severity logs, IAM changes) creates critical organization-wide security blind spots and violates CIS GCP Benchmark requirements. Organization-level exclusions affect ALL projects under the organization. | resource.type = "k8s_container" AND jsonPayload.health_check = true | logName = "organizations/123456789012/logs/cloudaudit.googleapis.com%2Factivity" |
