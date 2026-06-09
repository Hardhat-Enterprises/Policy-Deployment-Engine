## 🛡️ Policy Deployment Engine: `logging_linked_dataset`

This section provides a concise policy evaluation for the `logging_linked_dataset` resource in GCP.

Reference: [Terraform Registry – logging_linked_dataset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_linked_dataset)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `link_id` | The unique identifier for the linked dataset. This ID will become part of the BigQuery dataset name: logging_{link_id}. | true | false | The link ID is used to generate the BigQuery dataset name and has no direct security implications beyond uniqueness. | audit-logs-linked-dataset | None |
| `bucket` | The logging bucket to which the linked dataset is attached. Format: projects/PROJECT_ID/locations/LOCATION/buckets/BUCKET_ID | true | false | This identifies which logging bucket is linked to BigQuery. It determines which logs become queryable in BigQuery but has no direct security impact on access controls or encryption. | projects/my-project/locations/global/buckets/audit-log-bucket | None |
| `description` | Describes this link. The maximum length of the description is 8000 characters. | false | false | Description is metadata only and does not affect any security controls. | Link for compliance audit log analysis in BigQuery | None |
| `parent` | The parent resource of the linked dataset. Format: projects/PROJECT_ID/locations/LOCATION/buckets/BUCKET_ID | false | false | Parent identifies the parent resource hierarchy. Has no direct security impact on the linked dataset. | projects/my-project/locations/global/buckets/audit-log-bucket | None |
| `location` | The location where the linked dataset will be created. Must match the location of the logging bucket. Examples: global, us-central1, eu, asia-southeast1 | false | false | Location selection affects data residency requirements and compliance (e.g., GDPR, HIPAA) but does not directly impact security controls like encryption or access management. | australia-southeast1 | None |
