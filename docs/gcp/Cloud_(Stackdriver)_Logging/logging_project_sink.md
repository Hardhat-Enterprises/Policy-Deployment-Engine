## 🛡️ Policy Deployment Engine: `logging_project_sink`

This section provides a concise policy evaluation for the `logging_project_sink` resource in GCP.

Reference: [Terraform Registry – logging_project_sink](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_sink)

---

## 1. Argument Reference

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination`
- Description: - `storage.googleapis.com/[GCS_BUCKET]` - `bigquery.googleapis.com/projects/[PROJECT_ID]/datasets/[DATASET]` - `pubsub.googleapis.com/projects/[PROJECT_ID]/topics/[TOPIC_ID]` - `logging.googleapis.com/projects/[PROJECT_ID]/locations/global/buckets/[BUCKET_ID]` - `logging.googleapis.com/projects/[PROJECT_ID]` The writer associated with the sink must have access to write to the above resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: See [Advanced Log Filters](https://cloud.google.com/logging/docs/view/advanced_filters) for information on how to write a filter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `unique_writer_identity`
- Description: then a unique service account is created and used for this sink. If you wish to publish logs across projects or utilize `bigquery_options`, you must set `unique_writer_identity` to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_writer_identity`
- Description: the log entries. The format must be `serviceAccount:some@email`. This field can only be specified if you are routing logs to a destination outside this sink's project. If not specified, a Logging service account will automatically be generated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bigquery_options`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclusions`
- Description: <a name="nested_bigquery_options"></a>The `bigquery_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_partitioned_tables`
- Description: By default, Logging creates dated tables based on the log entries' timestamps, e.g. `syslog_20170523`. With partitioned tables the date suffix is no longer present and [special query syntax](https://cloud.google.com/bigquery/docs/querying-partitioned-tables) has to be used instead. In both cases, tables are sharded based on UTC timezone. <a name="nested_exclusions"></a>The `exclusions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

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

### `filter`
- Description: write a filter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
