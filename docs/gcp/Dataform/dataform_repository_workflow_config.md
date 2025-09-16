## 🛡️ Policy Deployment Engine: `dataform_repository_workflow_config`

This section provides a concise policy evaluation for the `dataform_repository_workflow_config` resource in GCP.

Reference: [Terraform Registry – dataform_repository_workflow_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataform_repository_workflow_config)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The workflow's name. | true | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
| `release_config` | The name of the release config whose releaseCompilationResult should be executed. Must be in the format projects/*/locations/*/repositories/*/releaseConfigs/*. | true | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
| `invocation_config` | Optional. If left unset, a default InvocationConfig will be used. Structure is [documented below](#nested_invocation_config). | false | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
| `cron_schedule` | Optional. Optional schedule (in cron format) for automatic creation of compilation results. | false | true | Automated scheduling can introduce security risks if not properly configured and monitored. | 0 2 * * * | * * * * * |
| `time_zone` | Optional. Specifies the time zone to be used when interpreting cronSchedule. Must be a time zone name from the time zone database (https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). If left unspecified, the default is UTC. | false | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
| `region` | A reference to the region | false | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
| `repository` | A reference to the Dataform repository | false | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
| `project` | If it is not provided, the provider project is used. | false | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
| `included_targets` | The set of action identifiers to include in the workflow. | false | false | This argument does not affect data security, only metadata or operational configuration. |  |  |

### invocation_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `included_targets` | Optional. The set of action identifiers to include. Structure is [documented below](#nested_invocation_config_included_targets). | false | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
| `included_tags` | Optional. The set of tags to include. | false | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
| `transitive_dependencies_included` | Optional. When set to true, transitive dependencies of included actions will be executed. | false | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
| `transitive_dependents_included` | Optional. When set to true, transitive dependents of included actions will be executed. | false | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
| `fully_refresh_incremental_tables_enabled` | Optional. When set to true, any incremental tables will be fully refreshed. | false | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
| `service_account` | Optional. The service account to run workflow invocations under. | false | true | Service accounts control access permissions and must be properly configured to follow principle of least privilege. | dataform-workflow@my-project.iam.gserviceaccount.com | compute@developer.gserviceaccount.com |

### included_targets Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `database` | The action's database (Google Cloud project ID). | false | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
| `schema` | The action's schema (BigQuery dataset ID), within database. | false | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
| `name` | The action's name, within database and schema. | false | false | This argument does not affect data security, only metadata or operational configuration. |  |  |
