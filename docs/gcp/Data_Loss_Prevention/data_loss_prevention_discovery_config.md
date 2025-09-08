## 🛡️ Policy Deployment Engine: `data_loss_prevention_discovery_config`

This section provides a concise policy evaluation for the `data_loss_prevention_discovery_config` resource in GCP.

Reference: [Terraform Registry – data_loss_prevention_discovery_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_loss_prevention_discovery_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | The parent of the discovery config in any of the following formats: * `projects/{{project}}/locations/{{location}}` * `organizations/{{organization_id}}/locations/{{location}}` | true | None | None |
| `display_name` | Display Name (max 1000 Chars) | false | None | None |
| `inspect_templates` | Detection logic for profile generation | false | None | None |
| `status` | Required. A status for this configuration Possible values are: `RUNNING`, `PAUSED`. | false | None | None |

### location Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `organization_id` | The ID of an organization to scan | false | None | None |
| `folder_id` | The ID for the folder within an organization to scan | false | None | None |

### org_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | The project that will run the scan. The DLP service account that exists within this project must have access to all resources that are profiled, and the cloud DLP API must be enabled. | false | None | None |
| `location` | The data to scan folder org or project Structure is [documented below](#nested_org_config_location). | false | None | None |

### actions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `export_data` | Export data profiles into a provided location Structure is [documented below](#nested_actions_actions_export_data). | false | None | None |
| `pub_sub_notification` | Publish a message into the Pub/Sub topic. Structure is [documented below](#nested_actions_actions_pub_sub_notification). | false | None | None |
| `tag_resources` | Publish a message into the Pub/Sub topic. Structure is [documented below](#nested_actions_actions_tag_resources). | false | None | None |

### targets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `big_query_target` | BigQuery target for Discovery. The first target to match a table will be the one applied. Structure is [documented below](#nested_targets_targets_big_query_target). | false | None | None |
| `cloud_sql_target` | Cloud SQL target for Discovery. The first target to match a table will be the one applied. Structure is [documented below](#nested_targets_targets_cloud_sql_target). | false | None | None |
| `secrets_target` | Discovery target that looks for credentials and secrets stored in cloud resource metadata and reports them as vulnerabilities to Security Command Center. Only one target of this type is allowed. | false | None | None |
| `cloud_storage_target` | Cloud Storage target for Discovery. The first target to match a bucket will be the one applied. Structure is [documented below](#nested_targets_targets_cloud_storage_target). | false | None | None |

### export_data Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `profile_table` | Store all table and column profiles in an existing table or a new table in an existing dataset. Each re-generation will result in a new row in BigQuery Structure is [documented below](#nested_actions_actions_export_data_profile_table). | false | None | None |

### profile_table Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | The Google Cloud Platform project ID of the project containing the table. If omitted, the project ID is inferred from the API call. | false | None | None |
| `dataset_id` | Dataset Id of the table | false | None | None |
| `table_id` | Name of the table | false | None | None |

### pub_sub_notification Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `topic` | Cloud Pub/Sub topic to send notifications to. Format is projects/{project}/topics/{topic}. | false | None | None |
| `event` | The type of event that triggers a Pub/Sub. At most one PubSubNotification per EventType is permitted. Possible values are: `NEW_PROFILE`, `CHANGED_PROFILE`, `SCORE_INCREASED`, `ERROR_CHANGED`. | false | None | None |
| `pubsub_condition` | Conditions for triggering pubsub Structure is [documented below](#nested_actions_actions_pub_sub_notification_pubsub_condition). | false | None | None |
| `detail_of_message` | How much data to include in the pub/sub message. Possible values are: `TABLE_PROFILE`, `RESOURCE_NAME`. | false | None | None |

### pubsub_condition Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expressions` | An expression Structure is [documented below](#nested_actions_actions_pub_sub_notification_pubsub_condition_expressions). | false | None | None |

### expressions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `logical_operator` | The operator to apply to the collection of conditions Possible values are: `OR`, `AND`. | false | None | None |
| `conditions` | Conditions to apply to the expression Structure is [documented below](#nested_actions_actions_pub_sub_notification_pubsub_condition_expressions_conditions). | false | None | None |

### conditions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `minimum_risk_score` | The minimum data risk score that triggers the condition. Possible values are: `HIGH`, `MEDIUM_OR_HIGH`. | false | None | None |
| `minimum_sensitivity_score` | The minimum sensitivity level that triggers the condition. Possible values are: `HIGH`, `MEDIUM_OR_HIGH`. | false | None | None |
| `created_after` | File store must have been created after this date. Used to avoid backfilling. A timestamp in RFC3339 UTC "Zulu" format with nanosecond resolution and upto nine fractional digits. | false | None | None |
| `or_conditions` | At least one of the conditions must be true for a table to be scanned. Structure is [documented below](#nested_targets_targets_big_query_target_conditions_or_conditions). | false | None | None |
| `types` | Data profiles will only be generated for the database resource types specified in this field. If not specified, defaults to [DATABASE_RESOURCE_TYPE_ALL_SUPPORTED_TYPES]. Each value may be one of: `DATABASE_RESOURCE_TYPE_ALL_SUPPORTED_TYPES`, `DATABASE_RESOURCE_TYPE_TABLE`. | false | None | None |
| `type_collection` | Restrict discovery to categories of table types. Currently view, materialized view, snapshot and non-biglake external tables are supported. Possible values are: `BIG_QUERY_COLLECTION_ALL_TYPES`, `BIG_QUERY_COLLECTION_ONLY_SUPPORTED_TYPES`. | false | None | None |
| `database_engines` | Database engines that should be profiled. Optional. Defaults to ALL_SUPPORTED_DATABASE_ENGINES if unspecified. Each value may be one of: `ALL_SUPPORTED_DATABASE_ENGINES`, `MYSQL`, `POSTGRES`. | false | None | None |
| `min_age` | Duration format. Minimum age a file store must have. If set, the value must be 1 hour or greater. | false | None | None |
| `cloud_storage_conditions` | Cloud Storage conditions. Structure is [documented below](#nested_targets_targets_cloud_storage_target_conditions_cloud_storage_conditions). | false | None | None |

### tag_resources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `tag_conditions` | The tags to associate with different conditions. Structure is [documented below](#nested_actions_actions_tag_resources_tag_conditions). | false | None | None |
| `profile_generations_to_tag` | The profile generations for which the tag should be attached to resources. If you attach a tag to only new profiles, then if the sensitivity score of a profile subsequently changes, its tag doesn't change. By default, this field includes only new profiles. To include both new and updated profiles for tagging, this field should explicitly include both `PROFILE_GENERATION_NEW` and `PROFILE_GENERATION_UPDATE`. Each value may be one of: `PROFILE_GENERATION_NEW`, `PROFILE_GENERATION_UPDATE`. | false | None | None |
| `lower_data_risk_to_low` | Whether applying a tag to a resource should lower the risk of the profile for that resource. For example, in conjunction with an [IAM deny policy](https://cloud.google.com/iam/docs/deny-overview), you can deny all principals a permission if a tag value is present, mitigating the risk of the resource. This also lowers the data risk of resources at the lower levels of the resource hierarchy. For example, reducing the data risk of a table data profile also reduces the data risk of the constituent column data profiles. | false | None | None |

### tag_conditions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `tag` | The tag value to attach to resources. Structure is [documented below](#nested_actions_actions_tag_resources_tag_conditions_tag_conditions_tag). | false | None | None |
| `sensitivity_score` | Conditions attaching the tag to a resource on its profile having this sensitivity score. Structure is [documented below](#nested_actions_actions_tag_resources_tag_conditions_tag_conditions_sensitivity_score). | false | None | None |

### tag Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `namespaced_value` | The namespaced name for the tag value to attach to resources. Must be in the format `{parent_id}/{tag_key_short_name}/{short_name}`, for example, "123456/environment/prod". | false | None | None |

### sensitivity_score Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `score` | The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. | true | None | None |

### big_query_target Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `filter` | Required. The tables the discovery cadence applies to. The first target with a matching filter will be the one to apply to a table Structure is [documented below](#nested_targets_targets_big_query_target_filter). | false | None | None |
| `conditions` | In addition to matching the filter, these conditions must be true before a profile is generated Structure is [documented below](#nested_targets_targets_big_query_target_conditions). | false | None | None |
| `cadence` | How often and when to update profiles. New tables that match both the fiter and conditions are scanned as quickly as possible depending on system capacity. Structure is [documented below](#nested_targets_targets_big_query_target_cadence). | false | None | None |
| `disabled` | Tables that match this filter will not have profiles created. | false | None | None |

### filter Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `tables` | A specific set of tables for this filter to apply to. A table collection must be specified in only one filter per config. Structure is [documented below](#nested_targets_targets_big_query_target_filter_tables). | false | None | None |
| `other_tables` | Catch-all. This should always be the last filter in the list because anything above it will apply first. | false | None | None |
| `table_reference` | The table to scan. Discovery configurations including this can only include one DiscoveryTarget (the DiscoveryTarget with this TableReference). Structure is [documented below](#nested_targets_targets_big_query_target_filter_table_reference). | false | None | None |
| `collection` | A specific set of buckets for this filter to apply to. Structure is [documented below](#nested_targets_targets_cloud_storage_target_filter_collection). | false | None | None |
| `others` | Match discovery resources not covered by any other filter. | false | None | None |
| `database_resource_reference` | The database resource to scan. Targets including this can only include one target (the target with this database resource reference). Structure is [documented below](#nested_targets_targets_cloud_sql_target_filter_database_resource_reference). | false | None | None |
| `cloud_storage_resource_reference` | The bucket to scan. Targets including this can only include one target (the target with this bucket). This enables profiling the contents of a single bucket, while the other options allow for easy profiling of many buckets within a project or an organization. Structure is [documented below](#nested_targets_targets_cloud_storage_target_filter_cloud_storage_resource_reference). | false | None | None |

### tables Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `include_regexes` | A collection of regular expressions to match a BQ table against. Structure is [documented below](#nested_targets_targets_big_query_target_filter_tables_include_regexes). | false | None | None |

### include_regexes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `patterns` | The group of regular expression patterns to match against one or more file stores. Maximum of 100 entries. The sum of all lengths of regular expressions can't exceed 10 KiB. Structure is [documented below](#nested_targets_targets_cloud_storage_target_filter_collection_include_regexes_patterns). | false | None | None |

### patterns Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id_regex` | For organizations, if unset, will match all projects. Has no effect for data profile configurations created within a project. | false | None | None |
| `dataset_id_regex` | if unset, this property matches all datasets | false | None | None |
| `table_id_regex` | if unset, this property matches all tables | false | None | None |
| `instance_regex` | Regex to test the instance name against. If empty, all instances match. | false | None | None |
| `database_regex` | Regex to test the database name against. If empty, all databases match. | false | None | None |
| `database_resource_name_regex` | Regex to test the database resource's name against. An example of a database resource name is a table's name. Other database resource names like view names could be included in the future. If empty, all database resources match.' | false | None | None |
| `cloud_storage_regex` | Regex for Cloud Storage. Structure is [documented below](#nested_targets_targets_cloud_storage_target_filter_collection_include_regexes_patterns_patterns_cloud_storage_regex). | false | None | None |

### table_reference Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataset_id` | Dataset ID of the table. | true | None | None |
| `table_id` | Name of the table. | true | None | None |

### or_conditions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `min_age` | Duration format. The minimum age a table must have before Cloud DLP can profile it. Value greater than 1. | false | None | None |
| `min_row_count` | Minimum number of rows that should be present before Cloud DLP profiles as a table. | false | None | None |

### types Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `types` | A set of BiqQuery table types Each value may be one of: `BIG_QUERY_TABLE_TYPE_TABLE`, `BIG_QUERY_TABLE_TYPE_EXTERNAL_BIG_LAKE`. | false | None | None |

### cadence Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `schema_modified_cadence` | Governs when to update data profiles when a schema is modified Structure is [documented below](#nested_targets_targets_big_query_target_cadence_schema_modified_cadence). | false | None | None |
| `table_modified_cadence` | Governs when to update profile when a table is modified. Structure is [documented below](#nested_targets_targets_big_query_target_cadence_table_modified_cadence). | false | None | None |
| `inspect_template_modified_cadence` | Governs when to update data profiles when the inspection rules defined by the `InspectTemplate` change. If not set, changing the template will not cause a data profile to update. Structure is [documented below](#nested_targets_targets_big_query_target_cadence_inspect_template_modified_cadence). | false | None | None |

### schema_modified_cadence Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `types` | The types of schema modifications to consider. Defaults to NEW_COLUMNS. Each value may be one of: `NEW_COLUMNS`, `REMOVED_COLUMNS`. | false | None | None |
| `frequency` | Frequency to regenerate data profiles when the schema is modified. Defaults to monthly. Possible values are: `UPDATE_FREQUENCY_NEVER`, `UPDATE_FREQUENCY_DAILY`, `UPDATE_FREQUENCY_MONTHLY`. | false | None | None |

### table_modified_cadence Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `types` | The type of events to consider when deciding if the table has been modified and should have the profile updated. Defaults to MODIFIED_TIMESTAMP Each value may be one of: `TABLE_MODIFIED_TIMESTAMP`. | false | None | None |
| `frequency` | How frequently data profiles can be updated when tables are modified. Defaults to never. Possible values are: `UPDATE_FREQUENCY_NEVER`, `UPDATE_FREQUENCY_DAILY`, `UPDATE_FREQUENCY_MONTHLY`. | false | None | None |

### inspect_template_modified_cadence Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `frequency` | How frequently data profiles can be updated when the template is modified. Defaults to never. Possible values are: `UPDATE_FREQUENCY_NEVER`, `UPDATE_FREQUENCY_DAILY`, `UPDATE_FREQUENCY_MONTHLY`. | false | None | None |

### cloud_sql_target Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `filter` | Required. The tables the discovery cadence applies to. The first target with a matching filter will be the one to apply to a table. Structure is [documented below](#nested_targets_targets_cloud_sql_target_filter). | true | None | None |
| `conditions` | In addition to matching the filter, these conditions must be true before a profile is generated. Structure is [documented below](#nested_targets_targets_cloud_sql_target_conditions). | false | None | None |
| `generation_cadence` | How often and when to update profiles. New tables that match both the filter and conditions are scanned as quickly as possible depending on system capacity. Structure is [documented below](#nested_targets_targets_cloud_sql_target_generation_cadence). | false | None | None |
| `disabled` | Disable profiling for database resources that match this filter. | false | None | None |

### collection Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `include_regexes` | A collection of regular expressions to match a file store against. Structure is [documented below](#nested_targets_targets_cloud_storage_target_filter_collection_include_regexes). | false | None | None |

### database_resource_reference Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | Required. If within a project-level config, then this must match the config's project ID. | true | None | None |
| `instance` | Required. The instance where this resource is located. For example: Cloud SQL instance ID. | true | None | None |
| `database` | Required. Name of a database within the instance. | true | None | None |
| `database_resource` | Required. Name of a database resource, for example, a table within the database. | true | None | None |

### generation_cadence Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `schema_modified_cadence` | Governs when to update data profiles when a schema is modified Structure is [documented below](#nested_targets_targets_cloud_sql_target_generation_cadence_schema_modified_cadence). | false | None | None |
| `refresh_frequency` | Data changes in Cloud Storage can't trigger reprofiling. If you set this field, profiles are refreshed at this frequency regardless of whether the underlying buckets have changes. Defaults to never. Possible values are: `UPDATE_FREQUENCY_NEVER`, `UPDATE_FREQUENCY_DAILY`, `UPDATE_FREQUENCY_MONTHLY`. | false | None | None |
| `inspect_template_modified_cadence` | Governs when to update data profiles when the inspection rules defined by the `InspectTemplate` change. If not set, changing the template will not cause a data profile to update. Structure is [documented below](#nested_targets_targets_cloud_storage_target_generation_cadence_inspect_template_modified_cadence). | false | None | None |

### cloud_storage_target Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `filter` | The buckets the generation_cadence applies to. The first target with a matching filter will be the one to apply to a bucket. Structure is [documented below](#nested_targets_targets_cloud_storage_target_filter). | true | None | None |
| `conditions` | In addition to matching the filter, these conditions must be true before a profile is generated. Structure is [documented below](#nested_targets_targets_cloud_storage_target_conditions). | false | None | None |
| `generation_cadence` | How often and when to update profiles. New buckets that match both the filter and conditions are scanned as quickly as possible depending on system capacity. Structure is [documented below](#nested_targets_targets_cloud_storage_target_generation_cadence). | false | None | None |
| `disabled` | Disable profiling for buckets that match this filter. | false | None | None |

### cloud_storage_regex Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id_regex` | For organizations, if unset, will match all projects. | false | None | None |
| `bucket_name_regex` | Regex to test the bucket name against. If empty, all buckets match. Example: "marketing2021" or "(marketing)\d{4}" will both match the bucket gs://marketing2021 | false | None | None |

### cloud_storage_resource_reference Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket_name` | The bucket to scan. | false | None | None |
| `project_id` | If within a project-level config, then this must match the config's project id. | false | None | None |

### cloud_storage_conditions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `included_object_attributes` | Only objects with the specified attributes will be scanned. If an object has one of the specified attributes but is inside an excluded bucket, it will not be scanned. Defaults to [ALL_SUPPORTED_OBJECTS]. A profile will be created even if no objects match the included_object_attributes. Each value may be one of: `ALL_SUPPORTED_OBJECTS`, `STANDARD`, `NEARLINE`, `COLDLINE`, `ARCHIVE`, `REGIONAL`, `MULTI_REGIONAL`, `DURABLE_REDUCED_AVAILABILITY`. | false | None | None |
| `included_bucket_attributes` | Only objects with the specified attributes will be scanned. Defaults to [ALL_SUPPORTED_BUCKETS] if unset. Each value may be one of: `ALL_SUPPORTED_BUCKETS`, `AUTOCLASS_DISABLED`, `AUTOCLASS_ENABLED`. | false | None | None |
