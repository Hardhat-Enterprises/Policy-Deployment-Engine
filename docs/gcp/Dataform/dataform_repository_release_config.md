## 🛡️ Policy Deployment Engine: `dataform_repository_release_config`

This section provides a concise policy evaluation for the `dataform_repository_release_config` resource in GCP.

Reference: [Terraform Registry – dataform_repository_release_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataform_repository_release_config)

---

## 1. Argument Reference

### `name`
- Description: (Required) The release's name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `git_commitish`
- Description: (Required) Git commit/tag/branch name at which the repository should be compiled. Must exist in the remote repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cron_schedule`
- Description: (Optional) Optional. Optional schedule (in cron format) for automatic creation of compilation results.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: (Optional) Optional. Specifies the time zone to be used when interpreting cronSchedule. Must be a time zone name from the time zone database (https://en.wikipedia.org/wiki/List_of_tz_database_time_zones). If left unspecified, the default is UTC.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `code_compilation_config`
- Description: (Optional) Optional. If set, fields of codeCompilationConfig override the default compilation settings that are specified in dataform.json. Structure is [documented below](#nested_code_compilation_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) A reference to the region
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Optional) A reference to the Dataform repository
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_code_compilation_config"></a>The `code_compilation_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_database`
- Description: (Optional) Optional. The default database (Google Cloud project ID).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_schema`
- Description: (Optional) Optional. The default schema (BigQuery dataset ID).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_location`
- Description: (Optional) Optional. The default BigQuery location to use. Defaults to "US". See the BigQuery docs for a full list of locations: https://cloud.google.com/bigquery/docs/locations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `assertion_schema`
- Description: (Optional) Optional. The default schema (BigQuery dataset ID) for assertions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vars`
- Description: (Optional) Optional. User-defined variables that are made available to project code during compilation. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_suffix`
- Description: (Optional) Optional. The suffix that should be appended to all database (Google Cloud project ID) names.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema_suffix`
- Description: (Optional) Optional. The suffix that should be appended to all schema (BigQuery dataset ID) names.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_prefix`
- Description: (Optional) Optional. The prefix that should be prepended to all table names.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
