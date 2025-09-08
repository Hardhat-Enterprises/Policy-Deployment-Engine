## 🛡️ Policy Deployment Engine: `logging_organization_sink`

This section provides a concise policy evaluation for the `logging_organization_sink` resource in GCP.

Reference: [Terraform Registry – logging_organization_sink](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_organization_sink)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `org_id` |  | none | None | None |
| `destination` | - `storage.googleapis.com/[GCS_BUCKET]` - `bigquery.googleapis.com/projects/[PROJECT_ID]/datasets/[DATASET]` - `pubsub.googleapis.com/projects/[PROJECT_ID]/topics/[TOPIC_ID]` - `logging.googleapis.com/projects/[PROJECT_ID]/locations/global/buckets/[BUCKET_ID]` - `logging.googleapis.com/projects/[PROJECT_ID]` The writer associated with the sink must have access to write to the above resource. | none | None | None |
| `filter` | See [Advanced Log Filters](https://cloud.google.com/logging/docs/view/advanced_filters) for information on how to write a filter. | none | None | None |
| `description` |  | none | None | None |
| `disabled` |  | none | None | None |
| `include_children` | associated with child projects are also exported; otherwise only logs relating to the provided organization are included. | none | None | None |
| `intercept_children` | match with sinks in child resources, except _Required sinks. This sink will be visible to child resources when listing sinks. | none | None | None |

### bigquery_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `use_partitioned_tables` | By default, Logging creates dated tables based on the log entries' timestamps, e.g. syslog_20170523. With partitioned tables the date suffix is no longer present and [special query syntax](https://cloud.google.com/bigquery/docs/querying-partitioned-tables) has to be used instead. In both cases, tables are sharded based on UTC timezone. | none | None | None |

### exclusions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `description` |  | none | None | None |
| `filter` | write a filter. | none | None | None |
| `disabled` |  | none | None | None |
