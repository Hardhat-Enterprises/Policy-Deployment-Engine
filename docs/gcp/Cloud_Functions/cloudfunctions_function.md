## 🛡️ Policy Deployment Engine: `cloudfunctions_function`

This section provides a concise policy evaluation for the `cloudfunctions_function` resource in GCP.

Reference: [Terraform Registry – cloudfunctions_function](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function)

---

## 1. Argument Reference

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime`
- Description: Eg. `"nodejs20"`, `"python39"`, `"dotnet3"`, `"go116"`, `"java11"`, `"ruby30"`, `"php74"`, etc. Check the [official doc](https://cloud.google.com/functions/docs/concepts/exec#runtimes) for the up-to-date list. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `available_memory_mb`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entry_point`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_trigger`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trigger_http`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `https_trigger_security_level`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingress_settings`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `terraform_labels`
- Description: The combination of labels configured directly on the resource and default labels configured on the provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effective_labels`
- Description: All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `build_service_account`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environment_variables`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `build_environment_variables`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `build_worker_pool`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_connector`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_connector_egress_settings`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_archive_bucket`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_archive_object`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_repository`
- Description: Cannot be set alongside `source_archive_bucket` or `source_archive_object`. Structure is [documented below](#nested_source_repository). It must match the pattern `projects/{project}/locations/{location}/repositories/{repository}`.*
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `docker_registry`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `docker_repository`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: If specified, you must also provide an artifact registry repository using the `docker_repository` field that was created with the same KMS crypto key. Before deploying, please complete all pre-requisites described in https://cloud.google.com/functions/docs/securing/cmek#granting_service_accounts_access_to_the_key
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_instances`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_instances`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_environment_variables`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_volumes`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `automatic_update_policy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `on_deploy_update_policy`
- Description: <a name="nested_event_trigger"></a>The `event_trigger` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_type`
- Description: See the documentation on [calling Cloud Functions](https://cloud.google.com/functions/docs/calling/) for a full reference of accepted triggers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource`
- Description: which to observe events. For example, `"myBucket"` or `"projects/my-project/topics/my-topic"`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `failure_policy`
- Description: <a name="nested_failure_policy"></a>The `failure_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry`
- Description: <a name="nested_source_repository"></a>The `source_repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url`
- Description: * To refer to a specific commit: `https://source.developers.google.com/projects/*/repos/*/revisions/*/paths/*` * To refer to a moveable alias (branch): `https://source.developers.google.com/projects/*/repos/*/moveable-aliases/*/paths/*`. To refer to HEAD, use the `master` moveable alias. * To refer to a specific fixed alias (tag): `https://source.developers.google.com/projects/*/repos/*/fixed-aliases/*/paths/*` <a name="nested_secret_environment_variables"></a>The `secret_environment_variables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: <a name="nested_on_deploy_update_policy"></a>The `on_deploy_update_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime_version`
- Description: <a name="nested_secret_volumes"></a>The `secret_volumes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mount_path`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `versions`
- Description: <a name="nested_versions"></a>The `versions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
