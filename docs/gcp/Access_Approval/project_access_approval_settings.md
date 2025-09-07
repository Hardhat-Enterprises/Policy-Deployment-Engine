## 🛡️ Policy Deployment Engine: `project_access_approval_settings`

This section provides a concise policy evaluation for the `project_access_approval_settings` resource in GCP.

Reference: [Terraform Registry – project_access_approval_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_access_approval_settings)

---

## 1. Argument Reference

### `enrolled_services`
- Description: (Required) A list of Google Cloud Services for which the given resource has Access Approval enrolled. Access requests for the resource given by name against any of these services contained here will be required to have explicit approval. Enrollment can only be done on an all or nothing basis. A maximum of 10 enrolled services will be enforced, to be expanded as the set of supported services is expanded. Structure is [documented below](#nested_enrolled_services).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) ID of the project of the access approval settings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notification_emails`
- Description: (Optional) A list of email addresses to which notifications relating to approval requests should be sent. Notifications relating to a resource will be sent to all emails in the settings of ancestor resources of that resource. A maximum of 50 email addresses are allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `active_key_version`
- Description: (Optional) The asymmetric crypto key version to use for signing approval requests. Empty active_key_version indicates that a Google-managed key should be used for signing. This property will be ignored if set by an ancestor of the resource, and new non-empty values may not be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional, Deprecated) Project id. ~> **Warning:** `project` is deprecated and will be removed in a future major release. Use `project_id` instead. <a name="nested_enrolled_services"></a>The `enrolled_services` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_product`
- Description: (Required) The product for which Access Approval will be enrolled. Allowed values are listed (case-sensitive): all appengine.googleapis.com bigquery.googleapis.com bigtable.googleapis.com cloudkms.googleapis.com compute.googleapis.com dataflow.googleapis.com iam.googleapis.com pubsub.googleapis.com storage.googleapis.com
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enrollment_level`
- Description: (Optional) The enrollment level of the service. Default value is `BLOCK_ALL`. Possible values are: `BLOCK_ALL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
