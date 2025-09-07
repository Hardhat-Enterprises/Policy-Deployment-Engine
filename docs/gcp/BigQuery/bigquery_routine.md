## 🛡️ Policy Deployment Engine: `bigquery_routine`

This section provides a concise policy evaluation for the `bigquery_routine` resource in GCP.

Reference: [Terraform Registry – bigquery_routine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_routine)

---

## 1. Argument Reference

### `dataset_id`
- Description: (Required) The ID of the dataset containing this routine
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `routine_id`
- Description: (Required) The ID of the the routine. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 256 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `routine_type`
- Description: (Required) The type of routine. Possible values are: `SCALAR_FUNCTION`, `PROCEDURE`, `TABLE_VALUED_FUNCTION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `definition_body`
- Description: (Required) The body of the routine. For functions, this is the expression in the AS clause. If language=SQL, it is the substring inside (but excluding) the parentheses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `language`
- Description: (Optional) The language of the routine. Possible values are: `SQL`, `JAVASCRIPT`, `PYTHON`, `JAVA`, `SCALA`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `arguments`
- Description: (Optional) Input/output argument of a function or a stored procedure. Structure is [documented below](#nested_arguments).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `return_type`
- Description: (Optional) A JSON schema for the return type. Optional if language = "SQL"; required otherwise. If absent, the return type is inferred from definitionBody at query time in each query that references this routine. If present, then the evaluated result will be cast to the specified returned type at query time. ~>**NOTE**: Because this field expects a JSON string, any changes to the string will create a diff, even if the JSON itself hasn't changed. If the API returns a different value for the same schema, e.g. it switche d the order of values or replaced STRUCT field type with RECORD field type, we currently cannot suppress the recurring diff this causes. As a workaround, we recommend using the schema as returned by the API.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `return_table_type`
- Description: (Optional) Optional. Can be set only if routineType = "TABLE_VALUED_FUNCTION". If absent, the return table type is inferred from definitionBody at query time in each query that references this routine. If present, then the columns in the evaluated table result will be cast to match the column types specificed in return table type, at query time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `imported_libraries`
- Description: (Optional) Optional. If language = "JAVASCRIPT", this field stores the path of the imported JAVASCRIPT libraries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of the routine if defined.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `determinism_level`
- Description: (Optional) The determinism level of the JavaScript UDF if defined. Possible values are: `DETERMINISM_LEVEL_UNSPECIFIED`, `DETERMINISTIC`, `NOT_DETERMINISTIC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_governance_type`
- Description: (Optional) If set to DATA_MASKING, the function is validated and made available as a masking function. For more information, see https://cloud.google.com/bigquery/docs/user-defined-functions#custom-mask Possible values are: `DATA_MASKING`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_mode`
- Description: (Optional) Optional. The security mode of the routine, if defined. If not defined, the security mode is automatically determined from the routine's configuration. Possible values are: `DEFINER`, `INVOKER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_options`
- Description: (Optional) Optional. If language is one of "PYTHON", "JAVA", "SCALA", this field stores the options for spark stored procedure. Structure is [documented below](#nested_spark_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remote_function_options`
- Description: (Optional) Remote function specific options. Structure is [documented below](#nested_remote_function_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_arguments"></a>The `arguments` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The name of this argument. Can be absent for function return argument.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `argument_kind`
- Description: (Optional) Defaults to FIXED_TYPE. Default value is `FIXED_TYPE`. Possible values are: `FIXED_TYPE`, `ANY_TYPE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) Specifies whether the argument is input or output. Can be set for procedures only. Possible values are: `IN`, `OUT`, `INOUT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_type`
- Description: (Optional) A JSON schema for the data type. Required unless argumentKind = ANY_TYPE. ~>**NOTE**: Because this field expects a JSON string, any changes to the string will create a diff, even if the JSON itself hasn't changed. If the API returns a different value for the same schema, e.g. it switched the order of values or replaced STRUCT field type with RECORD field type, we currently cannot suppress the recurring diff this causes. As a workaround, we recommend using the schema as returned by the API. <a name="nested_spark_options"></a>The `spark_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection`
- Description: (Optional) Fully qualified name of the user-provided Spark connection object. Format: "projects/{projectId}/locations/{locationId}/connections/{connectionId}"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime_version`
- Description: (Optional) Runtime version. If not specified, the default runtime version is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_image`
- Description: (Optional) Custom container image for the runtime environment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) Configuration properties as a set of key/value pairs, which will be passed on to the Spark application. For more information, see Apache Spark and the procedure option list. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_file_uri`
- Description: (Optional) The main file/jar URI of the Spark application. Exactly one of the definitionBody field and the mainFileUri field must be set for Python. Exactly one of mainClass and mainFileUri field should be set for Java/Scala language type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `py_file_uris`
- Description: (Optional) Python files to be placed on the PYTHONPATH for PySpark application. Supported file types: .py, .egg, and .zip. For more information about Apache Spark, see Apache Spark.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_uris`
- Description: (Optional) JARs to include on the driver and executor CLASSPATH. For more information about Apache Spark, see Apache Spark.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: (Optional) Files to be placed in the working directory of each executor. For more information about Apache Spark, see Apache Spark.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_uris`
- Description: (Optional) Archive files to be extracted into the working directory of each executor. For more information about Apache Spark, see Apache Spark.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_class`
- Description: (Optional) The fully qualified name of a class in jarUris, for example, com.example.wordcount. Exactly one of mainClass and main_jar_uri field should be set for Java/Scala language type. <a name="nested_remote_function_options"></a>The `remote_function_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoint`
- Description: (Optional) Endpoint of the user-provided remote service, e.g. `https://us-east1-my_gcf_project.cloudfunctions.net/remote_add`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection`
- Description: (Optional) Fully qualified name of the user-provided connection object which holds the authentication information to send requests to the remote service. Format: "projects/{projectId}/locations/{locationId}/connections/{connectionId}"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_defined_context`
- Description: (Optional) User-defined context as a set of key/value pairs, which will be sent as function invocation context together with batched arguments in the requests to the remote service. The total number of bytes of keys and values must be less than 8KB. An object containing a list of "key": value pairs. Example: `{ "name": "wrench", "mass": "1.3kg", "count": "3" }`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_batching_rows`
- Description: (Optional) Max number of rows in each batch sent to the remote service. If absent or if 0, BigQuery dynamically decides the number of rows in a batch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
