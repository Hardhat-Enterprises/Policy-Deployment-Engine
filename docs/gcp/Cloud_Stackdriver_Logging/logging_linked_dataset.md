## 🛡️ Policy Deployment Engine: `logging_linked_dataset`

This section provides a concise policy evaluation for the `logging_linked_dataset` resource in GCP.

Reference: [Terraform Registry – logging_linked_dataset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_linked_dataset)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `link_id` | A unique identifier for the linked dataset. This ID is used to reference and manage the linked dataset configuration. | true | false | The link ID is primarily an identifier and does not directly impact the security of the logging data or configuration. | security-audit-link | None |
| `bucket` | The name of the logging bucket to which the dataset is linked. This specifies where the log data is stored and managed. | true | true | The bucket configuration determines where sensitive log data is stored and must be properly secured with appropriate access controls and encryption. | projects/my-project/locations/global/buckets/security-logs | projects/my-project/locations/global/buckets/public-logs |
| `description` | A human-readable description of the purpose and scope of the linked dataset. Maximum length is 8000 characters. | false | true | Clear documentation helps maintain audit trails, ensures proper configuration management, and aids in security investigations by explaining the purpose of the linked dataset. | Links security audit logs from multiple projects to centralized analysis bucket for compliance monitoring | linked dataset |
| `parent` | The parent resource of the linked dataset. This specifies the organizational or project context in which the linked dataset operates. | false | true | Proper parent scoping ensures that linked datasets are created in the correct organizational context and inherit appropriate security policies and permissions. | folders/123456789012 | None |
| `location` | The geographic location where the linked dataset and its associated log data are stored. This controls data residency and compliance with regional regulations. | false | true | The storage location is critical for data sovereignty, compliance with regional data protection laws, and ensuring log data is stored in authorized geographic regions. | australia-southeast1 | us-central1 |
