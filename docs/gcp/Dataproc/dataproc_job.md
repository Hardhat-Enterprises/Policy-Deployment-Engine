## 🛡️ Policy Deployment Engine: `dataproc_job`

This section provides a concise policy evaluation for the `dataproc_job` resource in GCP.

Reference: [Terraform Registry – dataproc_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_job)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `placement.cluster_name` | will be submitted. | none | None | None |
| `xxx_config` | cluster should be specified. If you want to submit multiple jobs, this will currently require the definition of multiple `google_dataproc_job` resources as shown in the example above, or by setting the `count` attribute. The following job configs are supported: * [pyspark_config](#nested_pyspark_config)  - Submits a PySpark job to the cluster * [spark_config](#nested_spark_config)    - Submits a Spark job to the cluster * [hadoop_config](#nested_hadoop_config)   - Submits a Hadoop job to the cluster * [hive_config](#nested_hive_config)     - Submits a Hive job to the cluster * [hpig_config](#nested_hpig_config)     - Submits a Pig job to the cluster * [sparksql_config](#nested_sparksql_config) - Submits a Spark SQL job to the cluster * [presto_config](#nested_presto_config) - Submits a Presto job to the cluster - - - | none | None | None |
| `project` | subsequently run against. If it is not provided, the provider project is used. | none | None | None |
| `region` | for this job to be submitted to. If not specified, defaults to `global`. | none | None | None |
| `force_delete` | Dataproc. Setting this to true, and calling destroy, will ensure that the job is first cancelled before issuing the delete. | none | None | None |
| `labels` | **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource. | none | None | None |
| `terraform_labels` | The combination of labels configured directly on the resource and default labels configured on the provider. | none | None | None |
| `effective_labels` | All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. | none | None | None |
| `scheduling.max_failures_per_hour` |  | none | None | None |
| `scheduling.max_failures_total` |  | none | None | None |

### pyspark_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `args` |  | none | None | None |
| `python_file_uris` |  | none | None | None |
| `jar_file_uris` |  | none | None | None |
| `file_uris` |  | none | None | None |
| `archive_uris` |  | none | None | None |
| `properties` | * `logging_config.driver_log_levels`- (Required) The per-package log levels for the driver. This may include 'root' package name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG' | none | None | None |

### spark_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `main_jar_file_uri` | the driver jar. Conflicts with `main_class` | none | None | None |
| `args` |  | none | None | None |
| `jar_file_uris` |  | none | None | None |
| `file_uris` |  | none | None | None |
| `archive_uris` |  | none | None | None |
| `properties` | * `logging_config.driver_log_levels`- (Required) The per-package log levels for the driver. This may include 'root' package name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG' | none | None | None |

### hadoop_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `main_jar_file_uri` |  | none | None | None |
| `args` |  | none | None | None |
| `jar_file_uris` |  | none | None | None |
| `file_uris` |  | none | None | None |
| `archive_uris` |  | none | None | None |
| `properties` | * `logging_config.driver_log_levels`- (Required) The per-package log levels for the driver. This may include 'root' package name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG' | none | None | None |

### hive_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `query_file_uri` | Conflicts with `query_list` | none | None | None |
| `continue_on_failure` |  | none | None | None |
| `script_variables` |  | none | None | None |
| `properties` |  | none | None | None |
| `jar_file_uris` |  | none | None | None |

### pig_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `query_file_uri` | Conflicts with `query_list` | none | None | None |
| `continue_on_failure` |  | none | None | None |
| `script_variables` |  | none | None | None |
| `properties` |  | none | None | None |
| `jar_file_uris` | * `logging_config.driver_log_levels`- (Required) The per-package log levels for the driver. This may include 'root' package name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG' | none | None | None |

### sparksql_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `query_file_uri` | Conflicts with `query_list` | none | None | None |
| `script_variables` |  | none | None | None |
| `properties` |  | none | None | None |
| `jar_file_uris` | * `logging_config.driver_log_levels`- (Required) The per-package log levels for the driver. This may include 'root' package name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG' | none | None | None |

### presto_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `client_tags` |  | none | None | None |
| `continue_on_failure` | * `query_list`- (Optional) The list of SQL queries or statements to execute as part of the job. Conflicts with `query_file_uri` | none | None | None |
| `query_file_uri` | Conflicts with `query_list` | none | None | None |
| `properties` |  | none | None | None |
| `output_format` | * `logging_config.driver_log_levels`- (Required) The per-package log levels for the driver. This may include 'root' package name to configure rootLogger. Examples: 'com.google = FATAL', 'root = INFO', 'org.apache = DEBUG' | none | None | None |
