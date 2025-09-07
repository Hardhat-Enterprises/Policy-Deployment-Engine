## 🛡️ Policy Deployment Engine: `bigquery_data_transfer_config`

This section provides a concise policy evaluation for the `bigquery_data_transfer_config` resource in GCP.

Reference: [Terraform Registry – bigquery_data_transfer_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_data_transfer_config)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The user specified display name for the transfer config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_source_id`
- Description: (Required) The data source id. Cannot be changed once the transfer config is created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `params`
- Description: (Required) Parameters specific to each data source. For more information see the bq tab in the 'Setting up a data transfer' section for each data source. For example the parameters for Cloud Storage transfers are listed here: https://cloud.google.com/bigquery-transfer/docs/cloud-storage-transfer#bq **NOTE** : If you are attempting to update a parameter that cannot be updated (due to api limitations) [please force recreation of the resource](https://www.terraform.io/cli/state/taint#forcing-re-creation-of-resources).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_dataset_id`
- Description: (Optional) The BigQuery target dataset id.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule`
- Description: (Optional) Data transfer schedule. If the data source does not support a custom schedule, this should be empty. If it is empty, the default value for the data source will be used. The specified times are in UTC. Examples of valid format: 1st,3rd monday of month 15:30, every wed,fri of jan, jun 13:15, and first sunday of quarter 00:00. See more explanation about the format here: https://cloud.google.com/appengine/docs/flexible/python/scheduling-jobs-with-cron-yaml#the_schedule_format NOTE: The minimum interval time between recurring transfers depends on the data source; refer to the documentation for your data source.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule_options`
- Description: (Optional) Options customizing the data transfer schedule. Structure is [documented below](#nested_schedule_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email_preferences`
- Description: (Optional) Email notifications will be sent according to these preferences to the email address of the user who owns this transfer config. Structure is [documented below](#nested_email_preferences).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notification_pubsub_topic`
- Description: (Optional) Pub/Sub topic where notifications will be sent after transfer runs associated with this transfer config finish.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_refresh_window_days`
- Description: (Optional) The number of days to look back to automatically refresh the data. For example, if dataRefreshWindowDays = 10, then every day BigQuery reingests data for [today-10, today-1], rather than ingesting data for just [today-1]. Only valid if the data source supports the feature. Set the value to 0 to use the default value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_configuration`
- Description: (Optional) Represents the encryption configuration for a transfer. Structure is [documented below](#nested_encryption_configuration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) When set to true, no runs are scheduled for a given transfer.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sensitive_params`
- Description: (Optional) Different parameters are configured primarily using the the `params` field on this resource. This block contains the parameters which contain secrets or passwords so that they can be marked sensitive and hidden from plan output. The name of the field, eg: secret_access_key, will be the key in the `params` map in the api request. Credentials may not be specified in both locations and will cause an error. Changing from one location to a different credential configuration in the config will require an apply to update state. Structure is [documented below](#nested_sensitive_params).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The geographic location where the transfer config should reside. Examples: US, EU, asia-northeast1. The default value is US.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_name`
- Description: (Optional) Service account email. If this field is set, transfer config will be created with this service account credentials. It requires that requesting user calling this API has permissions to act as this service account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_schedule_options"></a>The `schedule_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_auto_scheduling`
- Description: (Optional) If true, automatic scheduling of data transfer runs for this configuration will be disabled. The runs can be started on ad-hoc basis using transferConfigs.startManualRuns API. When automatic scheduling is disabled, the TransferConfig.schedule field will be ignored.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Optional) Specifies time to start scheduling transfer runs. The first run will be scheduled at or after the start time according to a recurrence pattern defined in the schedule string. The start time can be changed at any moment. The time when a data transfer can be triggered manually is not limited by this option.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_time`
- Description: (Optional) Defines time to stop scheduling transfer runs. A transfer run cannot be scheduled at or after the end time. The end time can be changed at any moment. The time when a data transfer can be triggered manually is not limited by this option. <a name="nested_email_preferences"></a>The `email_preferences` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_failure_email`
- Description: (Required) If true, email notifications will be sent on transfer run failures. <a name="nested_encryption_configuration"></a>The `encryption_configuration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Required) The name of the KMS key used for encrypting BigQuery data. ## Ephemeral Attributes Reference The following write-only attributes are supported: <a name="nested_sensitive_params"></a>The `sensitive_params` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_access_key_wo`
- Description: (Optional) The Secret Access Key of the AWS account transferring data from. **Note**: This property is write-only and will not be read from the API.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
