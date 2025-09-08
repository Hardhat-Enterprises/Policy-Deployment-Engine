## 🛡️ Policy Deployment Engine: `colab_schedule`

This section provides a concise policy evaluation for the `colab_schedule` resource in GCP.

Reference: [Terraform Registry – colab_schedule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/colab_schedule)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Required. The display name of the Schedule. | true | None | None |
| `cron` | Cron schedule (https://en.wikipedia.org/wiki/Cron) to launch scheduled runs. | true | None | None |
| `max_concurrent_run_count` | Maximum number of runs that can be started concurrently for this Schedule. This is the limit for starting the scheduled requests and not the execution of the notebook execution jobs created by the requests. | true | None | None |
| `location` | The location for the resource: https://cloud.google.com/colab/docs/locations | true | None | None |
| `start_time` | The timestamp after which the first run can be scheduled. Defaults to the schedule creation time. Must be in the RFC 3339 (https://www.ietf.org/rfc/rfc3339.txt) format. | false | None | None |
| `end_time` | Timestamp after which no new runs can be scheduled. If specified, the schedule will be completed when either end_time is reached or when scheduled_run_count >= max_run_count. Must be in the RFC 3339 (https://www.ietf.org/rfc/rfc3339.txt) format. | false | None | None |
| `max_run_count` | Maximum run count of the schedule. If specified, The schedule will be completed when either startedRunCount >= maxRunCount or when endTime is reached. If not specified, new runs will keep getting scheduled until this Schedule is paused or deleted. Already scheduled runs will be allowed to complete. Unset if not specified. | false | None | None |
| `allow_queueing` | Whether new scheduled runs can be queued when max_concurrent_runs limit is reached. If set to true, new runs will be queued instead of skipped. Default to false. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `desired_state` |  | none | None | None |

### create_notebook_execution_job_request Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `notebook_execution_job` | The NotebookExecutionJob to create. Structure is [documented below](#nested_create_notebook_execution_job_request_notebook_execution_job). | true | None | None |

### notebook_execution_job Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Required. The display name of the Notebook Execution. | true | None | None |
| `dataform_repository_source` | The Dataform Repository containing the input notebook. Structure is [documented below](#nested_create_notebook_execution_job_request_notebook_execution_job_dataform_repository_source). | false | None | None |
| `gcs_notebook_source` | The Cloud Storage uri for the input notebook. Structure is [documented below](#nested_create_notebook_execution_job_request_notebook_execution_job_gcs_notebook_source). | false | None | None |
| `execution_timeout` | Max running time of the execution job in seconds (default 86400s / 24 hrs). A duration in seconds with up to nine fractional digits, ending with "s". Example: "3.5s". | false | None | None |
| `notebook_runtime_template_resource_name` | The NotebookRuntimeTemplate to source compute configuration from. | true | None | None |
| `gcs_output_uri` | The Cloud Storage location to upload the result to. Format:`gs://bucket-name` | true | None | None |
| `execution_user` | The user email to run the execution as. | false | None | None |
| `service_account` | The service account to run the execution as. | false | None | None |

### dataform_repository_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataform_repository_resource_name` | The resource name of the Dataform Repository. | true | None | None |
| `commit_sha` | The commit SHA to read repository with. If unset, the file will be read at HEAD. | false | None | None |

### gcs_notebook_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | The Cloud Storage uri pointing to the ipynb file. Format: gs://bucket/notebook_file.ipynb | true | None | None |
| `generation` | The version of the Cloud Storage object to read. If unset, the current version of the object is read. See https://cloud.google.com/storage/docs/metadata#generation-number. | false | None | None |
