## 🛡️ Policy Deployment Engine: `logging_organization_exclusion`

This section provides a concise policy evaluation for the `logging_organization_exclusion` resource in GCP.

Reference: [Terraform Registry – logging_organization_exclusion](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_organization_exclusion)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the logging exclusion. Must be unique within the organization. Names can contain only letters, numbers, underscores, and hyphens. | true | true | Proper naming helps identify the purpose of log exclusions and maintain organizational standards for security monitoring. | exclude-health-checks | exclusion_with_invalid@characters |
| `org_id` | The organization ID for which to create the exclusion. This should be the numeric organization ID. | true | true | Proper organization specification ensures log exclusions are created in the correct organizational context. | 123456789012 | invalid-org-id |
| `description` | A description of the exclusion, which explains why certain logs are being excluded. This helps maintain auditability of exclusion rules. | false | true | Clear descriptions provide justification for exclusions and help maintain security audit trails. | Excludes health check logs to reduce noise in security monitoring |  |
| `disabled` | If set to true, the exclusion is disabled and does not exclude any log entries. Default is false. | false | true | Unexpected enabling/disabling of exclusions can affect security monitoring by either including sensitive data or excluding security-relevant logs. | False | True |
| `filter` | See [Advanced Log Filters](https://cloud.google.com/logging/docs/view/advanced-filters) for information on how to write a filter. The filter that determines which log entries to exclude. | true | true | Carefully crafted filters are essential to avoid excluding security-relevant logs while reducing noise from non-essential logs. | resource.type="gce_instance" AND jsonPayload.MESSAGE:"Health check" | severity<ERROR |
