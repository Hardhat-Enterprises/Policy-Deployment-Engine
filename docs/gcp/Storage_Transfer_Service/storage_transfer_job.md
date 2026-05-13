## 🛡️ Policy Deployment Engine: `storage_transfer_job`

This section provides a concise policy evaluation for the `storage_transfer_job` resource in GCP.

Reference: [Terraform Registry – storage_transfer_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_transfer_job)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` |  | false | false | None | None | None |
| `description` |  | false | false | None | None | None |
| `transfer_spec` |  | false | false | None | None | None |
| `replication_spec` | - - - | false | false | None | None | None |
| `schedule` |  | false | false | None | None | None |
| `event_stream` |  | false | false | None | None | None |
| `project` | is not provided, the provider project is used. | false | false | None | None | None |
| `status` |  | false | false | None | None | None |
| `notification_config` |  | false | false | None | None | None |
| `logging_config` |  | false | false | None | None | None |
| `object_conditions` |  | false | false | None | None | None |
| `transfer_options` |  | false | false | None | None | None |
| `gcs_data_sink` |  | false | false | None | None | None |
| `gcs_data_source` |  | false | false | None | None | None |
| `posix_data_sink` |  | false | false | None | None | None |
| `posix_data_source` |  | false | false | None | None | None |
| `hdfs_data_source` |  | false | false | None | None | None |
| `aws_s3_data_source` |  | false | false | None | None | None |
| `aws_access_key` |  | false | false | None | None | None |
| `http_data_source` |  | false | false | None | None | None |
| `azure_blob_storage_data_source` |  | false | false | None | None | None |
| `azure_credentials` |  | false | false | None | None | None |
| `loggin_config` |  | false | false | None | None | None |

### transfer_spec Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source_agent_pool_name` |  | false | false | None | None | None |
| `sink_agent_pool_name` |  | false | false | None | None | None |
| `gcs_data_sink` |  | false | false | None | None | None |
| `posix_data_sink` |  | false | false | None | None | None |
| `object_conditions` |  | false | false | None | None | None |
| `transfer_options` |  | false | false | None | None | None |
| `gcs_data_source` |  | false | false | None | None | None |
| `posix_data_source` |  | false | false | None | None | None |
| `aws_s3_data_source` |  | false | false | None | None | None |
| `http_data_source` |  | false | false | None | None | None |
| `azure_blob_storage_data_source` |  | false | false | None | None | None |
| `hdfs_data_source` |  | false | false | None | None | None |

### replication_spec Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `gcs_data_sink` |  | false | false | None | None | None |
| `gcs_data_source` |  | false | false | None | None | None |
| `object_conditions` |  | false | false | None | None | None |
| `transfer_options` |  | false | false | None | None | None |

### schedule Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `schedule_start_date` |  | false | false | None | None | None |
| `schedule_end_date` |  | false | false | None | None | None |
| `start_time_of_day` |  | false | false | None | None | None |
| `repeat_interval` |  | false | false | None | None | None |

### event_stream Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` |  | false | false | None | None | None |
| `event_stream_start_time` |  | false | false | None | None | None |
| `event_stream_expiration_time` |  | false | false | None | None | None |

### notification_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `pubsub_topic` |  | false | false | None | None | None |
| `event_types` |  | false | false | None | None | None |
| `payload_format` |  | false | false | None | None | None |

### object_conditions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `max_time_elapsed_since_last_modification` |  | false | false | None | None | None |
| `min_time_elapsed_since_last_modification` | A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | false | None | None | None |
| `include_prefixes` |  | false | false | None | None | None |
| `exclude_prefixes` |  | false | false | None | None | None |
| `last_modified_since` |  | false | false | None | None | None |
| `last_modified_before` |  | false | false | None | None | None |

### transfer_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `overwrite_objects_already_existing_in_sink` |  | false | false | None | None | None |
| `delete_objects_unique_in_sink` | `delete_objects_from_source_after_transfer` are mutually exclusive. | false | false | None | None | None |
| `delete_objects_from_source_after_transfer` |  | false | false | None | None | None |
| `overwrite_when` |  | false | false | None | None | None |

### gcs_data_sink Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket_name` |  | false | false | None | None | None |
| `path` |  | false | false | None | None | None |

### gcs_data_source Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket_name` |  | false | false | None | None | None |
| `path` |  | false | false | None | None | None |

### posix_data_sink Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `root_directory` |  | false | false | None | None | None |

### posix_data_source Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `root_directory` |  | false | false | None | None | None |

### hdfs_data_source Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` |  | false | false | None | None | None |

### aws_s3_data_source Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket_name` |  | false | false | None | None | None |
| `path` |  | false | false | None | None | None |
| `aws_access_key` |  | false | false | None | None | None |
| `role_arn` |  | false | false | None | None | None |
| `managed_private_network` |  | false | false | None | None | None |
| `cloudfront_domain` |  | false | false | None | None | None |

### aws_access_key Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `access_key_id` |  | false | false | None | None | None |
| `secret_access_key` |  | false | false | None | None | None |

### http_data_source Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `list_url` |  | false | false | None | None | None |

### azure_blob_storage_data_source Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `storage_account` |  | false | false | None | None | None |
| `container` |  | false | false | None | None | None |
| `path` |  | false | false | None | None | None |
| `credentials_secret` |  | false | false | None | None | None |
| `azure_credentials` |  | false | false | None | None | None |

### azure_credentials Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `sas_token` | The `schedule_start_date` and `schedule_end_date` blocks support: | false | false | None | None | None |
| `year` |  | false | false | None | None | None |
| `month` |  | false | false | None | None | None |
| `day` | The `start_time_of_day` blocks support: | false | false | None | None | None |
| `hours` |  | false | false | None | None | None |
| `minutes` |  | false | false | None | None | None |
| `seconds` |  | false | false | None | None | None |
| `nanos` |  | false | false | None | None | None |

### loggin_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `log_actions` | Each action may be one of `FIND`, `DELETE`, and `COPY`. | false | false | None | None | None |
| `log_action_states` | Each action state may be one of `SUCCEEDED`, and `FAILED`. | false | false | None | None | None |
| `enable_on_prem_gcs_transfer` | Defaults to false. | false | false | None | None | None |
