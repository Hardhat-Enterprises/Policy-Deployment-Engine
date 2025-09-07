## 🛡️ Policy Deployment Engine: `colab_schedule`

This section provides a concise policy evaluation for the `colab_schedule` resource in GCP.

Reference: [Terraform Registry – colab_schedule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/colab_schedule)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) Required. The display name of the Schedule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cron`
- Description: (Required) Cron schedule (https://en.wikipedia.org/wiki/Cron) to launch scheduled runs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_concurrent_run_count`
- Description: (Required) Maximum number of runs that can be started concurrently for this Schedule. This is the limit for starting the scheduled requests and not the execution of the notebook execution jobs created by the requests.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_notebook_execution_job_request`
- Description: (Required) Request for google_colab_notebook_execution. Structure is [documented below](#nested_create_notebook_execution_job_request).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource: https://cloud.google.com/colab/docs/locations
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Optional) The timestamp after which the first run can be scheduled. Defaults to the schedule creation time. Must be in the RFC 3339 (https://www.ietf.org/rfc/rfc3339.txt) format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_time`
- Description: (Optional) Timestamp after which no new runs can be scheduled. If specified, the schedule will be completed when either end_time is reached or when scheduled_run_count >= max_run_count. Must be in the RFC 3339 (https://www.ietf.org/rfc/rfc3339.txt) format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_run_count`
- Description: (Optional) Maximum run count of the schedule. If specified, The schedule will be completed when either startedRunCount >= maxRunCount or when endTime is reached. If not specified, new runs will keep getting scheduled until this Schedule is paused or deleted. Already scheduled runs will be allowed to complete. Unset if not specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_queueing`
- Description: (Optional) Whether new scheduled runs can be queued when max_concurrent_runs limit is reached. If set to true, new runs will be queued instead of skipped. Default to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `desired_state`
- Description: <a name="nested_create_notebook_execution_job_request"></a>The `create_notebook_execution_job_request` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notebook_execution_job`
- Description: (Required) The NotebookExecutionJob to create. Structure is [documented below](#nested_create_notebook_execution_job_request_notebook_execution_job). <a name="nested_create_notebook_execution_job_request_notebook_execution_job"></a>The `notebook_execution_job` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) Required. The display name of the Notebook Execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataform_repository_source`
- Description: (Optional) The Dataform Repository containing the input notebook. Structure is [documented below](#nested_create_notebook_execution_job_request_notebook_execution_job_dataform_repository_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_notebook_source`
- Description: (Optional) The Cloud Storage uri for the input notebook. Structure is [documented below](#nested_create_notebook_execution_job_request_notebook_execution_job_gcs_notebook_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `execution_timeout`
- Description: (Optional) Max running time of the execution job in seconds (default 86400s / 24 hrs). A duration in seconds with up to nine fractional digits, ending with "s". Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notebook_runtime_template_resource_name`
- Description: (Required) The NotebookRuntimeTemplate to source compute configuration from.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_output_uri`
- Description: (Required) The Cloud Storage location to upload the result to. Format:`gs://bucket-name`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `execution_user`
- Description: (Optional) The user email to run the execution as.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) The service account to run the execution as. <a name="nested_create_notebook_execution_job_request_notebook_execution_job_dataform_repository_source"></a>The `dataform_repository_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataform_repository_resource_name`
- Description: (Required) The resource name of the Dataform Repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `commit_sha`
- Description: (Optional) The commit SHA to read repository with. If unset, the file will be read at HEAD. <a name="nested_create_notebook_execution_job_request_notebook_execution_job_gcs_notebook_source"></a>The `gcs_notebook_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) The Cloud Storage uri pointing to the ipynb file. Format: gs://bucket/notebook_file.ipynb
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation`
- Description: (Optional) The version of the Cloud Storage object to read. If unset, the current version of the object is read. See https://cloud.google.com/storage/docs/metadata#generation-number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
