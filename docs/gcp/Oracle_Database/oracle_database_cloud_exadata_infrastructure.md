## 🛡️ Policy Deployment Engine: `oracle_database_cloud_exadata_infrastructure`

This section provides a concise policy evaluation for the `oracle_database_cloud_exadata_infrastructure` resource in GCP.

Reference: [Terraform Registry – oracle_database_cloud_exadata_infrastructure](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/oracle_database_cloud_exadata_infrastructure)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Resource ID segment making up resource `name`. See documentation for resource type `oracledatabase.googleapis.com/DbServer`. | true | None | None |
| `cloud_exadata_infrastructure_id` | The ID of the Exadata Infrastructure to create. This value is restricted to (^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$) and must be a maximum of 63 characters in length. The value must start with a letter and end with a letter or a number. | true | None | None |
| `display_name` | User friendly name for this resource. | false | None | None |
| `gcp_oracle_zone` | GCP location where Oracle Exadata is hosted. | false | None | None |
| `labels` | Labels or tags associated with the resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_protection` |  | none | None | None |

### properties Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ocid` | (Output) OCID of created infra. https://docs.oracle.com/en-us/iaas/Content/General/Concepts/identifiers.htm#Oracle | none | None | None |
| `compute_count` | The number of compute servers for the Exadata Infrastructure. | false | None | None |
| `storage_count` | The number of Cloud Exadata storage servers for the Exadata Infrastructure. | false | None | None |
| `total_storage_size_gb` | The total storage allocated to the Exadata Infrastructure resource, in gigabytes (GB). | false | None | None |
| `available_storage_size_gb` | (Output) The available storage can be allocated to the Exadata Infrastructure resource, in gigabytes (GB). | none | None | None |
| `maintenance_window` | Maintenance window as defined by Oracle. https://docs.oracle.com/en-us/iaas/api/#/en/database/20160918/datatypes/MaintenanceWindow Structure is [documented below](#nested_properties_maintenance_window). | false | None | None |
| `state` | (Output) The current lifecycle state of the Exadata Infrastructure. Possible values: STATE_UNSPECIFIED PROVISIONING AVAILABLE UPDATING TERMINATING TERMINATED FAILED MAINTENANCE_IN_PROGRESS | none | None | None |
| `shape` | The shape of the Exadata Infrastructure. The shape determines the amount of CPU, storage, and memory resources allocated to the instance. | true | None | None |
| `oci_url` | (Output) Deep link to the OCI console to view this resource. | none | None | None |
| `cpu_count` | (Output) The number of enabled CPU cores. | none | None | None |
| `max_cpu_count` | (Output) The total number of CPU cores available. | none | None | None |
| `memory_size_gb` | (Output) The memory allocated in GBs. | none | None | None |
| `max_memory_gb` | (Output) The total memory available in GBs. | none | None | None |
| `db_node_storage_size_gb` | (Output) The local node storage allocated in GBs. | none | None | None |
| `max_db_node_storage_size_gb` | (Output) The total local node storage available in GBs. | none | None | None |
| `data_storage_size_tb` | (Output) Size, in terabytes, of the DATA disk group. | none | None | None |
| `max_data_storage_tb` | (Output) The total available DATA disk group size. | none | None | None |
| `activated_storage_count` | (Output) The requested number of additional storage servers activated for the Exadata Infrastructure. | none | None | None |
| `additional_storage_count` | (Output) The requested number of additional storage servers for the Exadata Infrastructure. | none | None | None |
| `db_server_version` | (Output) The software version of the database servers (dom0) in the Exadata Infrastructure. | none | None | None |
| `storage_server_version` | (Output) The software version of the storage servers (cells) in the Exadata Infrastructure. | none | None | None |
| `next_maintenance_run_id` | (Output) The OCID of the next maintenance run. | none | None | None |
| `next_maintenance_run_time` | (Output) The time when the next maintenance run will occur. | none | None | None |
| `next_security_maintenance_run_time` | (Output) The time when the next security maintenance run will occur. | none | None | None |
| `customer_contacts` | The list of customer contacts. Structure is [documented below](#nested_properties_customer_contacts). | false | None | None |
| `monthly_storage_server_version` | (Output) The monthly software version of the storage servers (cells) in the Exadata Infrastructure. Example: 20.1.15 | none | None | None |
| `monthly_db_server_version` | (Output) The monthly software version of the database servers (dom0) in the Exadata Infrastructure. Example: 20.1.15 | none | None | None |

### maintenance_window Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `preference` | The maintenance window scheduling preference. Possible values: MAINTENANCE_WINDOW_PREFERENCE_UNSPECIFIED CUSTOM_PREFERENCE NO_PREFERENCE | false | None | None |
| `months` | Months during the year when maintenance should be performed. | false | None | None |
| `weeks_of_month` | Weeks during the month when maintenance should be performed. Weeks start on the 1st, 8th, 15th, and 22nd days of the month, and have a duration of 7 days. Weeks start and end based on calendar dates, not days of the week. | false | None | None |
| `days_of_week` | Days during the week when maintenance should be performed. | false | None | None |
| `hours_of_day` | The window of hours during the day when maintenance should be performed. The window is a 4 hour slot. Valid values are: 0 - represents time slot 0:00 - 3:59 UTC 4 - represents time slot 4:00 - 7:59 UTC 8 - represents time slot 8:00 - 11:59 UTC 12 - represents time slot 12:00 - 15:59 UTC 16 - represents time slot 16:00 - 19:59 UTC 20 - represents time slot 20:00 - 23:59 UTC | false | None | None |
| `lead_time_week` | Lead time window allows user to set a lead time to prepare for a down time. The lead time is in weeks and valid value is between 1 to 4. | false | None | None |
| `patching_mode` | Cloud CloudExadataInfrastructure node patching method, either "ROLLING" or "NONROLLING". Default value is ROLLING. Possible values: PATCHING_MODE_UNSPECIFIED ROLLING NON_ROLLING | false | None | None |
| `custom_action_timeout_mins` | Determines the amount of time the system will wait before the start of each database server patching operation. Custom action timeout is in minutes and valid value is between 15 to 120 (inclusive). | false | None | None |
| `is_custom_action_timeout_enabled` | If true, enables the configuration of a custom action timeout (waiting period) between database server patching operations. | false | None | None |

### customer_contacts Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `email` | The email address used by Oracle to send notifications regarding databases and infrastructure. | true | None | None |
