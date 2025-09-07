## 🛡️ Policy Deployment Engine: `storage_transfer_job`

This section provides a concise policy evaluation for the `storage_transfer_job` resource in GCP.

Reference: [Terraform Registry – storage_transfer_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_transfer_job)

---

## 1. Argument Reference

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transfer_spec`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replication_spec`
- Description: - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_stream`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `status`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notification_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: <a name="nested_transfer_spec"></a>The `transfer_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_agent_pool_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sink_agent_pool_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_data_sink`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `posix_data_sink`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_conditions`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transfer_options`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_data_source`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `posix_data_source`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aws_s3_data_source`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_data_source`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `azure_blob_storage_data_source`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hdfs_data_source`
- Description: <a name="nested_replication_spec"></a>The `replication_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_data_sink`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_data_source`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_conditions`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transfer_options`
- Description: <a name="nested_schedule"></a>The `schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule_start_date`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule_end_date`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time_of_day`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repeat_interval`
- Description: <a name="nested_event_stream"></a>The `event_stream` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_stream_start_time`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_stream_expiration_time`
- Description: <a name="nested_object_conditions"></a>The `object_conditions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_time_elapsed_since_last_modification`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_time_elapsed_since_last_modification`
- Description: A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_prefixes`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_prefixes`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `last_modified_since`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `last_modified_before`
- Description: <a name="nested_transfer_options"></a>The `transfer_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `overwrite_objects_already_existing_in_sink`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_objects_unique_in_sink`
- Description: `delete_objects_from_source_after_transfer` are mutually exclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_objects_from_source_after_transfer`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `overwrite_when`
- Description: <a name="nested_gcs_data_sink"></a>The `gcs_data_sink` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: <a name="nested_gcs_data_source"></a>The `gcs_data_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: <a name="nested_posix_data_sink"></a>The `posix_data_sink` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `root_directory`
- Description: <a name="nested_posix_data_source"></a>The `posix_data_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `root_directory`
- Description: <a name="nested_hdfs_data_source"></a>The `hdfs_data_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: <a name="nested_aws_s3_data_source"></a>The `aws_s3_data_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aws_access_key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role_arn`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `managed_private_network`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloudfront_domain`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `aws_access_key` Block

### `access_key_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_access_key`
- Description: <a name="nested_http_data_source"></a>The `http_data_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `list_url`
- Description: <a name="nested_azure_blob_storage_data_source"></a>The `azure_blob_storage_data_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_account`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `credentials_secret`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `azure_credentials`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `azure_credentials` Block

### `sas_token`
- Description: <a name="nested_schedule_start_end_date"></a>The `schedule_start_date` and `schedule_end_date` blocks support:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `year`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `month`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: <a name="nested_start_time_of_day"></a>The `start_time_of_day` blocks support:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minutes`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: <a name="nested_notification_config"></a>The `notification_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pubsub_topic`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_types`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `payload_format`
- Description: <a name="nested_logging_config"></a>The `loggin_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_actions`
- Description: Each action may be one of `FIND`, `DELETE`, and `COPY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_action_states`
- Description: Each action state may be one of `SUCCEEDED`, and `FAILED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_on_prem_gcs_transfer`
- Description: Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
