## 🛡️ Policy Deployment Engine: `logging_log_view`

This section provides a concise policy evaluation for the `logging_log_view` resource in GCP.

Reference: [Terraform Registry – logging_log_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_log_view)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The resource name of the view. Format: projects/PROJECT_ID/locations/LOCATION/buckets/BUCKET_ID/views/VIEW_NAME | true | false | The view name is a unique identifier for the resource. It has no direct security implications beyond being a reference name. | projects/my-project/locations/global/buckets/audit-bucket/views/security-view | None |
| `bucket` | The logging bucket that contains this view. Format: projects/PROJECT_ID/locations/LOCATION/buckets/BUCKET_ID | true | false | Bucket identifies which logging bucket the view belongs to. Has no direct security impact beyond resource identification. | projects/my-project/locations/global/buckets/audit-bucket | None |
| `description` | A user-provided description of the log view. Maximum length of 800 characters. | false | false | Description is metadata only and does not affect any security controls. | Security view for audit logs - restricts to IAM and firewall events | None |
| `filter` | Filter that restricts which log entries in a bucket are visible in this view. Filters are restricted to be a logical AND of ==/!= of: originating project/folder/organization/billing account, resource type, log id. Example: SOURCE("projects/myproject") AND resource.type = "gce_instance" AND LOG_ID("stdout") | false | true | Filter determines which logs are visible through this view. Overly broad filters may expose sensitive logs to unauthorized viewers. Restrictive filters can hide critical security events from security teams, creating blind spots. | SOURCE("projects/my-project") AND (LOG_ID("cloudaudit.googleapis.com%2Factivity") OR LOG_ID("cloudaudit.googleapis.com%2Fdata_access")) | SOURCE("projects/my-project") AND severity < ERROR |
| `parent` | The parent resource of the log view. Format: projects/PROJECT_ID/locations/LOCATION/buckets/BUCKET_ID | false | false | Parent identifies the resource hierarchy location. Has no direct security impact. | projects/my-project/locations/global/buckets/audit-bucket | None |
| `location` | The location of the resource. Supported locations: global, us-central1, us-east1, us-west1, asia-east1, europe-west1, australia-southeast1 | false | false | Location selection affects data residency requirements but does not directly impact security controls like encryption or access management. | australia-southeast1 | None |
