## 🛡️ Policy Deployment Engine: `dataproc_gdc_spark_application`

This section provides a concise policy evaluation for the `dataproc_gdc_spark_application` resource in GCP.

Reference: [Terraform Registry – dataproc_gdc_spark_application](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_gdc_spark_application)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the spark application. | true | None | None |
| `serviceinstance` | The id of the service instance to which this spark application belongs. | true | None | None |
| `spark_application_id` | The id of the application | true | None | None |
| `display_name` | User-provided human-readable name to be used in user interfaces. | false | None | None |
| `labels` | The labels to associate with this application. Labels may be used for filtering and billing tracking. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `annotations` | The annotations to associate with this application. Annotations may be used to store client information, but are not used by the server. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `properties` | application-specific properties. | false | None | None |
| `version` | The Dataproc version of this application. | false | None | None |
| `application_environment` | An ApplicationEnvironment from which to inherit configuration properties. | false | None | None |
| `namespace` | The Kubernetes namespace in which to create the application. This namespace must already exist on the cluster. | false | None | None |
| `dependency_images` | List of container image uris for additional file dependencies. Dependent files are sequentially copied from each image. If a file with the same name exists in 2 images then the file from later image is used. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### pyspark_application_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `main_python_file_uri` | The HCFS URI of the main Python file to use as the driver. Must be a .py file. | true | None | None |
| `args` | The arguments to pass to the driver.  Do not include arguments, such as `--conf`, that can be set as job properties, since a collision may occur that causes an incorrect job submission. | false | None | None |
| `python_file_uris` | HCFS file URIs of Python files to pass to the PySpark framework. Supported file types: .py, .egg, and .zip. | false | None | None |
| `jar_file_uris` | HCFS URIs of jar files to add to the CLASSPATHs of the Python driver and tasks. | false | None | None |
| `file_uris` | HCFS URIs of files to be placed in the working directory of each executor. Useful for naively parallel tasks. | false | None | None |
| `archive_uris` | HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. | false | None | None |

### spark_application_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `main_jar_file_uri` | The HCFS URI of the jar file that contains the main class. | false | None | None |
| `main_class` | The name of the driver main class. The jar file that contains the class must be in the classpath or specified in `jar_file_uris`. | false | None | None |
| `args` | The arguments to pass to the driver. Do not include arguments that can be set as application properties, such as `--conf`, since a collision can occur that causes an incorrect application submission. | false | None | None |
| `jar_file_uris` | HCFS URIs of jar files to add to the classpath of the Spark driver and tasks. | false | None | None |
| `file_uris` | HCFS URIs of files to be placed in the working directory of each executor. | false | None | None |
| `archive_uris` | HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: `.jar`, `.tar`, `.tar.gz`, `.tgz`, and `.zip`. | false | None | None |

### spark_r_application_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `main_r_file_uri` | The HCFS URI of the main R file to use as the driver. Must be a .R file. | true | None | None |
| `args` | The arguments to pass to the driver.  Do not include arguments, such as `--conf`, that can be set as job properties, since a collision may occur that causes an incorrect job submission. | false | None | None |
| `file_uris` | HCFS URIs of files to be placed in the working directory of each executor. Useful for naively parallel tasks. | false | None | None |
| `archive_uris` | HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. | false | None | None |

### spark_sql_application_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `query_file_uri` | The HCFS URI of the script that contains SQL queries. | false | None | None |
| `query_list` | Represents a list of queries. Structure is [documented below](#nested_spark_sql_application_config_query_list). | false | None | None |
| `script_variables` | Mapping of query variable names to values (equivalent to the Spark SQL command: SET `name="value";`). | false | None | None |
| `jar_file_uris` | HCFS URIs of jar files to be added to the Spark CLASSPATH. | false | None | None |

### query_list Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `queries` | The queries to run. | true | None | None |
