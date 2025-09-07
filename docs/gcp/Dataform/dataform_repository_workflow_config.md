## 🛡️ Policy Deployment Engine: `dataform_repository_workflow_config`

This section provides a concise policy evaluation for the `dataform_repository_workflow_config` resource in GCP.

Reference: [Terraform Registry – dataform_repository_workflow_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataform_repository_workflow_config)

---

## 1. Argument Reference

### `name`
- Description: (Required) The workflow's name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `release_config`
- Description: (Required) The name of the release config whose releaseCompilationResult should be executed. Must be in the format projects/*/locations/*/repositories/*/releaseConfigs/*.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `invocation_config`
- Description: (Optional) Optional. If left unset, a default InvocationConfig will be used. Structure is [documented below](#nested_invocation_config).
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
- Description: If it is not provided, the provider project is used. <a name="nested_invocation_config"></a>The `invocation_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_targets`
- Description: (Optional) Optional. The set of action identifiers to include. Structure is [documented below](#nested_invocation_config_included_targets).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_tags`
- Description: (Optional) Optional. The set of tags to include.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transitive_dependencies_included`
- Description: (Optional) Optional. When set to true, transitive dependencies of included actions will be executed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transitive_dependents_included`
- Description: (Optional) Optional. When set to true, transitive dependents of included actions will be executed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fully_refresh_incremental_tables_enabled`
- Description: (Optional) Optional. When set to true, any incremental tables will be fully refreshed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) Optional. The service account to run workflow invocations under. <a name="nested_invocation_config_included_targets"></a>The `included_targets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database`
- Description: (Optional) The action's database (Google Cloud project ID).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema`
- Description: (Optional) The action's schema (BigQuery dataset ID), within database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The action's name, within database and schema.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
