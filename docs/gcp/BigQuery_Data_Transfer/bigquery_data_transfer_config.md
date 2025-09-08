## 🛡️ Policy Deployment Engine: `bigquery_data_transfer_config`

This section provides a concise policy evaluation for the `bigquery_data_transfer_config` resource in GCP.

Reference: [Terraform Registry – bigquery_data_transfer_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_data_transfer_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The user specified display name for the transfer config. | true | None | None |
| `data_source_id` | The data source id. Cannot be changed once the transfer config is created. | true | None | None |
| `params` | Parameters specific to each data source. For more information see the bq tab in the 'Setting up a data transfer' section for each data source. For example the parameters for Cloud Storage transfers are listed here: https://cloud.google.com/bigquery-transfer/docs/cloud-storage-transfer#bq **NOTE** : If you are attempting to update a parameter that cannot be updated (due to api limitations) [please force recreation of the resource](https://www.terraform.io/cli/state/taint#forcing-re-creation-of-resources). | true | None | None |
| `destination_dataset_id` | The BigQuery target dataset id. | false | None | None |
| `schedule` | Data transfer schedule. If the data source does not support a custom schedule, this should be empty. If it is empty, the default value for the data source will be used. The specified times are in UTC. Examples of valid format: 1st,3rd monday of month 15:30, every wed,fri of jan, jun 13:15, and first sunday of quarter 00:00. See more explanation about the format here: https://cloud.google.com/appengine/docs/flexible/python/scheduling-jobs-with-cron-yaml#the_schedule_format NOTE: The minimum interval time between recurring transfers depends on the data source; refer to the documentation for your data source. | false | None | None |
| `notification_pubsub_topic` | Pub/Sub topic where notifications will be sent after transfer runs associated with this transfer config finish. | false | None | None |
| `data_refresh_window_days` | The number of days to look back to automatically refresh the data. For example, if dataRefreshWindowDays = 10, then every day BigQuery reingests data for [today-10, today-1], rather than ingesting data for just [today-1]. Only valid if the data source supports the feature. Set the value to 0 to use the default value. | false | None | None |
| `disabled` | When set to true, no runs are scheduled for a given transfer. | false | None | None |
| `location` | The geographic location where the transfer config should reside. Examples: US, EU, asia-northeast1. The default value is US. | false | None | None |
| `service_account_name` | Service account email. If this field is set, transfer config will be created with this service account credentials. It requires that requesting user calling this API has permissions to act as this service account. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### schedule_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disable_auto_scheduling` | If true, automatic scheduling of data transfer runs for this configuration will be disabled. The runs can be started on ad-hoc basis using transferConfigs.startManualRuns API. When automatic scheduling is disabled, the TransferConfig.schedule field will be ignored. | false | None | None |
| `start_time` | Specifies time to start scheduling transfer runs. The first run will be scheduled at or after the start time according to a recurrence pattern defined in the schedule string. The start time can be changed at any moment. The time when a data transfer can be triggered manually is not limited by this option. | false | None | None |
| `end_time` | Defines time to stop scheduling transfer runs. A transfer run cannot be scheduled at or after the end time. The end time can be changed at any moment. The time when a data transfer can be triggered manually is not limited by this option. | false | None | None |

### email_preferences Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_failure_email` | If true, email notifications will be sent on transfer run failures. | true | None | None |

### encryption_configuration Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_name` | The name of the KMS key used for encrypting BigQuery data. ## Ephemeral Attributes Reference The following write-only attributes are supported: | true | None | None |

### sensitive_params Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_access_key_wo` | The Secret Access Key of the AWS account transferring data from. **Note**: This property is write-only and will not be read from the API. | false | None | None |
