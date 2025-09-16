## 🛡️ Policy Deployment Engine: `logging_project_exclusion`

This section provides a concise policy evaluation for the `logging_project_exclusion` resource in GCP.

Reference: [Terraform Registry – logging_project_exclusion](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_exclusion)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `filter` | See [Advanced Log Filters](https://cloud.google.com/logging/docs/view/advanced-filters) for information on how to write a filter. The filter that determines which log entries to exclude. | true | true | Carefully crafted filters are essential to avoid excluding security-relevant logs while reducing noise from non-essential logs. | resource.type="gce_instance" AND jsonPayload.MESSAGE:"Health check" | severity<ERROR |
| `name` | The name of the logging exclusion. Must be unique within the project. Names can contain only letters, numbers, underscores, and hyphens. | true | true | Proper naming helps identify the purpose of log exclusions and maintain organizational standards for security monitoring. | exclude-health-checks | exclusion_with_invalid@characters |
| `description` | A description of the exclusion, which explains why certain logs are being excluded. This helps maintain auditability of exclusion rules. | false | true | Clear descriptions provide justification for exclusions and help maintain security audit trails. | Excludes health check logs to reduce noise in security monitoring |  |
| `disabled` | If set to true, the exclusion is disabled and does not exclude any log entries. Default is false. | false | true | Unexpected enabling/disabling of exclusions can affect security monitoring by either including sensitive data or excluding security-relevant logs. | False | True |
| `project` | The project ID where the exclusion should be created. If not provided, the provider project is used. | false | true | Proper project specification ensures exclusions are created in the correct project context with appropriate access controls. | my-security-project | untrusted-external-project |
