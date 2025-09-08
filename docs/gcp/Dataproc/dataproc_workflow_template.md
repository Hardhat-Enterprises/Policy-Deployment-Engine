## 🛡️ Policy Deployment Engine: `dataproc_workflow_template`

This section provides a concise policy evaluation for the `dataproc_workflow_template` resource in GCP.

Reference: [Terraform Registry – dataproc_workflow_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_workflow_template)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location for the resource | true | None | None |
| `name` | Output only. The resource name of the workflow template, as described in https://cloud.google.com/apis/design/resource_names. * For `projects.regions.workflowTemplates`, the resource name of the template has the following format: `projects/{project_id}/regions/{region}/workflowTemplates/{template_id}` * For `projects.locations.workflowTemplates`, the resource name of the template has the following format: `projects/{project_id}/locations/{location}/workflowTemplates/{template_id}` | true | None | None |

### jobs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hadoop_job` | Job is a Hadoop job. | false | None | None |
| `hive_job` | Job is a Hive job. | false | None | None |
| `labels` | The labels to associate with this job. Label keys must be between 1 and 63 characters long, and must conform to the following regular expression: {0,63} No more than 32 labels can be associated with a given job. | false | None | None |
| `pig_job` | Job is a Pig job. | false | None | None |
| `prerequisite_step_ids` | The optional list of prerequisite job step_ids. If not specified, the job will start at the beginning of workflow. | false | None | None |
| `presto_job` | Job is a Presto job. | false | None | None |
| `pyspark_job` | Job is a PySpark job. | false | None | None |
| `scheduling` | Job scheduling configuration. | false | None | None |
| `spark_job` | Job is a Spark job. | false | None | None |
| `spark_r_job` | Job is a SparkR job. | false | None | None |
| `spark_sql_job` | Job is a SparkSql job. | false | None | None |
| `step_id` | Required. The step id. The id must be unique among all jobs within the template. The step id is used as prefix for job id, as job `goog-dataproc-workflow-step-id` label, and in field from other steps. The id must contain only letters (a-z, A-Z), numbers (0-9), underscores (_), and hyphens (-). Cannot begin or end with underscore or hyphen. Must consist of between 3 and 50 characters. | true | None | None |

### placement Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster_selector` | A selector that chooses target cluster for jobs based on metadata. The selector is evaluated at the time each job is submitted. | false | None | None |
| `managed_cluster` | A cluster that is managed by the workflow. | false | None | None |

### config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `autoscaling_config` | Autoscaling config for the policy associated with the cluster. Cluster does not autoscale if this field is unset. | false | None | None |
| `encryption_config` | Encryption settings for the cluster. | false | None | None |
| `endpoint_config` | Port/endpoint configuration for this cluster | false | None | None |
| `gce_cluster_config` | The shared Compute Engine config settings for all instances in a cluster. | false | None | None |
| `gke_cluster_config` | The Kubernetes Engine config for Dataproc clusters deployed to Kubernetes. Setting this is considered mutually exclusive with Compute Engine-based options such as `gce_cluster_config`, `master_config`, `worker_config`, `secondary_worker_config`, and `autoscaling_config`. | false | None | None |
| `initialization_actions` | Commands to execute on each node after config is completed. By default, executables are run on master and all worker nodes. You can test a node's `role` metadata to run an executable on a master or worker node, as shown below using `curl` (you can also use `wget`): ROLE=$(curl -H Metadata-Flavor:Google http://metadata/computeMetadata/v1/instance/attributes/dataproc-role) if ; then ... master specific actions ... else ... worker specific actions ... fi | false | None | None |
| `lifecycle_config` | Lifecycle setting for the cluster. | false | None | None |
| `master_config` | The Compute Engine config settings for additional worker instances in a cluster. | false | None | None |
| `metastore_config` | Metastore configuration. | false | None | None |
| `secondary_worker_config` | The Compute Engine config settings for additional worker instances in a cluster. | false | None | None |
| `security_config` | Security settings for the cluster. | false | None | None |
| `software_config` | The config settings for software inside the cluster. | false | None | None |
| `staging_bucket` | A Cloud Storage bucket used to stage job dependencies, config files, and job driver console output. If you do not specify a staging bucket, Cloud Dataproc will determine a Cloud Storage location (US, ASIA, or EU) for your cluster's staging bucket according to the Compute Engine zone where your cluster is deployed, and then create and manage this project-level, per-location bucket (see [Dataproc staging and temp buckets](https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/staging-bucket)). | false | None | None |
| `temp_bucket` | A Cloud Storage bucket used to store ephemeral cluster and jobs data, such as Spark and MapReduce history files. If you do not specify a temp bucket, Dataproc will determine a Cloud Storage location (US, ASIA, or EU) for your cluster's temp bucket according to the Compute Engine zone where your cluster is deployed, and then create and manage this project-level, per-location bucket. The default bucket has a TTL of 90 days, but you can use any TTL (or none) if you specify a bucket. | false | None | None |
| `worker_config` | The Compute Engine config settings for additional worker instances in a cluster. - - - | false | None | None |
| `dag_timeout` | (Beta only) Optional. Timeout duration for the DAG of jobs. You can use "s", "m", "h", and "d" suffixes for second, minute, hour, and day duration values, respectively. The timeout duration must be from 10 minutes ("10m") to 24 hours ("24h" or "1d"). The timer begins when the first job is submitted. If the workflow is running at the end of the timeout period, any remaining jobs are cancelled, the workflow is ended, and if the workflow was running on a (/dataproc/docs/concepts/workflows/using-workflows#configuring_or_selecting_a_cluster), the cluster is deleted. | false | None | None |
| `labels` | The labels to associate with this template. These labels will be propagated to all jobs and clusters created by the workflow instance. Label **keys** must contain 1 to 63 characters, and must conform to [RFC 1035](https://www.ietf.org/rfc/rfc1035.txt). No more than 32 labels can be associated with a template. | false | None | None |
| `parameters` | Template parameters whose values are substituted into the template. Values for parameters must be provided when the template is instantiated. | false | None | None |
| `project` | The project for the resource | false | None | None |
| `version` | Used to perform a consistent read-modify-write. This field should be left blank for a `CreateWorkflowTemplate` request. It is required for an `UpdateWorkflowTemplate` request, and must match the current server version. A typical update template flow would fetch the current template with a `GetWorkflowTemplate` request, which will return the current template with the `version` field filled in with the current server version. The user updates other fields in the template, then returns it as part of the `UpdateWorkflowTemplate` request. | false | None | None |

### hadoop_job Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `archive_uris` | HCFS URIs of archives to be extracted in the working directory of Hadoop drivers and tasks. Supported file types: .jar, .tar, .tar.gz, .tgz, or .zip. | false | None | None |
| `args` | The arguments to pass to the driver. Do not include arguments, such as `-libjars` or `-Dfoo=bar`, that can be set as job properties, since a collision may occur that causes an incorrect job submission. | false | None | None |
| `file_uris` | HCFS (Hadoop Compatible Filesystem) URIs of files to be copied to the working directory of Hadoop drivers and distributed tasks. Useful for naively parallel tasks. | false | None | None |
| `jar_file_uris` | Jar file URIs to add to the CLASSPATHs of the Hadoop driver and tasks. | false | None | None |
| `logging_config` | The runtime log config for job execution. | false | None | None |
| `main_class` | The name of the driver's main class. The jar file containing the class must be in the default CLASSPATH or specified in `jar_file_uris`. | false | None | None |
| `main_jar_file_uri` | The HCFS URI of the jar file containing the main class. Examples: 'gs://foo-bucket/analytics-binaries/extract-useful-metrics-mr.jar' 'hdfs:/tmp/test-samples/custom-wordcount.jar' 'file:///home/usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar' | false | None | None |
| `properties` | A mapping of property names to values, used to configure Hadoop. Properties that conflict with values set by the Dataproc API may be overwritten. Can include properties set in /etc/hadoop/conf/*-site and classes in user code. | false | None | None |

### logging_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `driver_log_levels` | The per-package log levels for the driver. This may include "root" package name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG' | false | None | None |

### hive_job Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `continue_on_failure` | Whether to continue executing queries if a query fails. The default value is `false`. Setting to `true` can be useful when executing independent parallel queries. | false | None | None |
| `jar_file_uris` | HCFS URIs of jar files to add to the CLASSPATH of the Hive server and Hadoop MapReduce (MR) tasks. Can contain Hive SerDes and UDFs. | false | None | None |
| `properties` | A mapping of property names and values, used to configure Hive. Properties that conflict with values set by the Dataproc API may be overwritten. Can include properties set in /etc/hadoop/conf/*-site.xml, /etc/hive/conf/hive-site.xml, and classes in user code. | false | None | None |
| `query_file_uri` | The HCFS URI of the script that contains Hive queries. | false | None | None |
| `query_list` | A list of queries. | false | None | None |
| `script_variables` | Mapping of query variable names to values (equivalent to the Hive command: `SET name="value";`). | false | None | None |

### query_list Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `queries` | Required. The queries to execute. You do not need to end a query expression with a semicolon. Multiple queries can be specified in one string by separating each with a semicolon. Here is an example of a Dataproc API snippet that uses a QueryList to specify a HiveJob: "hiveJob": { "queryList": { "queries": } } | true | None | None |

### pig_job Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `continue_on_failure` | Whether to continue executing queries if a query fails. The default value is `false`. Setting to `true` can be useful when executing independent parallel queries. | false | None | None |
| `jar_file_uris` | HCFS URIs of jar files to add to the CLASSPATH of the Pig Client and Hadoop MapReduce (MR) tasks. Can contain Pig UDFs. | false | None | None |
| `logging_config` | The runtime log config for job execution. | false | None | None |
| `properties` | A mapping of property names to values, used to configure Pig. Properties that conflict with values set by the Dataproc API may be overwritten. Can include properties set in /etc/hadoop/conf/*-site.xml, /etc/pig/conf/pig.properties, and classes in user code. | false | None | None |
| `query_file_uri` | The HCFS URI of the script that contains the Pig queries. | false | None | None |
| `query_list` | A list of queries. | false | None | None |
| `script_variables` | Mapping of query variable names to values (equivalent to the Pig command: `name=`). | false | None | None |

### presto_job Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `client_tags` | Presto client tags to attach to this query | false | None | None |
| `continue_on_failure` | Whether to continue executing queries if a query fails. The default value is `false`. Setting to `true` can be useful when executing independent parallel queries. | false | None | None |
| `logging_config` | The runtime log config for job execution. | false | None | None |
| `output_format` | The format in which query output will be displayed. See the Presto documentation for supported output formats | false | None | None |
| `properties` | A mapping of property names to values. Used to set Presto (https://prestodb.io/docs/current/sql/set-session.html) Equivalent to using the --session flag in the Presto CLI | false | None | None |
| `query_file_uri` | The HCFS URI of the script that contains SQL queries. | false | None | None |
| `query_list` | A list of queries. | false | None | None |

### pyspark_job Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `archive_uris` | HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. | false | None | None |
| `args` | The arguments to pass to the driver. Do not include arguments, such as `--conf`, that can be set as job properties, since a collision may occur that causes an incorrect job submission. | false | None | None |
| `file_uris` | HCFS URIs of files to be placed in the working directory of each executor. Useful for naively parallel tasks. | false | None | None |
| `jar_file_uris` | HCFS URIs of jar files to add to the CLASSPATHs of the Python driver and tasks. | false | None | None |
| `logging_config` | The runtime log config for job execution. | false | None | None |
| `main_python_file_uri` | Required. The HCFS URI of the main Python file to use as the driver. Must be a .py file. | true | None | None |
| `properties` | A mapping of property names to values, used to configure PySpark. Properties that conflict with values set by the Dataproc API may be overwritten. Can include properties set in /etc/spark/conf/spark-defaults.conf and classes in user code. | false | None | None |
| `python_file_uris` | HCFS file URIs of Python files to pass to the PySpark framework. Supported file types: .py, .egg, and .zip. | false | None | None |

### scheduling Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_failures_per_hour` | Maximum number of times per hour a driver may be restarted as a result of driver exiting with non-zero code before job is reported failed. A job may be reported as thrashing if driver exits with non-zero code 4 times within 10 minute window. Maximum value is 10. | false | None | None |
| `max_failures_total` | Maximum number of times in total a driver may be restarted as a result of driver exiting with non-zero code before job is reported failed. Maximum value is 240 | false | None | None |

### spark_job Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `archive_uris` | HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. | false | None | None |
| `args` | The arguments to pass to the driver. Do not include arguments, such as `--conf`, that can be set as job properties, since a collision may occur that causes an incorrect job submission. | false | None | None |
| `file_uris` | HCFS URIs of files to be placed in the working directory of each executor. Useful for naively parallel tasks. | false | None | None |
| `jar_file_uris` | HCFS URIs of jar files to add to the CLASSPATHs of the Spark driver and tasks. | false | None | None |
| `logging_config` | The runtime log config for job execution. | false | None | None |
| `main_class` | The name of the driver's main class. The jar file that contains the class must be in the default CLASSPATH or specified in `jar_file_uris`. | false | None | None |
| `main_jar_file_uri` | The HCFS URI of the jar file that contains the main class. | false | None | None |
| `properties` | A mapping of property names to values, used to configure Spark. Properties that conflict with values set by the Dataproc API may be overwritten. Can include properties set in /etc/spark/conf/spark-defaults.conf and classes in user code. | false | None | None |

### spark_r_job Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `archive_uris` | HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. | false | None | None |
| `args` | The arguments to pass to the driver. Do not include arguments, such as `--conf`, that can be set as job properties, since a collision may occur that causes an incorrect job submission. | false | None | None |
| `file_uris` | HCFS URIs of files to be placed in the working directory of each executor. Useful for naively parallel tasks. | false | None | None |
| `logging_config` | The runtime log config for job execution. | false | None | None |
| `main_r_file_uri` | Required. The HCFS URI of the main R file to use as the driver. Must be a .R file. | true | None | None |
| `properties` | A mapping of property names to values, used to configure SparkR. Properties that conflict with values set by the Dataproc API may be overwritten. Can include properties set in /etc/spark/conf/spark-defaults.conf and classes in user code. | false | None | None |

### spark_sql_job Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `jar_file_uris` | HCFS URIs of jar files to be added to the Spark CLASSPATH. | false | None | None |
| `logging_config` | The runtime log config for job execution. | false | None | None |
| `properties` | A mapping of property names to values, used to configure Spark SQL's SparkConf. Properties that conflict with values set by the Dataproc API may be overwritten. | false | None | None |
| `query_file_uri` | The HCFS URI of the script that contains SQL queries. | false | None | None |
| `query_list` | A list of queries. | false | None | None |
| `script_variables` | Mapping of query variable names to values (equivalent to the Spark SQL command: SET `name="value";`). | false | None | None |

### parameters Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | Brief description of the parameter. Must not exceed 1024 characters. | false | None | None |
| `fields` | Required. Paths to all fields that the parameter replaces. A field is allowed to appear in at most one parameter's list of field paths. A field path is similar in syntax to a .sparkJob.args | true | None | None |
| `name` | Required. Parameter name. The parameter name is used as the key, and paired with the parameter value, which are passed to the template when the template is instantiated. The name must contain only capital letters (A-Z), numbers (0-9), and underscores (_), and must not start with a number. The maximum length is 40 characters. | true | None | None |
| `validation` | Validation rules to be applied to this parameter's value. | false | None | None |

### validation Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `regex` | Validation based on regular expressions. | false | None | None |
| `values` | Validation based on a list of allowed values. | false | None | None |

### regex Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `regexes` | Required. RE2 regular expressions used to validate the parameter's value. The value must match the regex in its entirety (substring matches are not sufficient). | true | None | None |

### values Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `values` | Required. List of allowed values for the parameter. | true | None | None |

### cluster_selector Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster_labels` | Required. The cluster labels. Cluster must have all labels to match. | true | None | None |
| `zone` | The zone where workflow process executes. This parameter does not affect the selection of the cluster. If unspecified, the zone of the first cluster matching the selector is used. | false | None | None |

### managed_cluster Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster_name` | Required. The cluster name prefix. A unique cluster name will be formed by appending a random suffix. The name must contain only lower-case letters (a-z), numbers (0-9), and hyphens (-). Must begin with a letter. Cannot begin or end with hyphen. Must consist of between 2 and 35 characters. | true | None | None |
| `config` | Required. The cluster configuration. | true | None | None |
| `labels` | The labels to associate with this cluster. Label keys must be between 1 and 63 characters long, and must conform to the following PCRE regular expression: {0,63} No more than 32 labels can be associated with a given cluster. | false | None | None |

### master_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `accelerators` | The Compute Engine accelerator configuration for these instances. | false | None | None |
| `disk_config` | Disk option config settings. | false | None | None |
| `image` | The Compute Engine image resource used for cluster instances. The URI can represent an image or image family. Image examples: * `https://www.googleapis.com/compute/beta/projects/` If the URI is unspecified, it will be inferred from `SoftwareConfig.image_version` or the system default. | false | None | None |
| `machine_type` | The Compute Engine machine type used for cluster instances. A full URL, partial URI, or short name are valid. Examples: * `https://www.googleapis.com/compute/v1/projects/(https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/auto-zone#using_auto_zone_placement) feature, you must use the short name of the machine type resource, for example, `n1-standard-2`. | false | None | None |
| `min_cpu_platform` | Specifies the minimum cpu platform for the Instance Group. See [Minimum CPU platform](https://cloud.google.com/dataproc/docs/concepts/compute/dataproc-min-cpu). | false | None | None |
| `num_instances` | The number of VM instances in the instance group. For master instance groups, must be set to 1. | false | None | None |
| `preemptibility` | Specifies the preemptibility of the instance group. The default value for master and worker groups is `NON_PREEMPTIBLE`. This default cannot be changed. The default value for secondary instances is `PREEMPTIBLE`. Possible values: PREEMPTIBILITY_UNSPECIFIED, NON_PREEMPTIBLE, PREEMPTIBLE | false | None | None |
| `instance_names` | Output only. The list of instance names. Dataproc derives the names from `cluster_name`, `num_instances`, and the instance group. | none | None | None |
| `is_preemptible` | Output only. Specifies that this instance group contains preemptible instances. | none | None | None |
| `managed_group_config` | Output only. The config for Compute Engine Instance Group Manager that manages this group. This is only used for preemptible instance groups. | none | None | None |

### accelerators Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `accelerator_count` | The number of the accelerator cards of this type exposed to this instance. | false | None | None |
| `accelerator_type` | Full URL, partial URI, or short name of the accelerator type resource to expose to this instance. See (https://cloud.google.com/dataproc/docs/concepts/configuring-clusters/auto-zone#using_auto_zone_placement) feature, you must use the short name of the accelerator type resource, for example, `nvidia-tesla-k80`. | false | None | None |

### disk_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `boot_disk_size_gb` | Size in GB of the boot disk (default is 500GB). | false | None | None |
| `boot_disk_type` | Type of the boot disk (default is "pd-standard"). Valid values: "pd-ssd" (Persistent Disk Solid State Drive) or "pd-standard" (Persistent Disk Hard Disk Drive). | false | None | None |
| `num_local_ssds` | Number of attached SSDs, from 0 to 4 (default is 0). If SSDs are not attached, the boot disk is used to store runtime logs and (https://hadoop.apache.org/docs/r1.2.1/hdfs_user_guide.html) data. If one or more SSDs are attached, this runtime bulk data is spread across them, and the boot disk contains only basic config and installed binaries. | false | None | None |

### autoscaling_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `policy` | The autoscaling policy used by the cluster. Only resource names including projectid and location (region) are valid. Examples: * `https://www.googleapis.com/compute/v1/projects/` Note that the policy must be in the same project and Dataproc region. | false | None | None |

### encryption_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `gce_pd_kms_key_name` | The Cloud KMS key name to use for PD disk encryption for all instances in the cluster. | false | None | None |

### endpoint_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_http_port_access` | If true, enable http access to specific ports on the cluster from external sources. Defaults to false. | false | None | None |
| `http_ports` | Output only. The map of port descriptions to URLs. Will only be populated if enable_http_port_access is true. | none | None | None |

### gce_cluster_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `internal_ip_only` | If true, all instances in the cluster will only have internal IP addresses. By default, clusters are not restricted to internal IP addresses, and will have ephemeral external IP addresses assigned to each instance. This `internal_ip_only` restriction can only be enabled for subnetwork enabled networks, and all off-cluster dependencies must be configured to be accessible without external IP addresses. | false | None | None |
| `metadata` | The Compute Engine metadata entries to add to all instances (see [About VM metadata](https://cloud.google.com/compute/docs/metadata/overview)). | false | None | None |
| `network` | The Compute Engine network to be used for machine communications. Cannot be specified with subnetwork_uri. If neither `network_uri` nor `subnetwork_uri` is specified, the "default" network of the project is used, if it exists. Cannot be a "Custom Subnet Network" (see /regions/global/default` * `default` | false | None | None |
| `node_group_affinity` | Node Group Affinity for sole-tenant clusters. | false | None | None |
| `private_ipv6_google_access` | The type of IPv6 access for a cluster. Possible values: PRIVATE_IPV6_GOOGLE_ACCESS_UNSPECIFIED, INHERIT_FROM_SUBNETWORK, OUTBOUND, BIDIRECTIONAL | false | None | None |
| `reservation_affinity` | Reservation Affinity for consuming Zonal reservation. | false | None | None |
| `service_account` | The (https://cloud.google.com/compute/docs/access/service-accounts#default_service_account) is used. | false | None | None |
| `service_account_scopes` | The URIs of service account scopes to be included in Compute Engine instances. The following base set of scopes is always included: * https://www.googleapis.com/auth/cloud.useraccounts.readonly * https://www.googleapis.com/auth/devstorage.read_write * https://www.googleapis.com/auth/logging.write If no scopes are specified, the following defaults are also provided: * https://www.googleapis.com/auth/bigquery * https://www.googleapis.com/auth/bigtable.admin.table * https://www.googleapis.com/auth/bigtable.data * https://www.googleapis.com/auth/devstorage.full_control | false | None | None |
| `shielded_instance_config` | Shielded Instance Config for clusters using [Compute Engine Shielded VMs](https://cloud.google.com/security/shielded-cloud/shielded-vm). Structure [defined below](#nested_shielded_instance_config). | false | None | None |
| `subnetwork` | The Compute Engine subnetwork to be used for machine communications. Cannot be specified with network_uri. A full URL, partial URI, or short name are valid. Examples: * `https://www.googleapis.com/compute/v1/projects//regions/us-east1/subnetworks/sub0` * `sub0` | false | None | None |
| `tags` | The Compute Engine tags to add to all instances (see [Manage tags for resources](https://cloud.google.com/compute/docs/tag-resources)). | false | None | None |
| `zone` | The zone where the Compute Engine cluster will be located. On a create request, it is required in the "global" region. If omitted in a non-global Dataproc region, the service will pick a zone in the corresponding Compute Engine region. On a get request, zone will always be present. A full URL, partial URI, or short name are valid. Examples: * `https://www.googleapis.com/compute/v1/projects/` * `us-central1-f` | false | None | None |

### node_group_affinity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_group` | Required. The URI of a sole-tenant /zones/us-central1-a/nodeGroups/node-group-1` * `node-group-1` | true | None | None |

### reservation_affinity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `consume_reservation_type` | Type of reservation to consume Possible values: TYPE_UNSPECIFIED, NO_RESERVATION, ANY_RESERVATION, SPECIFIC_RESERVATION | false | None | None |
| `key` | Corresponds to the label key of reservation resource. | false | None | None |
| `values` | Corresponds to the label values of reservation resource. | false | None | None |

### shielded_instance_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_secure_boot` | Defines whether instances have [Secure Boot](https://cloud.google.com/compute/shielded-vm/docs/shielded-vm#secure-boot) enabled. | false | None | None |
| `enable_vtpm` | Defines whether instances have the [vTPM](https://cloud.google.com/compute/shielded-vm/docs/shielded-vm#vtpm) enabled. | false | None | None |
| `enable_integrity_monitoring` | Defines whether instances have [Integrity Monitoring](https://cloud.google.com/compute/shielded-vm/docs/shielded-vm#integrity-monitoring) enabled. | false | None | None |

### gke_cluster_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `namespaced_gke_deployment_target` | A target for the deployment. | false | None | None |

### namespaced_gke_deployment_target Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster_namespace` | A namespace within the GKE cluster to deploy into. | false | None | None |
| `target_gke_cluster` | The target GKE cluster to deploy to. Format: 'projects/{project}/locations/{location}/clusters/{cluster_id}' | false | None | None |

### initialization_actions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `executable_file` | Required. Cloud Storage URI of executable file. | false | None | None |
| `execution_timeout` | Amount of time executable has to complete. Default is 10 minutes (see JSON representation of [JSON Mapping - Language Guide (proto 3)](https://developers.google.com/protocol-buffers/docs/proto3#json)). Cluster creation fails with an explanatory error message (the name of the executable that caused the error and the exceeded timeout period) if the executable is not completed at end of the timeout period. | false | None | None |

### lifecycle_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auto_delete_time` | The time when cluster will be auto-deleted (see JSON representation of [JSON Mapping - Language Guide (proto 3)](https://developers.google.com/protocol-buffers/docs/proto3#json)). | false | None | None |
| `auto_delete_ttl` | The lifetime duration of cluster. The cluster will be auto-deleted at the end of this period. Minimum value is 10 minutes; maximum value is 14 days (see JSON representation of [JSON Mapping - Language Guide (proto 3)](https://developers.google.com/protocol-buffers/docs/proto3#json)). | false | None | None |
| `idle_delete_ttl` | The duration to keep the cluster alive while idling (when no jobs are running). Passing this threshold will cause the cluster to be deleted. Minimum value is 5 minutes; maximum value is 14 days (see JSON representation of [JSON Mapping - Language Guide (proto 3)](https://developers.google.com/protocol-buffers/docs/proto3#json). | false | None | None |
| `idle_start_time` | Output only. The time when cluster became idle (most recent job finished) and became eligible for deletion due to idleness (see JSON representation of [JSON Mapping - Language Guide (proto 3)](https://developers.google.com/protocol-buffers/docs/proto3#json)). | none | None | None |

### metastore_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataproc_metastore_service` | Required. Resource name of an existing Dataproc Metastore service. Example: * `projects/` | true | None | None |

### security_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kerberos_config` | Kerberos related configuration. | false | None | None |

### kerberos_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cross_realm_trust_admin_server` | The admin server (IP or hostname) for the remote trusted realm in a cross realm trust relationship. | false | None | None |
| `cross_realm_trust_kdc` | The KDC (IP or hostname) for the remote trusted realm in a cross realm trust relationship. | false | None | None |
| `cross_realm_trust_realm` | The remote realm the Dataproc on-cluster KDC will trust, should the user enable cross realm trust. | false | None | None |
| `cross_realm_trust_shared_password` | The Cloud Storage URI of a KMS encrypted file containing the shared password between the on-cluster Kerberos realm and the remote trusted realm, in a cross realm trust relationship. | false | None | None |
| `enable_kerberos` | Flag to indicate whether to Kerberize the cluster (default: false). Set this field to true to enable Kerberos on a cluster. | false | None | None |
| `kdc_db_key` | The Cloud Storage URI of a KMS encrypted file containing the master key of the KDC database. | false | None | None |
| `key_password` | The Cloud Storage URI of a KMS encrypted file containing the password to the user provided key. For the self-signed certificate, this password is generated by Dataproc. | false | None | None |
| `keystore` | The Cloud Storage URI of the keystore file used for SSL encryption. If not provided, Dataproc will provide a self-signed certificate. | false | None | None |
| `keystore_password` | The Cloud Storage URI of a KMS encrypted file containing the password to the user provided keystore. For the self-signed certificate, this password is generated by Dataproc. | false | None | None |
| `kms_key` | The uri of the KMS key used to encrypt various sensitive files. | false | None | None |
| `realm` | The name of the on-cluster Kerberos realm. If not specified, the uppercased domain of hostnames will be the realm. | false | None | None |
| `root_principal_password` | The Cloud Storage URI of a KMS encrypted file containing the root principal password. | false | None | None |
| `tgt_lifetime_hours` | The lifetime of the ticket granting ticket, in hours. If not specified, or user specifies 0, then default value 10 will be used. | false | None | None |
| `truststore` | The Cloud Storage URI of the truststore file used for SSL encryption. If not provided, Dataproc will provide a self-signed certificate. | false | None | None |
| `truststore_password` | The Cloud Storage URI of a KMS encrypted file containing the password to the user provided truststore. For the self-signed certificate, this password is generated by Dataproc. | false | None | None |

### software_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `image_version` | The version of software inside the cluster. It must be one of the supported [Dataproc Versions](https://cloud.google.com/dataproc/docs/concepts/versioning/dataproc-versions#supported_dataproc_versions), such as "1.2" (including a subminor version, such as "1.2.29"), or the ["preview" version](https://cloud.google.com/dataproc/docs/concepts/versioning/dataproc-versions#other_versions). If unspecified, it defaults to the latest Debian version. | false | None | None |
| `optional_components` | The set of components to activate on the cluster. | false | None | None |
| `properties` | The properties to set on daemon config files. Property keys are specified in `prefix:property` format, for example `core:hadoop.tmp.dir`. The following are supported prefixes and their mappings: * capacity-scheduler: `capacity-scheduler.xml` * core: `core-site.xml` * distcp: `distcp-default.xml` * hdfs: `hdfs-site.xml` * hive: `hive-site.xml` * mapred: `mapred-site.xml` * pig: `pig.properties` * spark: `spark-defaults.conf` * yarn: `yarn-site.xml` For more information, see [Cluster properties](https://cloud.google.com/dataproc/docs/concepts/cluster-properties). | false | None | None |
