## 🛡️ Policy Deployment Engine: `folder_access_approval_settings`

This section provides a concise policy evaluation for the `folder_access_approval_settings` resource in GCP.

Reference: [Terraform Registry – folder_access_approval_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_access_approval_settings)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enrolled_services` | A list of Google Cloud Services for which the given resource has Access Approval enrolled. Access requests for the resource given by name against any of these services contained here will be required to have explicit approval. Enrollment can only be done on an all or nothing basis. A maximum of 10 enrolled services will be enforced, to be expanded as the set of supported services is expanded. Structure is [documented below](#nested_enrolled_services). | true | false | None | None | None |
| `folder_id` | ID of the folder of the access approval settings. | false | false | Folder id has no impact on the security of the resource. | None | None |
| `notification_emails` | A list of email addresses to which notifications relating to approval requests should be sent. Notifications relating to a resource will be sent to all emails in the settings of ancestor resources of that resource. A maximum of 50 email addresses are allowed. | false | false | Notification emails has no impact on the security of the resource. | None | None |
| `active_key_version` | The asymmetric crypto key version to use for signing approval requests. Empty active_key_version indicates that a Google-managed key should be used for signing. This property will be ignored if set by an ancestor of the resource, and new non-empty values may not be set. | false | false | Active key version has no impact on the security of the resource. | None | None |

### enrolled_services Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cloud_product` | The product for which Access Approval will be enrolled. Allowed values are listed (case-sensitive): * all * App Engine * BigQuery * Cloud Bigtable * Cloud Key Management Service * Compute Engine * Cloud Dataflow * Cloud Identity and Access Management * Cloud Pub/Sub * Cloud Storage * Persistent Disk Note: These values are supported as input, but considered a legacy format: * all * appengine.googleapis.com * bigquery.googleapis.com * bigtable.googleapis.com * cloudkms.googleapis.com * compute.googleapis.com * dataflow.googleapis.com * iam.googleapis.com * pubsub.googleapis.com * storage.googleapis.com | true | false | Allow access to Google services | Set cloud_product to all | Other cloud product types are invalidated |
| `enrollment_level` | The enrollment level of the service. Default value is `BLOCK_ALL`. Possible values are: `BLOCK_ALL`. | true | false | Ensure default value is already assigned to the enrollment level. | Set enrollment_level to BLOCK_ALL | Other enrollment level types are invalidated |
