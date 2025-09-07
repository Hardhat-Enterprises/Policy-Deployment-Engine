## 🛡️ Policy Deployment Engine: `bigquery_connection`

This section provides a concise policy evaluation for the `bigquery_connection` resource in GCP.

Reference: [Terraform Registry – bigquery_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_connection)

---

## 1. Argument Reference

### `connection_id`
- Description: (Optional) Optional connection id that should be assigned to the created connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The geographic location where the connection should reside. Cloud SQL instance must be in the same location as the connection with following exceptions: Cloud SQL us-central1 maps to BigQuery US, Cloud SQL europe-west1 maps to BigQuery EU. Examples: US, EU, asia-northeast1, us-central1, europe-west1. Spanner Connections same as spanner region AWS allowed regions are aws-us-east-1 Azure allowed regions are azure-eastus2
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `friendly_name`
- Description: (Optional) A descriptive name for the connection
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A descriptive description for the connection
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) Optional. The Cloud KMS key that is used for encryption. Example: projects/[kms_project_id]/locations/[region]/keyRings/[key_region]/cryptoKeys/[key]
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_sql`
- Description: (Optional) Connection properties specific to the Cloud SQL. Structure is [documented below](#nested_cloud_sql).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aws`
- Description: (Optional) Connection properties specific to Amazon Web Services. Structure is [documented below](#nested_aws).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `azure`
- Description: (Optional) Container for connection properties specific to Azure. Structure is [documented below](#nested_azure).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_spanner`
- Description: (Optional) Connection properties specific to Cloud Spanner Structure is [documented below](#nested_cloud_spanner).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_resource`
- Description: (Optional) Container for connection properties for delegation of access to GCP resources. Structure is [documented below](#nested_cloud_resource).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark`
- Description: (Optional) Container for connection properties to execute stored procedures for Apache Spark. resources. Structure is [documented below](#nested_spark).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_cloud_sql"></a>The `cloud_sql` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_id`
- Description: (Required) Cloud SQL instance ID in the form project:location:instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database`
- Description: (Required) Database name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `credential`
- Description: (Required) Cloud SQL properties. Structure is [documented below](#nested_cloud_sql_credential).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Type of the Cloud SQL database. Possible values are: `DATABASE_TYPE_UNSPECIFIED`, `POSTGRES`, `MYSQL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_id`
- Description: (Output) When the connection is used in the context of an operation in BigQuery, this service account will serve as the identity being used for connecting to the CloudSQL instance specified in this connection. <a name="nested_cloud_sql_credential"></a>The `credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) Username for database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Required) Password for database. **Note**: This property is sensitive and will not be displayed in the plan. <a name="nested_aws"></a>The `aws` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_role`
- Description: (Required) Authentication using Google owned service account to assume into customer's AWS IAM Role. Structure is [documented below](#nested_aws_access_role). <a name="nested_aws_access_role"></a>The `access_role` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `iam_role_id`
- Description: (Required) The user’s AWS IAM Role that trusts the Google-owned AWS IAM user Connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `identity`
- Description: (Output) A unique Google-owned and Google-generated identity for the Connection. This identity will be used to access the user's AWS IAM Role. <a name="nested_azure"></a>The `azure` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `application`
- Description: (Output) The name of the Azure Active Directory Application.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Output) The client id of the Azure Active Directory Application.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_id`
- Description: (Output) The object id of the Azure Active Directory Application.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `customer_tenant_id`
- Description: (Required) The id of customer's directory that host the data.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `federated_application_client_id`
- Description: (Optional) The Azure Application (client) ID where the federated credentials will be hosted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redirect_uri`
- Description: (Output) The URL user will be redirected to after granting consent during connection setup.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `identity`
- Description: (Output) A unique Google-owned and Google-generated identity for the Connection. This identity will be used to access the user's Azure Active Directory Application. <a name="nested_cloud_spanner"></a>The `cloud_spanner` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database`
- Description: (Required) Cloud Spanner database in the form `project/instance/database'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_parallelism`
- Description: (Optional) If parallelism should be used when reading from Cloud Spanner.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_parallelism`
- Description: (Optional) Allows setting max parallelism per query when executing on Spanner independent compute resources. If unspecified, default values of parallelism are chosen that are dependent on the Cloud Spanner instance configuration. `useParallelism` and `useDataBoost` must be set when setting max parallelism.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_data_boost`
- Description: (Optional) If set, the request will be executed via Spanner independent compute resources. `use_parallelism` must be set when using data boost.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_role`
- Description: (Optional) Cloud Spanner database role for fine-grained access control. The Cloud Spanner admin should have provisioned the database role with appropriate permissions, such as `SELECT` and `INSERT`. Other users should only use roles provided by their Cloud Spanner admins. The database role name must start with a letter, and can only contain letters, numbers, and underscores. For more details, see https://cloud.google.com/spanner/docs/fgac-about.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_serverless_analytics`
- Description: (Optional, Deprecated) If the serverless analytics service should be used to read data from Cloud Spanner. `useParallelism` must be set when using serverless analytics. ~> **Warning:** `useServerlessAnalytics` is deprecated and will be removed in a future major release. Use `useDataBoost` instead. <a name="nested_cloud_resource"></a>The `cloud_resource` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_id`
- Description: (Output) The account ID of the service created for the purpose of this connection. <a name="nested_spark"></a>The `spark` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_id`
- Description: (Output) The account ID of the service created for the purpose of this connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metastore_service_config`
- Description: (Optional) Dataproc Metastore Service configuration for the connection. Structure is [documented below](#nested_spark_metastore_service_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_history_server_config`
- Description: (Optional) Spark History Server configuration for the connection. Structure is [documented below](#nested_spark_spark_history_server_config). <a name="nested_spark_metastore_service_config"></a>The `metastore_service_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metastore_service`
- Description: (Optional) Resource name of an existing Dataproc Metastore service in the form of projects/[projectId]/locations/[region]/services/[serviceId]. <a name="nested_spark_spark_history_server_config"></a>The `spark_history_server_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataproc_cluster`
- Description: (Optional) Resource name of an existing Dataproc Cluster to act as a Spark History Server for the connection if the form of projects/[projectId]/regions/[region]/clusters/[cluster_name].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
