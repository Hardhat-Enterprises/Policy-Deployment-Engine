## 🛡️ Policy Deployment Engine: `logging_folder_exclusion`

This section provides a concise policy evaluation for the `logging_folder_exclusion` resource in GCP.

Reference: [Terraform Registry – logging_folder_exclusion](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_folder_exclusion)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `folder` | The folder to which the logging exclusion rule applies. This specifies the organizational scope where the exclusion filter will be implemented. | true | true | Proper folder scoping ensures that logging exclusions are only applied to the intended resources and don't inadvertently affect other parts of the organization's logging infrastructure. | folders/123456789012 | projects/my-project |
| `name` | The name of the logging exclusion. Must be unique within the folder. | true | false | While the name itself doesn't impact security, it helps with identification and management of exclusion rules. | high-volume-noise-exclusion | None |
| `description` | A human-readable description of the purpose and scope of this logging exclusion. | false | true | Clear documentation of exclusion rules helps maintain audit trails and ensures security teams understand why certain logs are being excluded. | Excludes high-volume health check logs to reduce storage costs while maintaining security-relevant logging | exclude some logs |
| `disabled` | Whether the logging exclusion is disabled. If true, the exclusion filter is not applied and logs are not excluded. | false | true | Disabled exclusions should be carefully monitored as they may indicate incomplete logging configuration or security controls that are not functioning as intended. | False | True |
| `filter` | The filter that determines which log entries to exclude from logging. Uses the Google Cloud Logging advanced filter language. | true | true | The filter content is critical for security as overly broad exclusions could inadvertently hide security-relevant events or audit trails. | resource.type="gce_instance" AND severity<ERROR AND protoPayload.methodName:"health.check" | resource.type="gce_instance" |
