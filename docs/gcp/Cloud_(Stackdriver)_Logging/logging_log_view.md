## 🛡️ Policy Deployment Engine: `logging_log_view`

This section provides a concise policy evaluation for the `logging_log_view` resource in GCP.

Reference: [Terraform Registry – logging_log_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_log_view)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name of the view. For example: \`projects/my-project/locations/global/buckets/my-bucket/views/my-view\` | true | None | None |
| `bucket` | The bucket of the resource | true | None | None |
| `description` | Describes this view. | false | None | None |
| `filter` | Filter that restricts which log entries in a bucket are visible in this view. Filters are restricted to be a logical AND of ==/!= of any of the following: - originating project/folder/organization/billing account. - resource type - log id For example: SOURCE("projects/myproject") AND resource.type = "gce_instance" AND LOG_ID("stdout") | false | None | None |
| `parent` | The parent of the resource. | false | None | None |
| `location` | The location of the resource. The supported locations are: global, us-central1, us-east1, us-west1, asia-east1, europe-west1. | false | None | None |
