## 🛡️ Policy Deployment Engine: `dataproc_workflow_template`

This section provides a concise policy evaluation for the `dataproc_workflow_template` resource in GCP.

Reference: [Terraform Registry – dataproc_workflow_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_workflow_template)

---

## 1. Argument Reference

### `jobs`
- Description: (Required) Required. The Directed Acyclic Graph of Jobs to submit.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Output only. The resource name of the workflow template, as described in https://cloud.google.com/apis/design/resource_names. * For `projects.regions.workflowTemplates`, the resource name of the template has the following format: `projects/{project_id}/regions/{region}/workflowTemplates/{template_id}` * For `projects.locations.workflowTemplates`, the resource name of the template has the following format: `projects/{project_id}/locations/{location}/workflowTemplates/{template_id}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `placement`
- Description: (Required) Required. WorkflowTemplate scheduling information.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `jobs` Block

### `hadoop_job`
- Description: (Optional) Job is a Hadoop job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hive_job`
- Description: (Optional) Job is a Hive job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels to associate with this job. Label keys must be between 1 and 63 characters long, and must conform to the following regular expression: {0,63} No more than 32 labels can be associated with a given job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pig_job`
- Description: (Optional) Job is a Pig job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prerequisite_step_ids`
- Description: (Optional) The optional list of prerequisite job step_ids. If not specified, the job will start at the beginning of workflow.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `presto_job`
- Description: (Optional) Job is a Presto job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pyspark_job`
- Description: (Optional) Job is a PySpark job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scheduling`
- Description: (Optional) Job scheduling configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_job`
- Description: (Optional) Job is a Spark job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_r_job`
- Description: (Optional) Job is a SparkR job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_sql_job`
- Description: (Optional) Job is a SparkSql job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `step_id`
- Description: (Required) Required. The step id. The id must be unique among all jobs within the template. The step id is used as prefix for job id, as job `goog-dataproc-workflow-step-id` label, and in field from other steps. The id must contain only letters (a-z, A-Z), numbers (0-9), underscores (_), and hyphens (-). Cannot begin or end with underscore or hyphen. Must consist of between 3 and 50 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `placement` Block

### `cluster_selector`
- Description: (Optional) A selector that chooses target cluster for jobs based on metadata. The selector is evaluated at the time each job is submitted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `managed_cluster`
- Description: (Optional) A cluster that is managed by the workflow.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `config` Block

### `autoscaling_config`
- Description: (Optional) Autoscaling config for the policy associated with the cluster. Cluster does not autoscale if this field is unset.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_config`
- Description: (Optional) Encryption settings for the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoint_config`
- Description: (Optional) Port/endpoint configuration for this cluster
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gce_cluster_config`
- Description: (Optional) The shared Compute Engine config settings for all instances in a cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gke_cluster_config`
- Description: (Optional) The Kubernetes Engine config for Dataproc clusters deployed to Kubernetes. Setting this is considered mutually exclusive with Compute Engine-based options such as `gce_cluster_config`, `master_config`, `worker_config`, `secondary_worker_config`, and `autoscaling_config`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initialization_actions`
- Description: (Optional) Commands to execute on each node after config is completed. By default, executables are run on master and all worker nodes. You can test a node's `role` metadata to run an executable on a master or worker node, as shown below using `curl` (you can also use `wget`): ROLE=$(curl -H Metadata-Flavor:Google http://metadata/computeMetadata/v1/instance/attributes/dataproc-role) if ; then ... master specific actions ... else ... worker specific actions ... fi
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lifecycle_config`
- Description: (Optional) Lifecycle setting for the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `master_config`
- Description: (Optional) The Compute Engine config settings for additional worker instances in a cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metastore_config`
- Description: (Optional) Metastore configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_worker_config`
- Description: (Optional) The Compute Engine config settings for additional worker instances in a cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_config`
- Description: (Optional) Security settings for the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `software_config`
- Description: (Optional) The config settings for software inside the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `staging_bucket`
- Description: (Optional) A Cloud Storage bucket used to stage job dependencies, config files, and job driver console output. If you do not specify a staging bucket, Cloud Dataproc will determine a Cloud Storage location (US, ASIA, or EU) for your cluster's staging bucket according to the Compute Engine zone where your cluster is deployed, and then create and manage this project-level, per-location bucket (see [Dataproc staging and temp buckets](https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/staging-bucket)).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `temp_bucket`
- Description: (Optional) A Cloud Storage bucket used to store ephemeral cluster and jobs data, such as Spark and MapReduce history files. If you do not specify a temp bucket, Dataproc will determine a Cloud Storage location (US, ASIA, or EU) for your cluster's temp bucket according to the Compute Engine zone where your cluster is deployed, and then create and manage this project-level, per-location bucket. The default bucket has a TTL of 90 days, but you can use any TTL (or none) if you specify a bucket.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `worker_config`
- Description: (Optional) The Compute Engine config settings for additional worker instances in a cluster. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dag_timeout`
- Description: (Optional) (Beta only) Optional. Timeout duration for the DAG of jobs. You can use "s", "m", "h", and "d" suffixes for second, minute, hour, and day duration values, respectively. The timeout duration must be from 10 minutes ("10m") to 24 hours ("24h" or "1d"). The timer begins when the first job is submitted. If the workflow is running at the end of the timeout period, any remaining jobs are cancelled, the workflow is ended, and if the workflow was running on a (/dataproc/docs/concepts/workflows/using-workflows#configuring_or_selecting_a_cluster), the cluster is deleted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels to associate with this template. These labels will be propagated to all jobs and clusters created by the workflow instance. Label **keys** must contain 1 to 63 characters, and must conform to [RFC 1035](https://www.ietf.org/rfc/rfc1035.txt). No more than 32 labels can be associated with a template.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameters`
- Description: (Optional) Template parameters whose values are substituted into the template. Values for parameters must be provided when the template is instantiated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Used to perform a consistent read-modify-write. This field should be left blank for a `CreateWorkflowTemplate` request. It is required for an `UpdateWorkflowTemplate` request, and must match the current server version. A typical update template flow would fetch the current template with a `GetWorkflowTemplate` request, which will return the current template with the `version` field filled in with the current server version. The user updates other fields in the template, then returns it as part of the `UpdateWorkflowTemplate` request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `hadoop_job` Block

### `archive_uris`
- Description: (Optional) HCFS URIs of archives to be extracted in the working directory of Hadoop drivers and tasks. Supported file types: .jar, .tar, .tar.gz, .tgz, or .zip.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) The arguments to pass to the driver. Do not include arguments, such as `-libjars` or `-Dfoo=bar`, that can be set as job properties, since a collision may occur that causes an incorrect job submission.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: (Optional) HCFS (Hadoop Compatible Filesystem) URIs of files to be copied to the working directory of Hadoop drivers and distributed tasks. Useful for naively parallel tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: (Optional) Jar file URIs to add to the CLASSPATHs of the Hadoop driver and tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: (Optional) The runtime log config for job execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_class`
- Description: (Optional) The name of the driver's main class. The jar file containing the class must be in the default CLASSPATH or specified in `jar_file_uris`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_jar_file_uri`
- Description: (Optional) The HCFS URI of the jar file containing the main class. Examples: 'gs://foo-bucket/analytics-binaries/extract-useful-metrics-mr.jar' 'hdfs:/tmp/test-samples/custom-wordcount.jar' 'file:///home/usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) A mapping of property names to values, used to configure Hadoop. Properties that conflict with values set by the Dataproc API may be overwritten. Can include properties set in /etc/hadoop/conf/*-site and classes in user code.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `logging_config` Block

### `driver_log_levels`
- Description: (Optional) The per-package log levels for the driver. This may include "root" package name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `driver_log_levels`
- Description: (Optional) The per-package log levels for the driver. This may include "root" package name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `driver_log_levels`
- Description: (Optional) The per-package log levels for the driver. This may include "root" package name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `driver_log_levels`
- Description: (Optional) The per-package log levels for the driver. This may include "root" package name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `driver_log_levels`
- Description: (Optional) The per-package log levels for the driver. This may include "root" package name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `driver_log_levels`
- Description: (Optional) The per-package log levels for the driver. This may include "root" package name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `driver_log_levels`
- Description: (Optional) The per-package log levels for the driver. This may include "root" package name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `hive_job` Block

### `continue_on_failure`
- Description: (Optional) Whether to continue executing queries if a query fails. The default value is `false`. Setting to `true` can be useful when executing independent parallel queries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: (Optional) HCFS URIs of jar files to add to the CLASSPATH of the Hive server and Hadoop MapReduce (MR) tasks. Can contain Hive SerDes and UDFs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) A mapping of property names and values, used to configure Hive. Properties that conflict with values set by the Dataproc API may be overwritten. Can include properties set in /etc/hadoop/conf/*-site.xml, /etc/hive/conf/hive-site.xml, and classes in user code.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_file_uri`
- Description: (Optional) The HCFS URI of the script that contains Hive queries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_list`
- Description: (Optional) A list of queries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script_variables`
- Description: (Optional) Mapping of query variable names to values (equivalent to the Hive command: `SET name="value";`).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `query_list` Block

### `queries`
- Description: (Required) Required. The queries to execute. You do not need to end a query expression with a semicolon. Multiple queries can be specified in one string by separating each with a semicolon. Here is an example of a Dataproc API snippet that uses a QueryList to specify a HiveJob: "hiveJob": { "queryList": { "queries": } }
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `queries`
- Description: (Required) Required. The queries to execute. You do not need to end a query expression with a semicolon. Multiple queries can be specified in one string by separating each with a semicolon. Here is an example of a Dataproc API snippet that uses a QueryList to specify a HiveJob: "hiveJob": { "queryList": { "queries": } }
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `queries`
- Description: (Required) Required. The queries to execute. You do not need to end a query expression with a semicolon. Multiple queries can be specified in one string by separating each with a semicolon. Here is an example of a Dataproc API snippet that uses a QueryList to specify a HiveJob: "hiveJob": { "queryList": { "queries": } }
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `queries`
- Description: (Required) Required. The queries to execute. You do not need to end a query expression with a semicolon. Multiple queries can be specified in one string by separating each with a semicolon. Here is an example of a Dataproc API snippet that uses a QueryList to specify a HiveJob: "hiveJob": { "queryList": { "queries": } }
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `pig_job` Block

### `continue_on_failure`
- Description: (Optional) Whether to continue executing queries if a query fails. The default value is `false`. Setting to `true` can be useful when executing independent parallel queries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: (Optional) HCFS URIs of jar files to add to the CLASSPATH of the Pig Client and Hadoop MapReduce (MR) tasks. Can contain Pig UDFs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: (Optional) The runtime log config for job execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) A mapping of property names to values, used to configure Pig. Properties that conflict with values set by the Dataproc API may be overwritten. Can include properties set in /etc/hadoop/conf/*-site.xml, /etc/pig/conf/pig.properties, and classes in user code.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_file_uri`
- Description: (Optional) The HCFS URI of the script that contains the Pig queries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_list`
- Description: (Optional) A list of queries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script_variables`
- Description: (Optional) Mapping of query variable names to values (equivalent to the Pig command: `name=`).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `presto_job` Block

### `client_tags`
- Description: (Optional) Presto client tags to attach to this query
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `continue_on_failure`
- Description: (Optional) Whether to continue executing queries if a query fails. The default value is `false`. Setting to `true` can be useful when executing independent parallel queries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: (Optional) The runtime log config for job execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_format`
- Description: (Optional) The format in which query output will be displayed. See the Presto documentation for supported output formats
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) A mapping of property names to values. Used to set Presto (https://prestodb.io/docs/current/sql/set-session.html) Equivalent to using the --session flag in the Presto CLI
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_file_uri`
- Description: (Optional) The HCFS URI of the script that contains SQL queries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_list`
- Description: (Optional) A list of queries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `pyspark_job` Block

### `archive_uris`
- Description: (Optional) HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) The arguments to pass to the driver. Do not include arguments, such as `--conf`, that can be set as job properties, since a collision may occur that causes an incorrect job submission.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: (Optional) HCFS URIs of files to be placed in the working directory of each executor. Useful for naively parallel tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: (Optional) HCFS URIs of jar files to add to the CLASSPATHs of the Python driver and tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: (Optional) The runtime log config for job execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_python_file_uri`
- Description: (Required) Required. The HCFS URI of the main Python file to use as the driver. Must be a .py file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) A mapping of property names to values, used to configure PySpark. Properties that conflict with values set by the Dataproc API may be overwritten. Can include properties set in /etc/spark/conf/spark-defaults.conf and classes in user code.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `python_file_uris`
- Description: (Optional) HCFS file URIs of Python files to pass to the PySpark framework. Supported file types: .py, .egg, and .zip.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `scheduling` Block

### `max_failures_per_hour`
- Description: (Optional) Maximum number of times per hour a driver may be restarted as a result of driver exiting with non-zero code before job is reported failed. A job may be reported as thrashing if driver exits with non-zero code 4 times within 10 minute window. Maximum value is 10.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_failures_total`
- Description: (Optional) Maximum number of times in total a driver may be restarted as a result of driver exiting with non-zero code before job is reported failed. Maximum value is 240
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `spark_job` Block

### `archive_uris`
- Description: (Optional) HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) The arguments to pass to the driver. Do not include arguments, such as `--conf`, that can be set as job properties, since a collision may occur that causes an incorrect job submission.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: (Optional) HCFS URIs of files to be placed in the working directory of each executor. Useful for naively parallel tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: (Optional) HCFS URIs of jar files to add to the CLASSPATHs of the Spark driver and tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: (Optional) The runtime log config for job execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_class`
- Description: (Optional) The name of the driver's main class. The jar file that contains the class must be in the default CLASSPATH or specified in `jar_file_uris`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_jar_file_uri`
- Description: (Optional) The HCFS URI of the jar file that contains the main class.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) A mapping of property names to values, used to configure Spark. Properties that conflict with values set by the Dataproc API may be overwritten. Can include properties set in /etc/spark/conf/spark-defaults.conf and classes in user code.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `spark_r_job` Block

### `archive_uris`
- Description: (Optional) HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) The arguments to pass to the driver. Do not include arguments, such as `--conf`, that can be set as job properties, since a collision may occur that causes an incorrect job submission.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: (Optional) HCFS URIs of files to be placed in the working directory of each executor. Useful for naively parallel tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: (Optional) The runtime log config for job execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_r_file_uri`
- Description: (Required) Required. The HCFS URI of the main R file to use as the driver. Must be a .R file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) A mapping of property names to values, used to configure SparkR. Properties that conflict with values set by the Dataproc API may be overwritten. Can include properties set in /etc/spark/conf/spark-defaults.conf and classes in user code.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `spark_sql_job` Block

### `jar_file_uris`
- Description: (Optional) HCFS URIs of jar files to be added to the Spark CLASSPATH.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: (Optional) The runtime log config for job execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) A mapping of property names to values, used to configure Spark SQL's SparkConf. Properties that conflict with values set by the Dataproc API may be overwritten.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_file_uri`
- Description: (Optional) The HCFS URI of the script that contains SQL queries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_list`
- Description: (Optional) A list of queries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script_variables`
- Description: (Optional) Mapping of query variable names to values (equivalent to the Spark SQL command: SET `name="value";`).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `parameters` Block

### `description`
- Description: (Optional) Brief description of the parameter. Must not exceed 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fields`
- Description: (Required) Required. Paths to all fields that the parameter replaces. A field is allowed to appear in at most one parameter's list of field paths. A field path is similar in syntax to a .sparkJob.args
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Required. Parameter name. The parameter name is used as the key, and paired with the parameter value, which are passed to the template when the template is instantiated. The name must contain only capital letters (A-Z), numbers (0-9), and underscores (_), and must not start with a number. The maximum length is 40 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `validation`
- Description: (Optional) Validation rules to be applied to this parameter's value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `validation` Block

### `regex`
- Description: (Optional) Validation based on regular expressions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `values`
- Description: (Optional) Validation based on a list of allowed values.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `regex` Block

### `regexes`
- Description: (Required) Required. RE2 regular expressions used to validate the parameter's value. The value must match the regex in its entirety (substring matches are not sufficient).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `values` Block

### `values`
- Description: (Required) Required. List of allowed values for the parameter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `cluster_selector` Block

### `cluster_labels`
- Description: (Required) Required. The cluster labels. Cluster must have all labels to match.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) The zone where workflow process executes. This parameter does not affect the selection of the cluster. If unspecified, the zone of the first cluster matching the selector is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `managed_cluster` Block

### `cluster_name`
- Description: (Required) Required. The cluster name prefix. A unique cluster name will be formed by appending a random suffix. The name must contain only lower-case letters (a-z), numbers (0-9), and hyphens (-). Must begin with a letter. Cannot begin or end with hyphen. Must consist of between 2 and 35 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Required) Required. The cluster configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels to associate with this cluster. Label keys must be between 1 and 63 characters long, and must conform to the following PCRE regular expression: {0,63} No more than 32 labels can be associated with a given cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `master_config` Block

### `accelerators`
- Description: (Optional) The Compute Engine accelerator configuration for these instances.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_config`
- Description: (Optional) Disk option config settings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image`
- Description: (Optional) The Compute Engine image resource used for cluster instances. The URI can represent an image or image family. Image examples: * `https://www.googleapis.com/compute/beta/projects/` If the URI is unspecified, it will be inferred from `SoftwareConfig.image_version` or the system default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: (Optional) The Compute Engine machine type used for cluster instances. A full URL, partial URI, or short name are valid. Examples: * `https://www.googleapis.com/compute/v1/projects/(https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/auto-zone#using_auto_zone_placement) feature, you must use the short name of the machine type resource, for example, `n1-standard-2`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_cpu_platform`
- Description: (Optional) Specifies the minimum cpu platform for the Instance Group. See [Minimum CPU platform](https://cloud.google.com/dataproc/docs/concepts/compute/dataproc-min-cpu).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_instances`
- Description: (Optional) The number of VM instances in the instance group. For master instance groups, must be set to 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preemptibility`
- Description: (Optional) Specifies the preemptibility of the instance group. The default value for master and worker groups is `NON_PREEMPTIBLE`. This default cannot be changed. The default value for secondary instances is `PREEMPTIBLE`. Possible values: PREEMPTIBILITY_UNSPECIFIED, NON_PREEMPTIBLE, PREEMPTIBLE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_names`
- Description: Output only. The list of instance names. Dataproc derives the names from `cluster_name`, `num_instances`, and the instance group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_preemptible`
- Description: Output only. Specifies that this instance group contains preemptible instances.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `managed_group_config`
- Description: Output only. The config for Compute Engine Instance Group Manager that manages this group. This is only used for preemptible instance groups.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `accelerators` Block

### `accelerator_count`
- Description: (Optional) The number of the accelerator cards of this type exposed to this instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: (Optional) Full URL, partial URI, or short name of the accelerator type resource to expose to this instance. See (https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/auto-zone#using_auto_zone_placement) feature, you must use the short name of the accelerator type resource, for example, `nvidia-tesla-k80`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `disk_config` Block

### `boot_disk_size_gb`
- Description: (Optional) Size in GB of the boot disk (default is 500GB).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_type`
- Description: (Optional) Type of the boot disk (default is "pd-standard"). Valid values: "pd-ssd" (Persistent Disk Solid State Drive) or "pd-standard" (Persistent Disk Hard Disk Drive).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_local_ssds`
- Description: (Optional) Number of attached SSDs, from 0 to 4 (default is 0). If SSDs are not attached, the boot disk is used to store runtime logs and (https://hadoop.apache.org/docs/r1.2.1/hdfs_user_guide.html) data. If one or more SSDs are attached, this runtime bulk data is spread across them, and the boot disk contains only basic config and installed binaries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `autoscaling_config` Block

### `policy`
- Description: (Optional) The autoscaling policy used by the cluster. Only resource names including projectid and location (region) are valid. Examples: * `https://www.googleapis.com/compute/v1/projects/` Note that the policy must be in the same project and Dataproc region.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `encryption_config` Block

### `gce_pd_kms_key_name`
- Description: (Optional) The Cloud KMS key name to use for PD disk encryption for all instances in the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `endpoint_config` Block

### `enable_http_port_access`
- Description: (Optional) If true, enable http access to specific ports on the cluster from external sources. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_ports`
- Description: Output only. The map of port descriptions to URLs. Will only be populated if enable_http_port_access is true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `gce_cluster_config` Block

### `internal_ip_only`
- Description: (Optional) If true, all instances in the cluster will only have internal IP addresses. By default, clusters are not restricted to internal IP addresses, and will have ephemeral external IP addresses assigned to each instance. This `internal_ip_only` restriction can only be enabled for subnetwork enabled networks, and all off-cluster dependencies must be configured to be accessible without external IP addresses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) The Compute Engine metadata entries to add to all instances (see [About VM metadata](https://cloud.google.com/compute/docs/metadata/overview)).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The Compute Engine network to be used for machine communications. Cannot be specified with subnetwork_uri. If neither `network_uri` nor `subnetwork_uri` is specified, the "default" network of the project is used, if it exists. Cannot be a "Custom Subnet Network" (see /regions/global/default` * `default`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_group_affinity`
- Description: (Optional) Node Group Affinity for sole-tenant clusters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_ipv6_google_access`
- Description: (Optional) The type of IPv6 access for a cluster. Possible values: PRIVATE_IPV6_GOOGLE_ACCESS_UNSPECIFIED, INHERIT_FROM_SUBNETWORK, OUTBOUND, BIDIRECTIONAL
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reservation_affinity`
- Description: (Optional) Reservation Affinity for consuming Zonal reservation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) The (https://cloud.google.com/compute/docs/access/service-accounts#default_service_account) is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_scopes`
- Description: (Optional) The URIs of service account scopes to be included in Compute Engine instances. The following base set of scopes is always included: * https://www.googleapis.com/auth/cloud.useraccounts.readonly * https://www.googleapis.com/auth/devstorage.read_write * https://www.googleapis.com/auth/logging.write If no scopes are specified, the following defaults are also provided: * https://www.googleapis.com/auth/bigquery * https://www.googleapis.com/auth/bigtable.admin.table * https://www.googleapis.com/auth/bigtable.data * https://www.googleapis.com/auth/devstorage.full_control
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shielded_instance_config`
- Description: (Optional) Shielded Instance Config for clusters using [Compute Engine Shielded VMs](https://cloud.google.com/security/shielded-cloud/shielded-vm). Structure [defined below](#nested_shielded_instance_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: (Optional) The Compute Engine subnetwork to be used for machine communications. Cannot be specified with network_uri. A full URL, partial URI, or short name are valid. Examples: * `https://www.googleapis.com/compute/v1/projects//regions/us-east1/subnetworks/sub0` * `sub0`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) The Compute Engine tags to add to all instances (see [Manage tags for resources](https://cloud.google.com/compute/docs/tag-resources)).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) The zone where the Compute Engine cluster will be located. On a create request, it is required in the "global" region. If omitted in a non-global Dataproc region, the service will pick a zone in the corresponding Compute Engine region. On a get request, zone will always be present. A full URL, partial URI, or short name are valid. Examples: * `https://www.googleapis.com/compute/v1/projects/` * `us-central1-f`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `node_group_affinity` Block

### `node_group`
- Description: (Required) Required. The URI of a sole-tenant /zones/us-central1-a/nodeGroups/node-group-1` * `node-group-1`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `reservation_affinity` Block

### `consume_reservation_type`
- Description: (Optional) Type of reservation to consume Possible values: TYPE_UNSPECIFIED, NO_RESERVATION, ANY_RESERVATION, SPECIFIC_RESERVATION
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) Corresponds to the label key of reservation resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `values`
- Description: (Optional) Corresponds to the label values of reservation resource. <a name="nested_shielded_instance_config"></a>The `shielded_instance_config` block supports: ```hcl cluster_config { gce_cluster_config { shielded_instance_config { enable_secure_boot          = true enable_vtpm                 = true enable_integrity_monitoring = true } } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_secure_boot`
- Description: (Optional) Defines whether instances have [Secure Boot](https://cloud.google.com/compute/shielded-vm/docs/shielded-vm#secure-boot) enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_vtpm`
- Description: (Optional) Defines whether instances have the [vTPM](https://cloud.google.com/compute/shielded-vm/docs/shielded-vm#vtpm) enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_integrity_monitoring`
- Description: (Optional) Defines whether instances have [Integrity Monitoring](https://cloud.google.com/compute/shielded-vm/docs/shielded-vm#integrity-monitoring) enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `gke_cluster_config` Block

### `namespaced_gke_deployment_target`
- Description: (Optional) A target for the deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `namespaced_gke_deployment_target` Block

### `cluster_namespace`
- Description: (Optional) A namespace within the GKE cluster to deploy into.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_gke_cluster`
- Description: (Optional) The target GKE cluster to deploy to. Format: 'projects/{project}/locations/{location}/clusters/{cluster_id}'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `initialization_actions` Block

### `executable_file`
- Description: (Optional) Required. Cloud Storage URI of executable file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `execution_timeout`
- Description: (Optional) Amount of time executable has to complete. Default is 10 minutes (see JSON representation of [JSON Mapping - Language Guide (proto 3)](https://developers.google.com/protocol-buffers/docs/proto3#json)). Cluster creation fails with an explanatory error message (the name of the executable that caused the error and the exceeded timeout period) if the executable is not completed at end of the timeout period.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `lifecycle_config` Block

### `auto_delete_time`
- Description: (Optional) The time when cluster will be auto-deleted (see JSON representation of [JSON Mapping - Language Guide (proto 3)](https://developers.google.com/protocol-buffers/docs/proto3#json)).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_delete_ttl`
- Description: (Optional) The lifetime duration of cluster. The cluster will be auto-deleted at the end of this period. Minimum value is 10 minutes; maximum value is 14 days (see JSON representation of [JSON Mapping - Language Guide (proto 3)](https://developers.google.com/protocol-buffers/docs/proto3#json)).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idle_delete_ttl`
- Description: (Optional) The duration to keep the cluster alive while idling (when no jobs are running). Passing this threshold will cause the cluster to be deleted. Minimum value is 5 minutes; maximum value is 14 days (see JSON representation of [JSON Mapping - Language Guide (proto 3)](https://developers.google.com/protocol-buffers/docs/proto3#json).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idle_start_time`
- Description: Output only. The time when cluster became idle (most recent job finished) and became eligible for deletion due to idleness (see JSON representation of [JSON Mapping - Language Guide (proto 3)](https://developers.google.com/protocol-buffers/docs/proto3#json)).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `metastore_config` Block

### `dataproc_metastore_service`
- Description: (Required) Required. Resource name of an existing Dataproc Metastore service. Example: * `projects/`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `security_config` Block

### `kerberos_config`
- Description: (Optional) Kerberos related configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `kerberos_config` Block

### `cross_realm_trust_admin_server`
- Description: (Optional) The admin server (IP or hostname) for the remote trusted realm in a cross realm trust relationship.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cross_realm_trust_kdc`
- Description: (Optional) The KDC (IP or hostname) for the remote trusted realm in a cross realm trust relationship.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cross_realm_trust_realm`
- Description: (Optional) The remote realm the Dataproc on-cluster KDC will trust, should the user enable cross realm trust.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cross_realm_trust_shared_password`
- Description: (Optional) The Cloud Storage URI of a KMS encrypted file containing the shared password between the on-cluster Kerberos realm and the remote trusted realm, in a cross realm trust relationship.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_kerberos`
- Description: (Optional) Flag to indicate whether to Kerberize the cluster (default: false). Set this field to true to enable Kerberos on a cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kdc_db_key`
- Description: (Optional) The Cloud Storage URI of a KMS encrypted file containing the master key of the KDC database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_password`
- Description: (Optional) The Cloud Storage URI of a KMS encrypted file containing the password to the user provided key. For the self-signed certificate, this password is generated by Dataproc.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `keystore`
- Description: (Optional) The Cloud Storage URI of the keystore file used for SSL encryption. If not provided, Dataproc will provide a self-signed certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `keystore_password`
- Description: (Optional) The Cloud Storage URI of a KMS encrypted file containing the password to the user provided keystore. For the self-signed certificate, this password is generated by Dataproc.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) The uri of the KMS key used to encrypt various sensitive files.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `realm`
- Description: (Optional) The name of the on-cluster Kerberos realm. If not specified, the uppercased domain of hostnames will be the realm.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `root_principal_password`
- Description: (Optional) The Cloud Storage URI of a KMS encrypted file containing the root principal password.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tgt_lifetime_hours`
- Description: (Optional) The lifetime of the ticket granting ticket, in hours. If not specified, or user specifies 0, then default value 10 will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `truststore`
- Description: (Optional) The Cloud Storage URI of the truststore file used for SSL encryption. If not provided, Dataproc will provide a self-signed certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `truststore_password`
- Description: (Optional) The Cloud Storage URI of a KMS encrypted file containing the password to the user provided truststore. For the self-signed certificate, this password is generated by Dataproc.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `software_config` Block

### `image_version`
- Description: (Optional) The version of software inside the cluster. It must be one of the supported [Dataproc Versions](https://cloud.google.com/dataproc/docs/concepts/versioning/dataproc-versions#supported_dataproc_versions), such as "1.2" (including a subminor version, such as "1.2.29"), or the ["preview" version](https://cloud.google.com/dataproc/docs/concepts/versioning/dataproc-versions#other_versions). If unspecified, it defaults to the latest Debian version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `optional_components`
- Description: (Optional) The set of components to activate on the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) The properties to set on daemon config files. Property keys are specified in `prefix:property` format, for example `core:hadoop.tmp.dir`. The following are supported prefixes and their mappings: * capacity-scheduler: `capacity-scheduler.xml` * core: `core-site.xml` * distcp: `distcp-default.xml` * hdfs: `hdfs-site.xml` * hive: `hive-site.xml` * mapred: `mapred-site.xml` * pig: `pig.properties` * spark: `spark-defaults.conf` * yarn: `yarn-site.xml` For more information, see [Cluster properties](https://cloud.google.com/dataproc/docs/concepts/cluster-properties).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
