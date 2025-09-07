## 🛡️ Policy Deployment Engine: `dataproc_gdc_spark_application`

This section provides a concise policy evaluation for the `dataproc_gdc_spark_application` resource in GCP.

Reference: [Terraform Registry – dataproc_gdc_spark_application](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_gdc_spark_application)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location of the spark application.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `serviceinstance`
- Description: (Required) The id of the service instance to which this spark application belongs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_application_id`
- Description: (Required) The id of the application
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pyspark_application_config`
- Description: (Optional) Represents the PySparkApplicationConfig. Structure is [documented below](#nested_pyspark_application_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_application_config`
- Description: (Optional) Represents the SparkApplicationConfig. Structure is [documented below](#nested_spark_application_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_r_application_config`
- Description: (Optional) Represents the SparkRApplicationConfig. Structure is [documented below](#nested_spark_r_application_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_sql_application_config`
- Description: (Optional) Represents the SparkRApplicationConfig. Structure is [documented below](#nested_spark_sql_application_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User-provided human-readable name to be used in user interfaces.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels to associate with this application. Labels may be used for filtering and billing tracking. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) The annotations to associate with this application. Annotations may be used to store client information, but are not used by the server. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) application-specific properties.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) The Dataproc version of this application.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `application_environment`
- Description: (Optional) An ApplicationEnvironment from which to inherit configuration properties.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace`
- Description: (Optional) The Kubernetes namespace in which to create the application. This namespace must already exist on the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dependency_images`
- Description: (Optional) List of container image uris for additional file dependencies. Dependent files are sequentially copied from each image. If a file with the same name exists in 2 images then the file from later image is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_pyspark_application_config"></a>The `pyspark_application_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_python_file_uri`
- Description: (Required) The HCFS URI of the main Python file to use as the driver. Must be a .py file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) The arguments to pass to the driver.  Do not include arguments, such as `--conf`, that can be set as job properties, since a collision may occur that causes an incorrect job submission.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `python_file_uris`
- Description: (Optional) HCFS file URIs of Python files to pass to the PySpark framework. Supported file types: .py, .egg, and .zip.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: (Optional) HCFS URIs of jar files to add to the CLASSPATHs of the Python driver and tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: (Optional) HCFS URIs of files to be placed in the working directory of each executor. Useful for naively parallel tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_uris`
- Description: (Optional) HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. <a name="nested_spark_application_config"></a>The `spark_application_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_jar_file_uri`
- Description: (Optional) The HCFS URI of the jar file that contains the main class.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_class`
- Description: (Optional) The name of the driver main class. The jar file that contains the class must be in the classpath or specified in `jar_file_uris`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) The arguments to pass to the driver. Do not include arguments that can be set as application properties, such as `--conf`, since a collision can occur that causes an incorrect application submission.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: (Optional) HCFS URIs of jar files to add to the classpath of the Spark driver and tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: (Optional) HCFS URIs of files to be placed in the working directory of each executor.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_uris`
- Description: (Optional) HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: `.jar`, `.tar`, `.tar.gz`, `.tgz`, and `.zip`. <a name="nested_spark_r_application_config"></a>The `spark_r_application_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_r_file_uri`
- Description: (Required) The HCFS URI of the main R file to use as the driver. Must be a .R file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) The arguments to pass to the driver.  Do not include arguments, such as `--conf`, that can be set as job properties, since a collision may occur that causes an incorrect job submission.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: (Optional) HCFS URIs of files to be placed in the working directory of each executor. Useful for naively parallel tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_uris`
- Description: (Optional) HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. <a name="nested_spark_sql_application_config"></a>The `spark_sql_application_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_file_uri`
- Description: (Optional) The HCFS URI of the script that contains SQL queries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_list`
- Description: (Optional) Represents a list of queries. Structure is [documented below](#nested_spark_sql_application_config_query_list).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script_variables`
- Description: (Optional) Mapping of query variable names to values (equivalent to the Spark SQL command: SET `name="value";`).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: (Optional) HCFS URIs of jar files to be added to the Spark CLASSPATH. <a name="nested_spark_sql_application_config_query_list"></a>The `query_list` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `queries`
- Description: (Required) The queries to run.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
