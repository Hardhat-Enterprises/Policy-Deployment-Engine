## 🛡️ Policy Deployment Engine: `bigquery_routine`

This section provides a concise policy evaluation for the `bigquery_routine` resource in GCP.

Reference: [Terraform Registry – bigquery_routine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_routine)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataset_id` | The ID of the dataset containing this routine | true | None | None |
| `routine_id` | The ID of the the routine. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 256 characters. | true | None | None |
| `routine_type` | The type of routine. Possible values are: `SCALAR_FUNCTION`, `PROCEDURE`, `TABLE_VALUED_FUNCTION`. | true | None | None |
| `definition_body` | The body of the routine. For functions, this is the expression in the AS clause. If language=SQL, it is the substring inside (but excluding) the parentheses. | true | None | None |
| `language` | The language of the routine. Possible values are: `SQL`, `JAVASCRIPT`, `PYTHON`, `JAVA`, `SCALA`. | false | None | None |
| `return_type` | A JSON schema for the return type. Optional if language = "SQL"; required otherwise. If absent, the return type is inferred from definitionBody at query time in each query that references this routine. If present, then the evaluated result will be cast to the specified returned type at query time. ~>**NOTE**: Because this field expects a JSON string, any changes to the string will create a diff, even if the JSON itself hasn't changed. If the API returns a different value for the same schema, e.g. it switche d the order of values or replaced STRUCT field type with RECORD field type, we currently cannot suppress the recurring diff this causes. As a workaround, we recommend using the schema as returned by the API. | false | None | None |
| `return_table_type` | Optional. Can be set only if routineType = "TABLE_VALUED_FUNCTION". If absent, the return table type is inferred from definitionBody at query time in each query that references this routine. If present, then the columns in the evaluated table result will be cast to match the column types specificed in return table type, at query time. | false | None | None |
| `imported_libraries` | Optional. If language = "JAVASCRIPT", this field stores the path of the imported JAVASCRIPT libraries. | false | None | None |
| `description` | The description of the routine if defined. | false | None | None |
| `determinism_level` | The determinism level of the JavaScript UDF if defined. Possible values are: `DETERMINISM_LEVEL_UNSPECIFIED`, `DETERMINISTIC`, `NOT_DETERMINISTIC`. | false | None | None |
| `data_governance_type` | If set to DATA_MASKING, the function is validated and made available as a masking function. For more information, see https://cloud.google.com/bigquery/docs/user-defined-functions#custom-mask Possible values are: `DATA_MASKING`. | false | None | None |
| `security_mode` | Optional. The security mode of the routine, if defined. If not defined, the security mode is automatically determined from the routine's configuration. Possible values are: `DEFINER`, `INVOKER`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### arguments Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of this argument. Can be absent for function return argument. | false | None | None |
| `argument_kind` | Defaults to FIXED_TYPE. Default value is `FIXED_TYPE`. Possible values are: `FIXED_TYPE`, `ANY_TYPE`. | false | None | None |
| `mode` | Specifies whether the argument is input or output. Can be set for procedures only. Possible values are: `IN`, `OUT`, `INOUT`. | false | None | None |
| `data_type` | A JSON schema for the data type. Required unless argumentKind = ANY_TYPE. ~>**NOTE**: Because this field expects a JSON string, any changes to the string will create a diff, even if the JSON itself hasn't changed. If the API returns a different value for the same schema, e.g. it switched the order of values or replaced STRUCT field type with RECORD field type, we currently cannot suppress the recurring diff this causes. As a workaround, we recommend using the schema as returned by the API. | false | None | None |

### spark_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `connection` | Fully qualified name of the user-provided Spark connection object. Format: "projects/{projectId}/locations/{locationId}/connections/{connectionId}" | false | None | None |
| `runtime_version` | Runtime version. If not specified, the default runtime version is used. | false | None | None |
| `container_image` | Custom container image for the runtime environment. | false | None | None |
| `properties` | Configuration properties as a set of key/value pairs, which will be passed on to the Spark application. For more information, see Apache Spark and the procedure option list. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | None | None |
| `main_file_uri` | The main file/jar URI of the Spark application. Exactly one of the definitionBody field and the mainFileUri field must be set for Python. Exactly one of mainClass and mainFileUri field should be set for Java/Scala language type. | false | None | None |
| `py_file_uris` | Python files to be placed on the PYTHONPATH for PySpark application. Supported file types: .py, .egg, and .zip. For more information about Apache Spark, see Apache Spark. | false | None | None |
| `jar_uris` | JARs to include on the driver and executor CLASSPATH. For more information about Apache Spark, see Apache Spark. | false | None | None |
| `file_uris` | Files to be placed in the working directory of each executor. For more information about Apache Spark, see Apache Spark. | false | None | None |
| `archive_uris` | Archive files to be extracted into the working directory of each executor. For more information about Apache Spark, see Apache Spark. | false | None | None |
| `main_class` | The fully qualified name of a class in jarUris, for example, com.example.wordcount. Exactly one of mainClass and main_jar_uri field should be set for Java/Scala language type. | false | None | None |

### remote_function_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `endpoint` | Endpoint of the user-provided remote service, e.g. `https://us-east1-my_gcf_project.cloudfunctions.net/remote_add` | false | None | None |
| `connection` | Fully qualified name of the user-provided connection object which holds the authentication information to send requests to the remote service. Format: "projects/{projectId}/locations/{locationId}/connections/{connectionId}" | false | None | None |
| `user_defined_context` | User-defined context as a set of key/value pairs, which will be sent as function invocation context together with batched arguments in the requests to the remote service. The total number of bytes of keys and values must be less than 8KB. An object containing a list of "key": value pairs. Example: `{ "name": "wrench", "mass": "1.3kg", "count": "3" }`. | false | None | None |
| `max_batching_rows` | Max number of rows in each batch sent to the remote service. If absent or if 0, BigQuery dynamically decides the number of rows in a batch. | false | None | None |
