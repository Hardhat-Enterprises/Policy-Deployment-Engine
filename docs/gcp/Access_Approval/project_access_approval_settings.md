## 🛡️ Policy Deployment Engine: `project_access_approval_settings`

This section provides a concise policy evaluation for the `project_access_approval_settings` resource in GCP.

Reference: [Terraform Registry – project_access_approval_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_access_approval_settings)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | ID of the project of the access approval settings. | true | None | None |
| `notification_emails` | A list of email addresses to which notifications relating to approval requests should be sent. Notifications relating to a resource will be sent to all emails in the settings of ancestor resources of that resource. A maximum of 50 email addresses are allowed. | false | None | None |
| `active_key_version` | The asymmetric crypto key version to use for signing approval requests. Empty active_key_version indicates that a Google-managed key should be used for signing. This property will be ignored if set by an ancestor of the resource, and new non-empty values may not be set. | false | None | None |
| `project` | , Deprecated) Project id. ~> **Warning:** `project` is deprecated and will be removed in a future major release. Use `project_id` instead. | false | None | None |

### enrolled_services Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cloud_product` | The product for which Access Approval will be enrolled. Allowed values are listed (case-sensitive): all appengine.googleapis.com bigquery.googleapis.com bigtable.googleapis.com cloudkms.googleapis.com compute.googleapis.com dataflow.googleapis.com iam.googleapis.com pubsub.googleapis.com storage.googleapis.com | true | None | None |
| `enrollment_level` | The enrollment level of the service. Default value is `BLOCK_ALL`. Possible values are: `BLOCK_ALL`. | false | None | None |
