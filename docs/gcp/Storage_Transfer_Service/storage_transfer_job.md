## 🛡️ Policy Deployment Engine: `storage_transfer_job`

This section provides a concise policy evaluation for the `storage_transfer_job` resource in GCP.

Reference: [Terraform Registry – storage_transfer_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_transfer_job)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `description` | A description for the Storage Transfer job. | false | false | The description is informational and does not directly affect the security posture of the transfer job. | daily-secure-transfer-job | None |
| `status` | The status of the transfer job. | false | true | Transfer jobs should be intentionally enabled or disabled to match operational and governance requirements. | ENABLED | Unexpectedly disabled or unmanaged status. |
| `schedule` | Defines when the Storage Transfer job runs. | false | true | A defined schedule supports controlled and expected execution of data transfers. | A schedule with an approved start date and run time. | No defined schedule where one is required by policy. |
| `transfer_spec` | Defines the source, sink, and transfer behavior for the Storage Transfer job. | true | true | The transfer specification controls what data is moved, from where, and under what restrictions. | A transfer_spec with approved source settings, approved agent pool usage, and safe transfer options. | A transfer_spec that omits required restrictions or uses unsafe transfer options. |

### transfer_spec Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source_agent_pool_name` | Specifies the agent pool used for agent-based source transfers. | false | true | Agent pools control where transfer agents run and should reference approved managed pools only. | source_agent_pool_name = "transferJobs/agentPools/approved-pool" | source_agent_pool_name = "transferJobs/agentPools/unapproved-pool" |
| `aws_s3_data_source` | Specifies an Amazon S3 bucket as the source for the transfer job. | false | true | Using an S3 source introduces external data into the transfer job and should be restricted to approved buckets and approved AWS access settings. | aws_s3_data_source using an approved bucket and approved role ARN. | aws_s3_data_source using an unapproved bucket or missing/unapproved role ARN. |
| `transfer_options` | Defines transfer behavior options such as overwrite and deletion behavior. | false | true | Transfer options can directly affect data integrity and source data preservation during transfers. | transfer_options with safe overwrite behavior and without destructive source deletion. | transfer_options that overwrite unsafely or delete source objects after transfer. |

###   aws_s3_data_source Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `role_arn` | The AWS IAM role ARN used to access the Amazon S3 source. | false | true | The role ARN controls what AWS permissions are used to read from the source bucket. Using the wrong role can grant excessive access or allow use of an unapproved source identity. | arn:aws:iam::123456789012:role/approved-storage-transfer-role | arn:aws:iam::123456789012:role/admin or a missing/unapproved role ARN. |

###   transfer_options Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `delete_objects_from_source_after_transfer` | Whether objects are deleted from the source after they are transferred. | false | true | Deleting source objects after transfer is destructive and can create data loss or recovery risks if used inappropriately. | delete_objects_from_source_after_transfer = false | delete_objects_from_source_after_transfer = true |
  | `overwrite_when` | Specifies when objects at the destination may be overwritten during transfer. | false | true | Overwrite behavior affects destination data integrity and should be limited to approved settings to prevent unintended replacement of data. | overwrite_when set to the approved policy value. | overwrite_when set to an unapproved or overly permissive value. |
