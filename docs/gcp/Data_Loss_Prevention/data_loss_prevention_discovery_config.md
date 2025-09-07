## 🛡️ Policy Deployment Engine: `data_loss_prevention_discovery_config`

This section provides a concise policy evaluation for the `data_loss_prevention_discovery_config` resource in GCP.

Reference: [Terraform Registry – data_loss_prevention_discovery_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_loss_prevention_discovery_config)

---

## 1. Argument Reference

### `parent`
- Description: (Required) The parent of the discovery config in any of the following formats:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Location to create the discovery config in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Display Name (max 1000 Chars)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_config`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_org_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inspect_templates`
- Description: (Optional) Detection logic for profile generation
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `actions`
- Description: (Optional) Actions to execute at the completion of scanning Structure is [documented below](#nested_actions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `targets`
- Description: (Optional) Target to match against for determining what to scan and how frequently Structure is [documented below](#nested_targets).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `status`
- Description: (Optional) Required. A status for this configuration Possible values are: `RUNNING`, `PAUSED`. <a name="nested_org_config"></a>The `org_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) The project that will run the scan. The DLP service account that exists within this project must have access to all resources that are profiled, and the cloud DLP API must be enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The data to scan folder org or project Structure is [documented below](#nested_org_config_location). <a name="nested_org_config_location"></a>The `location` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `organization_id`
- Description: (Optional) The ID of an organization to scan
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `folder_id`
- Description: (Optional) The ID for the folder within an organization to scan <a name="nested_actions"></a>The `actions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `export_data`
- Description: (Optional) Export data profiles into a provided location Structure is [documented below](#nested_actions_actions_export_data).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pub_sub_notification`
- Description: (Optional) Publish a message into the Pub/Sub topic. Structure is [documented below](#nested_actions_actions_pub_sub_notification).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag_resources`
- Description: (Optional) Publish a message into the Pub/Sub topic. Structure is [documented below](#nested_actions_actions_tag_resources). <a name="nested_actions_actions_export_data"></a>The `export_data` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `profile_table`
- Description: (Optional) Store all table and column profiles in an existing table or a new table in an existing dataset. Each re-generation will result in a new row in BigQuery Structure is [documented below](#nested_actions_actions_export_data_profile_table). <a name="nested_actions_actions_export_data_profile_table"></a>The `profile_table` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) The Google Cloud Platform project ID of the project containing the table. If omitted, the project ID is inferred from the API call.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Optional) Dataset Id of the table
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Optional) Name of the table <a name="nested_actions_actions_pub_sub_notification"></a>The `pub_sub_notification` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topic`
- Description: (Optional) Cloud Pub/Sub topic to send notifications to. Format is projects/{project}/topics/{topic}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event`
- Description: (Optional) The type of event that triggers a Pub/Sub. At most one PubSubNotification per EventType is permitted. Possible values are: `NEW_PROFILE`, `CHANGED_PROFILE`, `SCORE_INCREASED`, `ERROR_CHANGED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pubsub_condition`
- Description: (Optional) Conditions for triggering pubsub Structure is [documented below](#nested_actions_actions_pub_sub_notification_pubsub_condition).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `detail_of_message`
- Description: (Optional) How much data to include in the pub/sub message. Possible values are: `TABLE_PROFILE`, `RESOURCE_NAME`. <a name="nested_actions_actions_pub_sub_notification_pubsub_condition"></a>The `pubsub_condition` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expressions`
- Description: (Optional) An expression Structure is [documented below](#nested_actions_actions_pub_sub_notification_pubsub_condition_expressions). <a name="nested_actions_actions_pub_sub_notification_pubsub_condition_expressions"></a>The `expressions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logical_operator`
- Description: (Optional) The operator to apply to the collection of conditions Possible values are: `OR`, `AND`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conditions`
- Description: (Optional) Conditions to apply to the expression Structure is [documented below](#nested_actions_actions_pub_sub_notification_pubsub_condition_expressions_conditions). <a name="nested_actions_actions_pub_sub_notification_pubsub_condition_expressions_conditions"></a>The `conditions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minimum_risk_score`
- Description: (Optional) The minimum data risk score that triggers the condition. Possible values are: `HIGH`, `MEDIUM_OR_HIGH`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minimum_sensitivity_score`
- Description: (Optional) The minimum sensitivity level that triggers the condition. Possible values are: `HIGH`, `MEDIUM_OR_HIGH`. <a name="nested_actions_actions_tag_resources"></a>The `tag_resources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag_conditions`
- Description: (Optional) The tags to associate with different conditions. Structure is [documented below](#nested_actions_actions_tag_resources_tag_conditions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `profile_generations_to_tag`
- Description: (Optional) The profile generations for which the tag should be attached to resources. If you attach a tag to only new profiles, then if the sensitivity score of a profile subsequently changes, its tag doesn't change. By default, this field includes only new profiles. To include both new and updated profiles for tagging, this field should explicitly include both `PROFILE_GENERATION_NEW` and `PROFILE_GENERATION_UPDATE`. Each value may be one of: `PROFILE_GENERATION_NEW`, `PROFILE_GENERATION_UPDATE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lower_data_risk_to_low`
- Description: (Optional) Whether applying a tag to a resource should lower the risk of the profile for that resource. For example, in conjunction with an [IAM deny policy](https://cloud.google.com/iam/docs/deny-overview), you can deny all principals a permission if a tag value is present, mitigating the risk of the resource. This also lowers the data risk of resources at the lower levels of the resource hierarchy. For example, reducing the data risk of a table data profile also reduces the data risk of the constituent column data profiles. <a name="nested_actions_actions_tag_resources_tag_conditions"></a>The `tag_conditions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag`
- Description: (Optional) The tag value to attach to resources. Structure is [documented below](#nested_actions_actions_tag_resources_tag_conditions_tag_conditions_tag).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sensitivity_score`
- Description: (Optional) Conditions attaching the tag to a resource on its profile having this sensitivity score. Structure is [documented below](#nested_actions_actions_tag_resources_tag_conditions_tag_conditions_sensitivity_score). <a name="nested_actions_actions_tag_resources_tag_conditions_tag_conditions_tag"></a>The `tag` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespaced_value`
- Description: (Optional) The namespaced name for the tag value to attach to resources. Must be in the format `{parent_id}/{tag_key_short_name}/{short_name}`, for example, "123456/environment/prod". <a name="nested_actions_actions_tag_resources_tag_conditions_tag_conditions_sensitivity_score"></a>The `sensitivity_score` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score`
- Description: (Required) The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. <a name="nested_targets"></a>The `targets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `big_query_target`
- Description: (Optional) BigQuery target for Discovery. The first target to match a table will be the one applied. Structure is [documented below](#nested_targets_targets_big_query_target).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_sql_target`
- Description: (Optional) Cloud SQL target for Discovery. The first target to match a table will be the one applied. Structure is [documented below](#nested_targets_targets_cloud_sql_target).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secrets_target`
- Description: (Optional) Discovery target that looks for credentials and secrets stored in cloud resource metadata and reports them as vulnerabilities to Security Command Center. Only one target of this type is allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_target`
- Description: (Optional) Cloud Storage target for Discovery. The first target to match a bucket will be the one applied. Structure is [documented below](#nested_targets_targets_cloud_storage_target). <a name="nested_targets_targets_big_query_target"></a>The `big_query_target` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Optional) Required. The tables the discovery cadence applies to. The first target with a matching filter will be the one to apply to a table Structure is [documented below](#nested_targets_targets_big_query_target_filter).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conditions`
- Description: (Optional) In addition to matching the filter, these conditions must be true before a profile is generated Structure is [documented below](#nested_targets_targets_big_query_target_conditions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cadence`
- Description: (Optional) How often and when to update profiles. New tables that match both the fiter and conditions are scanned as quickly as possible depending on system capacity. Structure is [documented below](#nested_targets_targets_big_query_target_cadence).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Tables that match this filter will not have profiles created. <a name="nested_targets_targets_big_query_target_filter"></a>The `filter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tables`
- Description: (Optional) A specific set of tables for this filter to apply to. A table collection must be specified in only one filter per config. Structure is [documented below](#nested_targets_targets_big_query_target_filter_tables).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `other_tables`
- Description: (Optional) Catch-all. This should always be the last filter in the list because anything above it will apply first.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_reference`
- Description: (Optional) The table to scan. Discovery configurations including this can only include one DiscoveryTarget (the DiscoveryTarget with this TableReference). Structure is [documented below](#nested_targets_targets_big_query_target_filter_table_reference). <a name="nested_targets_targets_big_query_target_filter_tables"></a>The `tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_regexes`
- Description: (Optional) A collection of regular expressions to match a BQ table against. Structure is [documented below](#nested_targets_targets_big_query_target_filter_tables_include_regexes). <a name="nested_targets_targets_big_query_target_filter_tables_include_regexes"></a>The `include_regexes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `patterns`
- Description: (Optional) A single BigQuery regular expression pattern to match against one or more tables, datasets, or projects that contain BigQuery tables. Structure is [documented below](#nested_targets_targets_big_query_target_filter_tables_include_regexes_patterns). <a name="nested_targets_targets_big_query_target_filter_tables_include_regexes_patterns"></a>The `patterns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id_regex`
- Description: (Optional) For organizations, if unset, will match all projects. Has no effect for data profile configurations created within a project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id_regex`
- Description: (Optional) if unset, this property matches all datasets
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id_regex`
- Description: (Optional) if unset, this property matches all tables <a name="nested_targets_targets_big_query_target_filter_table_reference"></a>The `table_reference` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) Dataset ID of the table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Required) Name of the table. <a name="nested_targets_targets_big_query_target_conditions"></a>The `conditions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `created_after`
- Description: (Optional) A timestamp in RFC3339 UTC "Zulu" format with nanosecond resolution and upto nine fractional digits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `or_conditions`
- Description: (Optional) At least one of the conditions must be true for a table to be scanned. Structure is [documented below](#nested_targets_targets_big_query_target_conditions_or_conditions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `types`
- Description: (Optional) Restrict discovery to specific table type Structure is [documented below](#nested_targets_targets_big_query_target_conditions_types).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type_collection`
- Description: (Optional) Restrict discovery to categories of table types. Currently view, materialized view, snapshot and non-biglake external tables are supported. Possible values are: `BIG_QUERY_COLLECTION_ALL_TYPES`, `BIG_QUERY_COLLECTION_ONLY_SUPPORTED_TYPES`. <a name="nested_targets_targets_big_query_target_conditions_or_conditions"></a>The `or_conditions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_age`
- Description: (Optional) Duration format. The minimum age a table must have before Cloud DLP can profile it. Value greater than 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_row_count`
- Description: (Optional) Minimum number of rows that should be present before Cloud DLP profiles as a table. <a name="nested_targets_targets_big_query_target_conditions_types"></a>The `types` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `types`
- Description: (Optional) A set of BiqQuery table types Each value may be one of: `BIG_QUERY_TABLE_TYPE_TABLE`, `BIG_QUERY_TABLE_TYPE_EXTERNAL_BIG_LAKE`. <a name="nested_targets_targets_big_query_target_cadence"></a>The `cadence` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema_modified_cadence`
- Description: (Optional) Governs when to update data profiles when a schema is modified Structure is [documented below](#nested_targets_targets_big_query_target_cadence_schema_modified_cadence).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_modified_cadence`
- Description: (Optional) Governs when to update profile when a table is modified. Structure is [documented below](#nested_targets_targets_big_query_target_cadence_table_modified_cadence).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inspect_template_modified_cadence`
- Description: (Optional) Governs when to update data profiles when the inspection rules defined by the `InspectTemplate` change. If not set, changing the template will not cause a data profile to update. Structure is [documented below](#nested_targets_targets_big_query_target_cadence_inspect_template_modified_cadence). <a name="nested_targets_targets_big_query_target_cadence_schema_modified_cadence"></a>The `schema_modified_cadence` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `types`
- Description: (Optional) The type of events to consider when deciding if the table's schema has been modified and should have the profile updated. Defaults to NEW_COLUMN. Each value may be one of: `SCHEMA_NEW_COLUMNS`, `SCHEMA_REMOVED_COLUMNS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `frequency`
- Description: (Optional) How frequently profiles may be updated when schemas are modified. Default to monthly Possible values are: `UPDATE_FREQUENCY_NEVER`, `UPDATE_FREQUENCY_DAILY`, `UPDATE_FREQUENCY_MONTHLY`. <a name="nested_targets_targets_big_query_target_cadence_table_modified_cadence"></a>The `table_modified_cadence` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `types`
- Description: (Optional) The type of events to consider when deciding if the table has been modified and should have the profile updated. Defaults to MODIFIED_TIMESTAMP Each value may be one of: `TABLE_MODIFIED_TIMESTAMP`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `frequency`
- Description: (Optional) How frequently data profiles can be updated when tables are modified. Defaults to never. Possible values are: `UPDATE_FREQUENCY_NEVER`, `UPDATE_FREQUENCY_DAILY`, `UPDATE_FREQUENCY_MONTHLY`. <a name="nested_targets_targets_big_query_target_cadence_inspect_template_modified_cadence"></a>The `inspect_template_modified_cadence` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `frequency`
- Description: (Optional) How frequently data profiles can be updated when the template is modified. Defaults to never. Possible values are: `UPDATE_FREQUENCY_NEVER`, `UPDATE_FREQUENCY_DAILY`, `UPDATE_FREQUENCY_MONTHLY`. <a name="nested_targets_targets_cloud_sql_target"></a>The `cloud_sql_target` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Required) Required. The tables the discovery cadence applies to. The first target with a matching filter will be the one to apply to a table. Structure is [documented below](#nested_targets_targets_cloud_sql_target_filter).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conditions`
- Description: (Optional) In addition to matching the filter, these conditions must be true before a profile is generated. Structure is [documented below](#nested_targets_targets_cloud_sql_target_conditions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation_cadence`
- Description: (Optional) How often and when to update profiles. New tables that match both the filter and conditions are scanned as quickly as possible depending on system capacity. Structure is [documented below](#nested_targets_targets_cloud_sql_target_generation_cadence).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Disable profiling for database resources that match this filter. <a name="nested_targets_targets_cloud_sql_target_filter"></a>The `filter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `collection`
- Description: (Optional) A specific set of database resources for this filter to apply to. Structure is [documented below](#nested_targets_targets_cloud_sql_target_filter_collection).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `others`
- Description: (Optional) Catch-all. This should always be the last target in the list because anything above it will apply first. Should only appear once in a configuration. If none is specified, a default one will be added automatically.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_resource_reference`
- Description: (Optional) The database resource to scan. Targets including this can only include one target (the target with this database resource reference). Structure is [documented below](#nested_targets_targets_cloud_sql_target_filter_database_resource_reference). <a name="nested_targets_targets_cloud_sql_target_filter_collection"></a>The `collection` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_regexes`
- Description: (Optional) A collection of regular expressions to match a database resource against. Structure is [documented below](#nested_targets_targets_cloud_sql_target_filter_collection_include_regexes). <a name="nested_targets_targets_cloud_sql_target_filter_collection_include_regexes"></a>The `include_regexes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `patterns`
- Description: (Optional) A group of regular expression patterns to match against one or more database resources. Maximum of 100 entries. The sum of all regular expressions' length can't exceed 10 KiB. Structure is [documented below](#nested_targets_targets_cloud_sql_target_filter_collection_include_regexes_patterns). <a name="nested_targets_targets_cloud_sql_target_filter_collection_include_regexes_patterns"></a>The `patterns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id_regex`
- Description: (Optional) For organizations, if unset, will match all projects. Has no effect for data profile configurations created within a project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_regex`
- Description: (Optional) Regex to test the instance name against. If empty, all instances match.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_regex`
- Description: (Optional) Regex to test the database name against. If empty, all databases match.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_resource_name_regex`
- Description: (Optional) Regex to test the database resource's name against. An example of a database resource name is a table's name. Other database resource names like view names could be included in the future. If empty, all database resources match.' <a name="nested_targets_targets_cloud_sql_target_filter_database_resource_reference"></a>The `database_resource_reference` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) Required. If within a project-level config, then this must match the config's project ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Required) Required. The instance where this resource is located. For example: Cloud SQL instance ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database`
- Description: (Required) Required. Name of a database within the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_resource`
- Description: (Required) Required. Name of a database resource, for example, a table within the database. <a name="nested_targets_targets_cloud_sql_target_conditions"></a>The `conditions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_engines`
- Description: (Optional) Database engines that should be profiled. Optional. Defaults to ALL_SUPPORTED_DATABASE_ENGINES if unspecified. Each value may be one of: `ALL_SUPPORTED_DATABASE_ENGINES`, `MYSQL`, `POSTGRES`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `types`
- Description: (Optional) Data profiles will only be generated for the database resource types specified in this field. If not specified, defaults to [DATABASE_RESOURCE_TYPE_ALL_SUPPORTED_TYPES]. Each value may be one of: `DATABASE_RESOURCE_TYPE_ALL_SUPPORTED_TYPES`, `DATABASE_RESOURCE_TYPE_TABLE`. <a name="nested_targets_targets_cloud_sql_target_generation_cadence"></a>The `generation_cadence` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema_modified_cadence`
- Description: (Optional) Governs when to update data profiles when a schema is modified Structure is [documented below](#nested_targets_targets_cloud_sql_target_generation_cadence_schema_modified_cadence).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `refresh_frequency`
- Description: (Optional) Data changes (non-schema changes) in Cloud SQL tables can't trigger reprofiling. If you set this field, profiles are refreshed at this frequency regardless of whether the underlying tables have changes. Defaults to never. Possible values are: `UPDATE_FREQUENCY_NEVER`, `UPDATE_FREQUENCY_DAILY`, `UPDATE_FREQUENCY_MONTHLY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inspect_template_modified_cadence`
- Description: (Optional) Governs when to update data profiles when the inspection rules defined by the `InspectTemplate` change. If not set, changing the template will not cause a data profile to update. Structure is [documented below](#nested_targets_targets_cloud_sql_target_generation_cadence_inspect_template_modified_cadence). <a name="nested_targets_targets_cloud_sql_target_generation_cadence_schema_modified_cadence"></a>The `schema_modified_cadence` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `types`
- Description: (Optional) The types of schema modifications to consider. Defaults to NEW_COLUMNS. Each value may be one of: `NEW_COLUMNS`, `REMOVED_COLUMNS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `frequency`
- Description: (Optional) Frequency to regenerate data profiles when the schema is modified. Defaults to monthly. Possible values are: `UPDATE_FREQUENCY_NEVER`, `UPDATE_FREQUENCY_DAILY`, `UPDATE_FREQUENCY_MONTHLY`. <a name="nested_targets_targets_cloud_sql_target_generation_cadence_inspect_template_modified_cadence"></a>The `inspect_template_modified_cadence` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `frequency`
- Description: (Required) How frequently data profiles can be updated when the template is modified. Defaults to never. Possible values are: `UPDATE_FREQUENCY_NEVER`, `UPDATE_FREQUENCY_DAILY`, `UPDATE_FREQUENCY_MONTHLY`. <a name="nested_targets_targets_cloud_storage_target"></a>The `cloud_storage_target` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Required) The buckets the generation_cadence applies to. The first target with a matching filter will be the one to apply to a bucket. Structure is [documented below](#nested_targets_targets_cloud_storage_target_filter).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conditions`
- Description: (Optional) In addition to matching the filter, these conditions must be true before a profile is generated. Structure is [documented below](#nested_targets_targets_cloud_storage_target_conditions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation_cadence`
- Description: (Optional) How often and when to update profiles. New buckets that match both the filter and conditions are scanned as quickly as possible depending on system capacity. Structure is [documented below](#nested_targets_targets_cloud_storage_target_generation_cadence).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Disable profiling for buckets that match this filter. <a name="nested_targets_targets_cloud_storage_target_filter"></a>The `filter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `collection`
- Description: (Optional) A specific set of buckets for this filter to apply to. Structure is [documented below](#nested_targets_targets_cloud_storage_target_filter_collection).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_resource_reference`
- Description: (Optional) The bucket to scan. Targets including this can only include one target (the target with this bucket). This enables profiling the contents of a single bucket, while the other options allow for easy profiling of many buckets within a project or an organization. Structure is [documented below](#nested_targets_targets_cloud_storage_target_filter_cloud_storage_resource_reference).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `others`
- Description: (Optional) Match discovery resources not covered by any other filter. <a name="nested_targets_targets_cloud_storage_target_filter_collection"></a>The `collection` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_regexes`
- Description: (Optional) A collection of regular expressions to match a file store against. Structure is [documented below](#nested_targets_targets_cloud_storage_target_filter_collection_include_regexes). <a name="nested_targets_targets_cloud_storage_target_filter_collection_include_regexes"></a>The `include_regexes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `patterns`
- Description: (Optional) The group of regular expression patterns to match against one or more file stores. Maximum of 100 entries. The sum of all lengths of regular expressions can't exceed 10 KiB. Structure is [documented below](#nested_targets_targets_cloud_storage_target_filter_collection_include_regexes_patterns). <a name="nested_targets_targets_cloud_storage_target_filter_collection_include_regexes_patterns"></a>The `patterns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_regex`
- Description: (Optional) Regex for Cloud Storage. Structure is [documented below](#nested_targets_targets_cloud_storage_target_filter_collection_include_regexes_patterns_patterns_cloud_storage_regex). <a name="nested_targets_targets_cloud_storage_target_filter_collection_include_regexes_patterns_patterns_cloud_storage_regex"></a>The `cloud_storage_regex` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id_regex`
- Description: (Optional) For organizations, if unset, will match all projects.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_name_regex`
- Description: (Optional) Regex to test the bucket name against. If empty, all buckets match. Example: "marketing2021" or "(marketing)\d{4}" will both match the bucket gs://marketing2021 <a name="nested_targets_targets_cloud_storage_target_filter_cloud_storage_resource_reference"></a>The `cloud_storage_resource_reference` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_name`
- Description: (Optional) The bucket to scan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) If within a project-level config, then this must match the config's project id. <a name="nested_targets_targets_cloud_storage_target_conditions"></a>The `conditions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `created_after`
- Description: (Optional) File store must have been created after this date. Used to avoid backfilling. A timestamp in RFC3339 UTC "Zulu" format with nanosecond resolution and upto nine fractional digits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_age`
- Description: (Optional) Duration format. Minimum age a file store must have. If set, the value must be 1 hour or greater.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_conditions`
- Description: (Optional) Cloud Storage conditions. Structure is [documented below](#nested_targets_targets_cloud_storage_target_conditions_cloud_storage_conditions). <a name="nested_targets_targets_cloud_storage_target_conditions_cloud_storage_conditions"></a>The `cloud_storage_conditions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_object_attributes`
- Description: (Optional) Only objects with the specified attributes will be scanned. If an object has one of the specified attributes but is inside an excluded bucket, it will not be scanned. Defaults to [ALL_SUPPORTED_OBJECTS]. A profile will be created even if no objects match the included_object_attributes. Each value may be one of: `ALL_SUPPORTED_OBJECTS`, `STANDARD`, `NEARLINE`, `COLDLINE`, `ARCHIVE`, `REGIONAL`, `MULTI_REGIONAL`, `DURABLE_REDUCED_AVAILABILITY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_bucket_attributes`
- Description: (Optional) Only objects with the specified attributes will be scanned. Defaults to [ALL_SUPPORTED_BUCKETS] if unset. Each value may be one of: `ALL_SUPPORTED_BUCKETS`, `AUTOCLASS_DISABLED`, `AUTOCLASS_ENABLED`. <a name="nested_targets_targets_cloud_storage_target_generation_cadence"></a>The `generation_cadence` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `refresh_frequency`
- Description: (Optional) Data changes in Cloud Storage can't trigger reprofiling. If you set this field, profiles are refreshed at this frequency regardless of whether the underlying buckets have changes. Defaults to never. Possible values are: `UPDATE_FREQUENCY_NEVER`, `UPDATE_FREQUENCY_DAILY`, `UPDATE_FREQUENCY_MONTHLY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inspect_template_modified_cadence`
- Description: (Optional) Governs when to update data profiles when the inspection rules defined by the `InspectTemplate` change. If not set, changing the template will not cause a data profile to update. Structure is [documented below](#nested_targets_targets_cloud_storage_target_generation_cadence_inspect_template_modified_cadence). <a name="nested_targets_targets_cloud_storage_target_generation_cadence_inspect_template_modified_cadence"></a>The `inspect_template_modified_cadence` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `frequency`
- Description: (Optional) How frequently data profiles can be updated when the template is modified. Defaults to never. Possible values are: `UPDATE_FREQUENCY_NEVER`, `UPDATE_FREQUENCY_DAILY`, `UPDATE_FREQUENCY_MONTHLY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
