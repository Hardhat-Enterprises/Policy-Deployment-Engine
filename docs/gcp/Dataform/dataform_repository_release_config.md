## 🛡️ Policy Deployment Engine: `dataform_repository_release_config`

This section provides a concise policy evaluation for the `dataform_repository_release_config` resource in GCP.

Reference: [Terraform Registry – dataform_repository_release_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataform_repository_release_config)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The release's name. | true | false | This argument does not affect data security, only metadata or operational configuration. | None | None |
| `git_commitish` | Git commit/tag/branch name at which the repository should be compiled. Must exist in the remote repository. | true | false | This argument does not affect data security, only metadata or operational configuration. | None | None |
| `cron_schedule` | Optional. Optional schedule (in cron format) for automatic creation of compilation results. | false | true | Automated scheduling can introduce security risks if not properly configured and monitored. | 0 2 * * * | * * * * * |
| `time_zone` | Optional. Specifies the time zone to be used when interpreting cronSchedule. Must be a time zone name from the time zone database (https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). If left unspecified, the default is UTC. | false | false | This argument does not affect data security, only metadata or operational configuration. | None | None |
| `code_compilation_config` | Optional. If set, fields of codeCompilationConfig override the default compilation settings that are specified in dataform.json. Structure is [documented below](#nested_code_compilation_config). | false | false | This argument does not affect data security, only metadata or operational configuration. | None | None |
| `region` | A reference to the region | false | false | This argument does not affect data security, only metadata or operational configuration. | None | None |
| `repository` | A reference to the Dataform repository | false | false | This argument does not affect data security, only metadata or operational configuration. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | This argument does not affect data security, only metadata or operational configuration. | None | None |

### code_compilation_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `default_database` | Optional. The default database (Google Cloud project ID). | false | false | This argument does not affect data security, only metadata or operational configuration. | None | None |
| `default_schema` | Optional. The default schema (BigQuery dataset ID). | false | false | This argument does not affect data security, only metadata or operational configuration. | None | None |
| `default_location` | Optional. The default BigQuery location to use. Defaults to "US". See the BigQuery docs for a full list of locations: https://cloud.google.com/bigquery/docs/locations. | false | false | This argument does not affect data security, only metadata or operational configuration. | None | None |
| `assertion_schema` | Optional. The default schema (BigQuery dataset ID) for assertions. | false | false | This argument does not affect data security, only metadata or operational configuration. | None | None |
| `vars` | Optional. User-defined variables that are made available to project code during compilation. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | false | This argument does not affect data security, only metadata or operational configuration. | None | None |
| `database_suffix` | Optional. The suffix that should be appended to all database (Google Cloud project ID) names. | false | false | This argument does not affect data security, only metadata or operational configuration. | None | None |
| `schema_suffix` | Optional. The suffix that should be appended to all schema (BigQuery dataset ID) names. | false | false | This argument does not affect data security, only metadata or operational configuration. | None | None |
| `table_prefix` | Optional. The prefix that should be prepended to all table names. | false | false | This argument does not affect data security, only metadata or operational configuration. | None | None |
