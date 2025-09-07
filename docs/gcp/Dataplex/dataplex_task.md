## 🛡️ Policy Deployment Engine: `dataplex_task`

This section provides a concise policy evaluation for the `dataplex_task` resource in GCP.

Reference: [Terraform Registry – dataplex_task](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_task)

---

## 1. Argument Reference

### `trigger_spec`
- Description: (Required) Configuration for the cluster Structure is [documented below](#nested_trigger_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `execution_spec`
- Description: (Required) Configuration for the cluster Structure is [documented below](#nested_execution_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-provided description of the task.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User friendly display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels for the task. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark`
- Description: (Optional) A service with manual scaling runs continuously, allowing you to perform complex initialization and rely on the state of its memory over time. Structure is [documented below](#nested_spark).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notebook`
- Description: (Optional) A service with manual scaling runs continuously, allowing you to perform complex initialization and rely on the state of its memory over time. Structure is [documented below](#nested_notebook).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location in which the task will be created in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lake`
- Description: (Optional) The lake in which the task will be created in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `task_id`
- Description: (Optional) The task Id of the task.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_trigger_spec"></a>The `trigger_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Trigger type of the user-specified Task Possible values are: `ON_DEMAND`, `RECURRING`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Optional) The first run of the task will be after this time. If not specified, the task will run shortly after being submitted if ON_DEMAND and based on the schedule if RECURRING.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Prevent the task from executing. This does not cancel already running tasks. It is intended to temporarily disable RECURRING tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_retries`
- Description: (Optional) Number of retry attempts before aborting. Set to zero to never attempt to retry a failed task.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule`
- Description: (Optional) Cron schedule (https://en.wikipedia.org/wiki/Cron) for running tasks periodically. To explicitly set a timezone to the cron tab, apply a prefix in the cron tab: 'CRON_TZ=${IANA_TIME_ZONE}' or 'TZ=${IANA_TIME_ZONE}'. The ${IANA_TIME_ZONE} may only be a valid string from IANA time zone database. For example, CRON_TZ=America/New_York 1 * * * *, or TZ=America/New_York 1 * * * *. This field is required for RECURRING tasks. <a name="nested_execution_spec"></a>The `execution_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) The arguments to pass to the task. The args can use placeholders of the format ${placeholder} as part of key/value string. These will be interpolated before passing the args to the driver. Currently supported placeholders: - ${taskId} - ${job_time} To pass positional args, set the key as TASK_ARGS. The value should be a comma-separated string of all the positional arguments. To use a delimiter other than comma, refer to https://cloud.google.com/sdk/gcloud/reference/topic/escaping. In case of other keys being present in the args, then TASK_ARGS will be passed as the last argument. An object containing a list of 'key': value pairs. Example: { 'name': 'wrench', 'mass': '1.3kg', 'count': '3' }.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Required) Service account to use to execute a task. If not provided, the default Compute service account for the project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project in which jobs are run. By default, the project containing the Lake is used. If a project is provided, the ExecutionSpec.service_account must belong to this project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_job_execution_lifetime`
- Description: (Optional) The maximum duration after which the job execution is expired. A duration in seconds with up to nine fractional digits, ending with 's'. Example: '3.5s'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) The Cloud KMS key to use for encryption, of the form: projects/{project_number}/locations/{locationId}/keyRings/{key-ring-name}/cryptoKeys/{key-name}. <a name="nested_spark"></a>The `spark` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: (Optional) Cloud Storage URIs of files to be placed in the working directory of each executor.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_uris`
- Description: (Optional) Cloud Storage URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `infrastructure_spec`
- Description: (Optional) Infrastructure specification for the execution. Structure is [documented below](#nested_spark_infrastructure_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_jar_file_uri`
- Description: (Optional) The Cloud Storage URI of the jar file that contains the main class. The execution args are passed in as a sequence of named process arguments (--key=value).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_class`
- Description: (Optional) The name of the driver's main class. The jar file that contains the class must be in the default CLASSPATH or specified in jar_file_uris. The execution args are passed in as a sequence of named process arguments (--key=value).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `python_script_file`
- Description: (Optional) The Gcloud Storage URI of the main Python file to use as the driver. Must be a .py file. The execution args are passed in as a sequence of named process arguments (--key=value).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sql_script_file`
- Description: (Optional) A reference to a query file. This can be the Cloud Storage URI of the query file or it can the path to a SqlScript Content. The execution args are used to declare a set of script variables (set key='value';).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sql_script`
- Description: (Optional) The query text. The execution args are used to declare a set of script variables (set key='value';). <a name="nested_spark_infrastructure_spec"></a>The `infrastructure_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `batch`
- Description: (Optional) Compute resources needed for a Task when using Dataproc Serverless. Structure is [documented below](#nested_spark_infrastructure_spec_batch).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_image`
- Description: (Optional) Container Image Runtime Configuration. Structure is [documented below](#nested_spark_infrastructure_spec_container_image).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_network`
- Description: (Optional) Vpc network. Structure is [documented below](#nested_spark_infrastructure_spec_vpc_network). <a name="nested_spark_infrastructure_spec_batch"></a>The `batch` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `executors_count`
- Description: (Optional) Total number of job executors. Executor Count should be between 2 and 100. [Default=2]
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_executors_count`
- Description: (Optional) Max configurable executors. If maxExecutorsCount > executorsCount, then auto-scaling is enabled. Max Executor Count should be between 2 and 1000. [Default=1000] <a name="nested_spark_infrastructure_spec_container_image"></a>The `container_image` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image`
- Description: (Optional) Container image to use.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `java_jars`
- Description: (Optional) A list of Java JARS to add to the classpath. Valid input includes Cloud Storage URIs to Jar binaries. For example, gs://bucket-name/my/path/to/file.jar
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `python_packages`
- Description: (Optional) A list of python packages to be installed. Valid formats include Cloud Storage URI to a PIP installable library. For example, gs://bucket-name/my/path/to/lib.tar.gz
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) Override to common configuration of open source components installed on the Dataproc cluster. The properties to set on daemon config files. Property keys are specified in prefix:property format, for example core:hadoop.tmp.dir. For more information, see Cluster properties. <a name="nested_spark_infrastructure_spec_vpc_network"></a>The `vpc_network` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_tags`
- Description: (Optional) List of network tags to apply to the job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The Cloud VPC network in which the job is run. By default, the Cloud VPC network named Default within the project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sub_network`
- Description: (Optional) The Cloud VPC sub-network in which the job is run. <a name="nested_notebook"></a>The `notebook` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notebook`
- Description: (Required) Path to input notebook. This can be the Cloud Storage URI of the notebook file or the path to a Notebook Content. The execution args are accessible as environment variables (TASK_key=value).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `infrastructure_spec`
- Description: (Optional) Infrastructure specification for the execution. Structure is [documented below](#nested_notebook_infrastructure_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: (Optional) Cloud Storage URIs of files to be placed in the working directory of each executor.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_uris`
- Description: (Optional) Cloud Storage URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. <a name="nested_notebook_infrastructure_spec"></a>The `infrastructure_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `batch`
- Description: (Optional) Compute resources needed for a Task when using Dataproc Serverless. Structure is [documented below](#nested_notebook_infrastructure_spec_batch).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_image`
- Description: (Optional) Container Image Runtime Configuration. Structure is [documented below](#nested_notebook_infrastructure_spec_container_image).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_network`
- Description: (Optional) Vpc network. Structure is [documented below](#nested_notebook_infrastructure_spec_vpc_network). <a name="nested_notebook_infrastructure_spec_batch"></a>The `batch` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `executors_count`
- Description: (Optional) Total number of job executors. Executor Count should be between 2 and 100. [Default=2]
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_executors_count`
- Description: (Optional) Max configurable executors. If maxExecutorsCount > executorsCount, then auto-scaling is enabled. Max Executor Count should be between 2 and 1000. [Default=1000] <a name="nested_notebook_infrastructure_spec_container_image"></a>The `container_image` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image`
- Description: (Optional) Container image to use.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `java_jars`
- Description: (Optional) A list of Java JARS to add to the classpath. Valid input includes Cloud Storage URIs to Jar binaries. For example, gs://bucket-name/my/path/to/file.jar
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `python_packages`
- Description: (Optional) A list of python packages to be installed. Valid formats include Cloud Storage URI to a PIP installable library. For example, gs://bucket-name/my/path/to/lib.tar.gz
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) Override to common configuration of open source components installed on the Dataproc cluster. The properties to set on daemon config files. Property keys are specified in prefix:property format, for example core:hadoop.tmp.dir. For more information, see Cluster properties. <a name="nested_notebook_infrastructure_spec_vpc_network"></a>The `vpc_network` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_tags`
- Description: (Optional) List of network tags to apply to the job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The Cloud VPC network in which the job is run. By default, the Cloud VPC network named Default within the project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sub_network`
- Description: (Optional) The Cloud VPC sub-network in which the job is run.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
