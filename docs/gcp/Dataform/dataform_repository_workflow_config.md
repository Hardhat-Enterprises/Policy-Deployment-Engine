## 🛡️ Policy Deployment Engine: `dataform_repository_workflow_config`

This section provides a concise policy evaluation for the `dataform_repository_workflow_config` resource in GCP.

Reference: [Terraform Registry – dataform_repository_workflow_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataform_repository_workflow_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The workflow's name. | true | None | None |
| `release_config` | The name of the release config whose releaseCompilationResult should be executed. Must be in the format projects/*/locations/*/repositories/*/releaseConfigs/*. | true | None | None |
| `cron_schedule` | Optional. Optional schedule (in cron format) for automatic creation of compilation results. | false | None | None |
| `time_zone` | Optional. Specifies the time zone to be used when interpreting cronSchedule. Must be a time zone name from the time zone database (https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). If left unspecified, the default is UTC. | false | None | None |
| `region` | A reference to the region | false | None | None |
| `repository` | A reference to the Dataform repository | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### invocation_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `included_targets` | Optional. The set of action identifiers to include. Structure is [documented below](#nested_invocation_config_included_targets). | false | None | None |
| `included_tags` | Optional. The set of tags to include. | false | None | None |
| `transitive_dependencies_included` | Optional. When set to true, transitive dependencies of included actions will be executed. | false | None | None |
| `transitive_dependents_included` | Optional. When set to true, transitive dependents of included actions will be executed. | false | None | None |
| `fully_refresh_incremental_tables_enabled` | Optional. When set to true, any incremental tables will be fully refreshed. | false | None | None |
| `service_account` | Optional. The service account to run workflow invocations under. | false | None | None |

### included_targets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `database` | The action's database (Google Cloud project ID). | false | None | None |
| `schema` | The action's schema (BigQuery dataset ID), within database. | false | None | None |
| `name` | The action's name, within database and schema. | false | None | None |
