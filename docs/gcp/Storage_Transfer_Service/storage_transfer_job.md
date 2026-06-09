## 🛡️ Policy Deployment Engine: `storage_transfer_job`

This section provides a concise policy evaluation for the `storage_transfer_job` resource in GCP.

Reference: [Terraform Registry – storage_transfer_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_transfer_job)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `description` | A description for the Storage Transfer job. | false | false | The description is informational metadata and does not directly control access, transfer permissions, overwrite behavior, or source deletion. | approved-storage-transfer-job | None |
| `project` | The Google Cloud project where the Storage Transfer job is created. | false | true | The project determines where the transfer job runs and which Google Cloud environment owns the job. Using an approved project helps prevent transfer jobs from being created in unauthorized environments. | my-project-123 | unapproved-project |
| `status` | The status of the transfer job. | false | true | The status controls whether a transfer job is enabled, disabled, or deleted. Jobs should be intentionally configured to match operational and governance requirements. | ENABLED | Unexpectedly enabled, disabled, or unmanaged status. |
| `schedule` | Defines when the Storage Transfer job runs. | false | true | A defined schedule supports controlled and predictable transfer execution. Uncontrolled schedules may cause transfers to run at unintended times. | A schedule with an approved start date and transfer interval. | A missing, unexpected, or unapproved schedule where scheduling controls are required. |
| `transfer_spec` | Defines the source, destination, and behavior of the Storage Transfer job. | true | true | The transfer specification controls where data is transferred from, where it is transferred to, which identities are used, and whether potentially destructive transfer options are enabled. | A transfer_spec using approved source settings, approved agent pool usage, approved AWS IAM role ARN, and safe transfer options. | A transfer_spec using unapproved source settings, unapproved roles, destructive deletion, or unsafe overwrite behavior. |

### transfer_spec Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source_agent_pool_name` | The source agent pool used for agent-based transfer jobs. | false | true | The implemented policy requires transfer_spec.source_agent_pool_name to reference an approved source agent pool. Using an unapproved pool may route transfers through unmanaged or untrusted agents. | projects/my-project-123/agentPools/approved-pool | projects/my-project-123/agentPools/unapproved-pool |
| `aws_s3_data_source` | Configuration for using an Amazon S3 bucket as the transfer source. | false | true | An AWS S3 data source introduces external cloud data access into the transfer job. It should use approved buckets and approved AWS identity settings. | An aws_s3_data_source using an approved bucket and approved role ARN. | An aws_s3_data_source using an unapproved role ARN or unsafe AWS access configuration. |
| `gcs_data_sink` | Configuration for using a Google Cloud Storage bucket as the transfer destination. | false | true | The destination bucket receives transferred data. It should point to an approved storage location with appropriate access controls. | gcs_data_sink configured with an approved destination bucket. | gcs_data_sink configured with an unapproved or unintended destination bucket. |
| `transfer_options` | Options that control transfer behavior, including source deletion and destination overwrite behavior. | false | true | Transfer options can directly affect data integrity and source data preservation. Unsafe settings may delete source data or overwrite destination data unexpectedly. | transfer_options with safe overwrite behavior and source deletion disabled. | transfer_options that delete source objects after transfer or always overwrite destination objects. |

###   aws_s3_data_source Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `role_arn` | The AWS IAM role ARN used by Storage Transfer Service to access the Amazon S3 source. | false | true | The implemented policy requires transfer_spec.aws_s3_data_source.role_arn to use an approved AWS IAM role. Unapproved roles may grant excessive permissions or access unintended S3 resources. | arn:aws:iam::123456789012:role/approved-storage-transfer-role | arn:aws:iam::123456789012:role/unsafe-role |

###   transfer_options Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `delete_objects_from_source_after_transfer` | Whether source objects are deleted after they are successfully transferred. | false | true | The implemented policy blocks delete_objects_from_source_after_transfer = true because deleting source objects after transfer is destructive and can create data loss or recovery risks. | false | true |
  | `overwrite_when` | Specifies when objects in the destination may be overwritten during transfer. | false | true | The implemented policy blocks overwrite_when = ALWAYS because unconditional overwriting can replace destination data unexpectedly and affect data integrity. | DIFFERENT | ALWAYS |
