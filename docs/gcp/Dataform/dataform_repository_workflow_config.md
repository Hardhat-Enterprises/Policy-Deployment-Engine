## 🛡️ Policy Deployment Engine: `dataform_repository_workflow_config`

This section provides a concise policy evaluation for the `dataform_repository_workflow_config` resource in GCP.

Reference: [Terraform Registry – dataform_repository_workflow_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataform_repository_workflow_config)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The workflow's name. | true | false | None | None | None |
| `release_config` | The name of the release config whose releaseCompilationResult should be executed. Must be in the format projects/*/locations/*/repositories/*/releaseConfigs/*. | true | false | None | None | None |
| `invocation_config` | Optional. If left unset, a default InvocationConfig will be used. Structure is [documented below](#nested_invocation_config). | false | false | None | None | None |
| `cron_schedule` | Optional. Optional schedule (in cron format) for automatic creation of compilation results. | false | false | None | None | None |
| `time_zone` | Optional. Specifies the time zone to be used when interpreting cronSchedule. Must be a time zone name from the time zone database (https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). If left unspecified, the default is UTC. | false | false | None | None | None |
| `region` | A reference to the region | false | false | None | None | None |
| `repository` | A reference to the Dataform repository | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `included_targets` |  | false | false | None | None | None |

### invocation_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `included_targets` | Optional. The set of action identifiers to include. Structure is [documented below](#nested_invocation_config_included_targets). | false | false | None | None | None |
| `included_tags` | Optional. The set of tags to include. | false | false | None | None | None |
| `transitive_dependencies_included` | Optional. When set to true, transitive dependencies of included actions will be executed. | false | false | None | None | None |
| `transitive_dependents_included` | Optional. When set to true, transitive dependents of included actions will be executed. | false | false | None | None | None |
| `fully_refresh_incremental_tables_enabled` | Optional. When set to true, any incremental tables will be fully refreshed. | false | false | None | None | None |
| `service_account` | Optional. The service account to run workflow invocations under. | false | false | None | None | None |

### included_targets Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `database` | The action's database (Google Cloud project ID). | false | false | None | None | None |
| `schema` | The action's schema (BigQuery dataset ID), within database. | false | false | None | None | None |
| `name` | The action's name, within database and schema. | false | false | None | None | None |
