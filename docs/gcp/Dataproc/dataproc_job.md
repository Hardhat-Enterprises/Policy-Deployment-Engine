## 🛡️ Policy Deployment Engine: `dataproc_job`

This section provides a concise policy evaluation for the `dataproc_job` resource in GCP.

Reference: [Terraform Registry – dataproc_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_job)

---

## 1. Argument Reference

### `placement.cluster_name`
- Description: will be submitted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `xxx_config`
- Description: cluster should be specified. If you want to submit multiple jobs, this will currently require the definition of multiple `google_dataproc_job` resources as shown in the example above, or by setting the `count` attribute. The following job configs are supported: * [pyspark_config](#nested_pyspark_config)  - Submits a PySpark job to the cluster * [spark_config](#nested_spark_config)    - Submits a Spark job to the cluster * [hadoop_config](#nested_hadoop_config)   - Submits a Hadoop job to the cluster * [hive_config](#nested_hive_config)     - Submits a Hive job to the cluster * [hpig_config](#nested_hpig_config)     - Submits a Pig job to the cluster * [sparksql_config](#nested_sparksql_config) - Submits a Spark SQL job to the cluster * [presto_config](#nested_presto_config) - Submits a Presto job to the cluster - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: subsequently run against. If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: for this job to be submitted to. If not specified, defaults to `global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_delete`
- Description: Dataproc. Setting this to true, and calling destroy, will ensure that the job is first cancelled before issuing the delete.
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

### `scheduling.max_failures_per_hour`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scheduling.max_failures_total`
- Description: <a name="nested_pyspark_config"></a>The `pyspark_config` block supports: Submitting a pyspark job to the cluster. Below is an example configuration: ```hcl # Submit a pyspark job to the cluster resource "google_dataproc_job" "pyspark" { ... pyspark_config { main_python_file_uri = "gs://dataproc-examples-2f10d78d114f6aaec76462e3c310f31f/src/pyspark/hello-world/hello-world.py" properties = { "spark.logConf" = "true" } } } ``` For configurations requiring Hadoop Compatible File System (HCFS) references, the options below are generally applicable: - GCS files with the `gs://` prefix - HDFS files on the cluster with the `hdfs://` prefix - Local files on the cluster with the `file://` prefix
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `python_file_uris`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_uris`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_jar_file_uri`
- Description: the driver jar. Conflicts with `main_class`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_uris`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_jar_file_uri`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_uris`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_file_uri`
- Description: Conflicts with `query_list`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `continue_on_failure`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script_variables`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: <a name="nested_pig_config"></a>The `pig_config` block supports: ```hcl # Submit a pig job to the cluster resource "google_dataproc_job" "pig" { ... pig_config { query_list = [ "LNS = LOAD 'file:///usr/lib/pig/LICENSE.txt ' AS (line)", "WORDS = FOREACH LNS GENERATE FLATTEN(TOKENIZE(line)) AS word", "GROUPS = GROUP WORDS BY word", "WORD_COUNTS = FOREACH GROUPS GENERATE group, COUNT(WORDS)", "DUMP WORD_COUNTS", ] } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_file_uri`
- Description: Conflicts with `query_list`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `continue_on_failure`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script_variables`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_file_uri`
- Description: Conflicts with `query_list`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script_variables`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_tags`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `continue_on_failure`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_file_uri`
- Description: Conflicts with `query_list`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_format`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
