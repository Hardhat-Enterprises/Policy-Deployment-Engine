## 🛡️ Policy Deployment Engine: `google_project`

This section provides a concise policy evaluation for the `google_project` resource in GCP.

Reference: [Terraform Registry – google_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `project_id` |  | none | None | None |
| `org_id` | Changing this forces a new project to be created.  Only one of `org_id` or `folder_id` may be specified. If the `org_id` is specified then the project is created at the top level. Changing this forces the project to be migrated to the newly specified organization. | none | None | None |
| `folder_id` | created under. Only one of `org_id` or `folder_id` may be specified. If the `folder_id` is specified, then the project is created under the specified folder. Changing this forces the project to be migrated to the newly specified folder. | none | None | None |
| `billing_account` | belongs to. The user or service account performing this operation with Terraform must have at minimum Billing Account User privileges (`roles/billing.user`) on the billing account. See [Google Cloud Billing API Access Control](https://cloud.google.com/billing/docs/how-to/billing-access) for more details. | none | None | None |
| `labels` | **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource. | none | None | None |
| `terraform_labels` | The combination of labels configured directly on the resource and default labels configured on the provider. | none | None | None |
| `effective_labels` | All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. | none | None | None |
| `auto_create_network` | to `true`, where it is created. If set to `false`, the default network will still be created by GCP but will be deleted immediately by Terraform. Therefore, for quota purposes, you will still need to have 1 network slot available to create the project successfully, even if you set `auto_create_network` to `false`. Note that when `false`, Terraform enables `compute.googleapis.com` on the project to interact with the GCE API and currently leaves it enabled. | none | None | None |
| `deletion_policy` | against any destroy actions caused by a terraform apply or terraform destroy. Setting ABANDON allows the resource to be abandoned rather than deleted, i.e., the Terraform resource can be deleted without deleting the Project via the Google API. Possible values are: "PREVENT", "ABANDON", "DELETE". Default value is `PREVENT`. | none | None | None |
| `tags` |  | none | None | None |
