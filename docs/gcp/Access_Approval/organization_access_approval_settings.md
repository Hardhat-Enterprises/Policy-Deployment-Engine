## 🛡️ Policy Deployment Engine: `organization_access_approval_settings`

This section provides a concise policy evaluation for the `organization_access_approval_settings` resource in GCP.

Reference: [Terraform Registry – organization_access_approval_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_access_approval_settings)

---

## 1. Argument Reference

### `enrolled_services`
- Description: (Required) A list of Google Cloud Services for which the given resource has Access Approval enrolled. Access requests for the resource given by name against any of these services contained here will be required to have explicit approval. Enrollment can be done for individual services. A maximum of 10 enrolled services will be enforced, to be expanded as the set of supported services is expanded. Structure is [documented below](#nested_enrolled_services).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `organization_id`
- Description: (Required) ID of the organization of the access approval settings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notification_emails`
- Description: (Optional) A list of email addresses to which notifications relating to approval requests should be sent. Notifications relating to a resource will be sent to all emails in the settings of ancestor resources of that resource. A maximum of 50 email addresses are allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `active_key_version`
- Description: (Optional) The asymmetric crypto key version to use for signing approval requests. Empty active_key_version indicates that a Google-managed key should be used for signing. <a name="nested_enrolled_services"></a>The `enrolled_services` block supports:
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
