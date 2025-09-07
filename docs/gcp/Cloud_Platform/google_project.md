## 🛡️ Policy Deployment Engine: `google_project`

This section provides a concise policy evaluation for the `google_project` resource in GCP.

Reference: [Terraform Registry – google_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project)

---

## 1. Argument Reference

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_id`
- Description: Changing this forces a new project to be created.  Only one of `org_id` or `folder_id` may be specified. If the `org_id` is specified then the project is created at the top level. Changing this forces the project to be migrated to the newly specified organization.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `folder_id`
- Description: created under. Only one of `org_id` or `folder_id` may be specified. If the `folder_id` is specified, then the project is created under the specified folder. Changing this forces the project to be migrated to the newly specified folder.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `billing_account`
- Description: belongs to. The user or service account performing this operation with Terraform must have at minimum Billing Account User privileges (`roles/billing.user`) on the billing account. See [Google Cloud Billing API Access Control](https://cloud.google.com/billing/docs/how-to/billing-access) for more details.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `terraform_labels`
- Description: The combination of labels configured directly on the resource and default labels configured on the provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effective_labels`
- Description: All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_create_network`
- Description: to `true`, where it is created. If set to `false`, the default network will still be created by GCP but will be deleted immediately by Terraform. Therefore, for quota purposes, you will still need to have 1 network slot available to create the project successfully, even if you set `auto_create_network` to `false`. Note that when `false`, Terraform enables `compute.googleapis.com` on the project to interact with the GCE API and currently leaves it enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: against any destroy actions caused by a terraform apply or terraform destroy. Setting ABANDON allows the resource to be abandoned rather than deleted, i.e., the Terraform resource can be deleted without deleting the Project via the Google API. Possible values are: "PREVENT", "ABANDON", "DELETE". Default value is `PREVENT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
