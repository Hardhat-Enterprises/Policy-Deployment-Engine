## 🛡️ Policy Deployment Engine: `dataplex_task`

This section provides a concise policy evaluation for the `dataplex_task` resource in GCP.

Reference: [Terraform Registry – dataplex_task](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_task)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | User-provided description of the task. | false | None | None |
| `display_name` | User friendly display name. | false | None | None |
| `labels` | User-defined labels for the task. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `location` | The location in which the task will be created in. | false | None | None |
| `lake` | The lake in which the task will be created in. | false | None | None |
| `task_id` | The task Id of the task. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### trigger_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Trigger type of the user-specified Task Possible values are: `ON_DEMAND`, `RECURRING`. | true | None | None |
| `start_time` | The first run of the task will be after this time. If not specified, the task will run shortly after being submitted if ON_DEMAND and based on the schedule if RECURRING. | false | None | None |
| `disabled` | Prevent the task from executing. This does not cancel already running tasks. It is intended to temporarily disable RECURRING tasks. | false | None | None |
| `max_retries` | Number of retry attempts before aborting. Set to zero to never attempt to retry a failed task. | false | None | None |
| `schedule` | Cron schedule (https://en.wikipedia.org/wiki/Cron) for running tasks periodically. To explicitly set a timezone to the cron tab, apply a prefix in the cron tab: 'CRON_TZ=${IANA_TIME_ZONE}' or 'TZ=${IANA_TIME_ZONE}'. The ${IANA_TIME_ZONE} may only be a valid string from IANA time zone database. For example, CRON_TZ=America/New_York 1 * * * *, or TZ=America/New_York 1 * * * *. This field is required for RECURRING tasks. | false | None | None |

### execution_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `args` | The arguments to pass to the task. The args can use placeholders of the format ${placeholder} as part of key/value string. These will be interpolated before passing the args to the driver. Currently supported placeholders: - ${taskId} - ${job_time} To pass positional args, set the key as TASK_ARGS. The value should be a comma-separated string of all the positional arguments. To use a delimiter other than comma, refer to https://cloud.google.com/sdk/gcloud/reference/topic/escaping. In case of other keys being present in the args, then TASK_ARGS will be passed as the last argument. An object containing a list of 'key': value pairs. Example: { 'name': 'wrench', 'mass': '1.3kg', 'count': '3' }. | false | None | None |
| `service_account` | Service account to use to execute a task. If not provided, the default Compute service account for the project is used. | true | None | None |
| `project` | The project in which jobs are run. By default, the project containing the Lake is used. If a project is provided, the ExecutionSpec.service_account must belong to this project. | false | None | None |
| `max_job_execution_lifetime` | The maximum duration after which the job execution is expired. A duration in seconds with up to nine fractional digits, ending with 's'. Example: '3.5s'. | false | None | None |
| `kms_key` | The Cloud KMS key to use for encryption, of the form: projects/{project_number}/locations/{locationId}/keyRings/{key-ring-name}/cryptoKeys/{key-name}. | false | None | None |

### spark Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `file_uris` | Cloud Storage URIs of files to be placed in the working directory of each executor. | false | None | None |
| `archive_uris` | Cloud Storage URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. | false | None | None |
| `infrastructure_spec` | Infrastructure specification for the execution. Structure is [documented below](#nested_spark_infrastructure_spec). | false | None | None |
| `main_jar_file_uri` | The Cloud Storage URI of the jar file that contains the main class. The execution args are passed in as a sequence of named process arguments (--key=value). | false | None | None |
| `main_class` | The name of the driver's main class. The jar file that contains the class must be in the default CLASSPATH or specified in jar_file_uris. The execution args are passed in as a sequence of named process arguments (--key=value). | false | None | None |
| `python_script_file` | The Gcloud Storage URI of the main Python file to use as the driver. Must be a .py file. The execution args are passed in as a sequence of named process arguments (--key=value). | false | None | None |
| `sql_script_file` | A reference to a query file. This can be the Cloud Storage URI of the query file or it can the path to a SqlScript Content. The execution args are used to declare a set of script variables (set key='value';). | false | None | None |
| `sql_script` | The query text. The execution args are used to declare a set of script variables (set key='value';). | false | None | None |

### notebook Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `notebook` | Path to input notebook. This can be the Cloud Storage URI of the notebook file or the path to a Notebook Content. The execution args are accessible as environment variables (TASK_key=value). | true | None | None |
| `infrastructure_spec` | Infrastructure specification for the execution. Structure is [documented below](#nested_notebook_infrastructure_spec). | false | None | None |
| `file_uris` | Cloud Storage URIs of files to be placed in the working directory of each executor. | false | None | None |
| `archive_uris` | Cloud Storage URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. | false | None | None |

### infrastructure_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `batch` | Compute resources needed for a Task when using Dataproc Serverless. Structure is [documented below](#nested_notebook_infrastructure_spec_batch). | false | None | None |
| `container_image` | Container Image Runtime Configuration. Structure is [documented below](#nested_notebook_infrastructure_spec_container_image). | false | None | None |
| `vpc_network` | Vpc network. Structure is [documented below](#nested_notebook_infrastructure_spec_vpc_network). | false | None | None |

### batch Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `executors_count` | Total number of job executors. Executor Count should be between 2 and 100. [Default=2] | false | None | None |
| `max_executors_count` | Max configurable executors. If maxExecutorsCount > executorsCount, then auto-scaling is enabled. Max Executor Count should be between 2 and 1000. [Default=1000] | false | None | None |

### container_image Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `image` | Container image to use. | false | None | None |
| `java_jars` | A list of Java JARS to add to the classpath. Valid input includes Cloud Storage URIs to Jar binaries. For example, gs://bucket-name/my/path/to/file.jar | false | None | None |
| `python_packages` | A list of python packages to be installed. Valid formats include Cloud Storage URI to a PIP installable library. For example, gs://bucket-name/my/path/to/lib.tar.gz | false | None | None |
| `properties` | Override to common configuration of open source components installed on the Dataproc cluster. The properties to set on daemon config files. Property keys are specified in prefix:property format, for example core:hadoop.tmp.dir. For more information, see Cluster properties. | false | None | None |

### vpc_network Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network_tags` | List of network tags to apply to the job. | false | None | None |
| `network` | The Cloud VPC network in which the job is run. By default, the Cloud VPC network named Default within the project is used. | false | None | None |
| `sub_network` | The Cloud VPC sub-network in which the job is run. | false | None | None |
