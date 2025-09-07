## 🛡️ Policy Deployment Engine: `logging_log_view`

This section provides a concise policy evaluation for the `logging_log_view` resource in GCP.

Reference: [Terraform Registry – logging_log_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_log_view)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name of the view. For example: \`projects/my-project/locations/global/buckets/my-bucket/views/my-view\`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) The bucket of the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Describes this view.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Optional) Filter that restricts which log entries in a bucket are visible in this view. Filters are restricted to be a logical AND of ==/!= of any of the following: - originating project/folder/organization/billing account. - resource type - log id For example: SOURCE("projects/myproject") AND resource.type = "gce_instance" AND LOG_ID("stdout")
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The parent of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location of the resource. The supported locations are: global, us-central1, us-east1, us-west1, asia-east1, europe-west1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
