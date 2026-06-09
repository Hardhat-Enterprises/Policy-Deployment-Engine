## 🛡️ Policy Deployment Engine: `logging_billing_account_exclusion`

This section provides a concise policy evaluation for the `logging_billing_account_exclusion` resource in GCP.

Reference: [Terraform Registry – logging_billing_account_exclusion](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_billing_account_exclusion)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `billing_account` | The billing account that will own the exclusion filter. Format: billingAccounts/BILLING_ACCOUNT_ID | true | false | This identifies which billing account owns the exclusion filter. It has no direct security impact on the exclusion's behavior. | billingAccounts/123456-789ABC-DEF012 | None |
| `name` | The name of the logging exclusion. Must be unique within the billing account. | true | false | Name is a unique identifier for the exclusion filter. It has no security implications beyond being a reference name. | audit-log-exclusion | None |
| `description` | A user-provided description of the exclusion filter. Maximum length of 800 characters. | false | false | Description is metadata only and does not affect any security controls. | Exclude health check logs from development namespace | None |
| `disabled` | Whether the exclusion is disabled. If set to true, the exclusion will not be applied to logs. Default: false. | false | true | If disabled is set to false (default), the exclusion actively filters out logs. Security-critical logs should never be excluded as it creates blind spots for security monitoring and incident response. | false | true |
| `filter` | An advanced logs filter that matches the log entries to be excluded. See [Advanced Log Filters](https://cloud.google.com/logging/docs/view/advanced-filters) for information on how to write a filter. | true | true | The filter determines which logs are excluded. Excluding security-relevant logs (audit logs, high severity logs, IAM changes) creates critical security blind spots and violates CIS GCP Benchmark requirements. Filters should be restricted to non-security logs only. | resource.type = "k8s_container" AND jsonPayload.health_check = true | logName = "projects/my-project/logs/cloudaudit.googleapis.com%2Factivity" |
