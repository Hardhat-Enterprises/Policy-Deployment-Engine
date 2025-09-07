## 🛡️ Policy Deployment Engine: `oracle_database_cloud_exadata_infrastructure`

This section provides a concise policy evaluation for the `oracle_database_cloud_exadata_infrastructure` resource in GCP.

Reference: [Terraform Registry – oracle_database_cloud_exadata_infrastructure](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/oracle_database_cloud_exadata_infrastructure)

---

## 1. Argument Reference

### `location`
- Description: (Required) Resource ID segment making up resource `name`. See documentation for resource type `oracledatabase.googleapis.com/DbServer`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_exadata_infrastructure_id`
- Description: (Required) The ID of the Exadata Infrastructure to create. This value is restricted to (^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$) and must be a maximum of 63 characters in length. The value must start with a letter and end with a letter or a number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User friendly name for this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcp_oracle_zone`
- Description: (Optional) GCP location where Oracle Exadata is hosted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) Various properties of Exadata Infrastructure. Structure is [documented below](#nested_properties).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels or tags associated with the resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: <a name="nested_properties"></a>The `properties` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ocid`
- Description: (Output) OCID of created infra. https://docs.oracle.com/en-us/iaas/Content/General/Concepts/identifiers.htm#Oracle
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `compute_count`
- Description: (Optional) The number of compute servers for the Exadata Infrastructure.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_count`
- Description: (Optional) The number of Cloud Exadata storage servers for the Exadata Infrastructure.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `total_storage_size_gb`
- Description: (Optional) The total storage allocated to the Exadata Infrastructure resource, in gigabytes (GB).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `available_storage_size_gb`
- Description: (Output) The available storage can be allocated to the Exadata Infrastructure resource, in gigabytes (GB).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_window`
- Description: (Optional) Maintenance window as defined by Oracle. https://docs.oracle.com/en-us/iaas/api/#/en/database/20160918/datatypes/MaintenanceWindow Structure is [documented below](#nested_properties_maintenance_window).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) The current lifecycle state of the Exadata Infrastructure. Possible values: STATE_UNSPECIFIED PROVISIONING AVAILABLE UPDATING TERMINATING TERMINATED FAILED MAINTENANCE_IN_PROGRESS
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shape`
- Description: (Required) The shape of the Exadata Infrastructure. The shape determines the amount of CPU, storage, and memory resources allocated to the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oci_url`
- Description: (Output) Deep link to the OCI console to view this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_count`
- Description: (Output) The number of enabled CPU cores.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_cpu_count`
- Description: (Output) The total number of CPU cores available.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory_size_gb`
- Description: (Output) The memory allocated in GBs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_memory_gb`
- Description: (Output) The total memory available in GBs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `db_node_storage_size_gb`
- Description: (Output) The local node storage allocated in GBs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_db_node_storage_size_gb`
- Description: (Output) The total local node storage available in GBs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_storage_size_tb`
- Description: (Output) Size, in terabytes, of the DATA disk group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_data_storage_tb`
- Description: (Output) The total available DATA disk group size.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `activated_storage_count`
- Description: (Output) The requested number of additional storage servers activated for the Exadata Infrastructure.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_storage_count`
- Description: (Output) The requested number of additional storage servers for the Exadata Infrastructure.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `db_server_version`
- Description: (Output) The software version of the database servers (dom0) in the Exadata Infrastructure.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_server_version`
- Description: (Output) The software version of the storage servers (cells) in the Exadata Infrastructure.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `next_maintenance_run_id`
- Description: (Output) The OCID of the next maintenance run.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `next_maintenance_run_time`
- Description: (Output) The time when the next maintenance run will occur.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `next_security_maintenance_run_time`
- Description: (Output) The time when the next security maintenance run will occur.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `customer_contacts`
- Description: (Optional) The list of customer contacts. Structure is [documented below](#nested_properties_customer_contacts).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monthly_storage_server_version`
- Description: (Output) The monthly software version of the storage servers (cells) in the Exadata Infrastructure. Example: 20.1.15
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monthly_db_server_version`
- Description: (Output) The monthly software version of the database servers (dom0) in the Exadata Infrastructure. Example: 20.1.15 <a name="nested_properties_maintenance_window"></a>The `maintenance_window` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preference`
- Description: (Optional) The maintenance window scheduling preference. Possible values: MAINTENANCE_WINDOW_PREFERENCE_UNSPECIFIED CUSTOM_PREFERENCE NO_PREFERENCE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `months`
- Description: (Optional) Months during the year when maintenance should be performed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weeks_of_month`
- Description: (Optional) Weeks during the month when maintenance should be performed. Weeks start on the 1st, 8th, 15th, and 22nd days of the month, and have a duration of 7 days. Weeks start and end based on calendar dates, not days of the week.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `days_of_week`
- Description: (Optional) Days during the week when maintenance should be performed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours_of_day`
- Description: (Optional) The window of hours during the day when maintenance should be performed. The window is a 4 hour slot. Valid values are: 0 - represents time slot 0:00 - 3:59 UTC 4 - represents time slot 4:00 - 7:59 UTC 8 - represents time slot 8:00 - 11:59 UTC 12 - represents time slot 12:00 - 15:59 UTC 16 - represents time slot 16:00 - 19:59 UTC 20 - represents time slot 20:00 - 23:59 UTC
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lead_time_week`
- Description: (Optional) Lead time window allows user to set a lead time to prepare for a down time. The lead time is in weeks and valid value is between 1 to 4.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `patching_mode`
- Description: (Optional) Cloud CloudExadataInfrastructure node patching method, either "ROLLING" or "NONROLLING". Default value is ROLLING. Possible values: PATCHING_MODE_UNSPECIFIED ROLLING NON_ROLLING
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_action_timeout_mins`
- Description: (Optional) Determines the amount of time the system will wait before the start of each database server patching operation. Custom action timeout is in minutes and valid value is between 15 to 120 (inclusive).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_custom_action_timeout_enabled`
- Description: (Optional) If true, enables the configuration of a custom action timeout (waiting period) between database server patching operations. <a name="nested_properties_customer_contacts"></a>The `customer_contacts` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Required) The email address used by Oracle to send notifications regarding databases and infrastructure.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
