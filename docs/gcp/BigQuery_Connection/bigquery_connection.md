## 🛡️ Policy Deployment Engine: `bigquery_connection`

This section provides a concise policy evaluation for the `bigquery_connection` resource in GCP.

Reference: [Terraform Registry – bigquery_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_connection)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `connection_id` | Optional connection id that should be assigned to the created connection. | false | None | None |
| `location` | The geographic location where the connection should reside. Cloud SQL instance must be in the same location as the connection with following exceptions: Cloud SQL us-central1 maps to BigQuery US, Cloud SQL europe-west1 maps to BigQuery EU. Examples: US, EU, asia-northeast1, us-central1, europe-west1. Spanner Connections same as spanner region AWS allowed regions are aws-us-east-1 Azure allowed regions are azure-eastus2 | false | None | None |
| `friendly_name` | A descriptive name for the connection | false | None | None |
| `description` | A descriptive description for the connection | false | None | None |
| `kms_key_name` | Optional. The Cloud KMS key that is used for encryption. Example: projects/[kms_project_id]/locations/[region]/keyRings/[key_region]/cryptoKeys/[key] | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### cloud_sql Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instance_id` | Cloud SQL instance ID in the form project:location:instance. | true | None | None |
| `database` | Database name. | true | None | None |
| `credential` | Cloud SQL properties. Structure is [documented below](#nested_cloud_sql_credential). | true | None | None |
| `type` | Type of the Cloud SQL database. Possible values are: `DATABASE_TYPE_UNSPECIFIED`, `POSTGRES`, `MYSQL`. | true | None | None |
| `service_account_id` | (Output) When the connection is used in the context of an operation in BigQuery, this service account will serve as the identity being used for connecting to the CloudSQL instance specified in this connection. | none | None | None |

### aws Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `access_role` | Authentication using Google owned service account to assume into customer's AWS IAM Role. Structure is [documented below](#nested_aws_access_role). | true | None | None |

### azure Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `application` | (Output) The name of the Azure Active Directory Application. | none | None | None |
| `client_id` | (Output) The client id of the Azure Active Directory Application. | none | None | None |
| `object_id` | (Output) The object id of the Azure Active Directory Application. | none | None | None |
| `customer_tenant_id` | The id of customer's directory that host the data. | true | None | None |
| `federated_application_client_id` | The Azure Application (client) ID where the federated credentials will be hosted. | false | None | None |
| `redirect_uri` | (Output) The URL user will be redirected to after granting consent during connection setup. | none | None | None |
| `identity` | (Output) A unique Google-owned and Google-generated identity for the Connection. This identity will be used to access the user's Azure Active Directory Application. | none | None | None |

### cloud_spanner Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `database` | Cloud Spanner database in the form `project/instance/database'. | true | None | None |
| `use_parallelism` | If parallelism should be used when reading from Cloud Spanner. | false | None | None |
| `max_parallelism` | Allows setting max parallelism per query when executing on Spanner independent compute resources. If unspecified, default values of parallelism are chosen that are dependent on the Cloud Spanner instance configuration. `useParallelism` and `useDataBoost` must be set when setting max parallelism. | false | None | None |
| `use_data_boost` | If set, the request will be executed via Spanner independent compute resources. `use_parallelism` must be set when using data boost. | false | None | None |
| `database_role` | Cloud Spanner database role for fine-grained access control. The Cloud Spanner admin should have provisioned the database role with appropriate permissions, such as `SELECT` and `INSERT`. Other users should only use roles provided by their Cloud Spanner admins. The database role name must start with a letter, and can only contain letters, numbers, and underscores. For more details, see https://cloud.google.com/spanner/docs/fgac-about. | false | None | None |
| `use_serverless_analytics` | , Deprecated) If the serverless analytics service should be used to read data from Cloud Spanner. `useParallelism` must be set when using serverless analytics. ~> **Warning:** `useServerlessAnalytics` is deprecated and will be removed in a future major release. Use `useDataBoost` instead. | false | None | None |

### cloud_resource Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_account_id` | (Output) The account ID of the service created for the purpose of this connection. | none | None | None |

### spark Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_account_id` | (Output) The account ID of the service created for the purpose of this connection. | none | None | None |
| `metastore_service_config` | Dataproc Metastore Service configuration for the connection. Structure is [documented below](#nested_spark_metastore_service_config). | false | None | None |
| `spark_history_server_config` | Spark History Server configuration for the connection. Structure is [documented below](#nested_spark_spark_history_server_config). | false | None | None |

### credential Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username` | Username for database. | true | None | None |
| `password` | Password for database. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |

### access_role Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `iam_role_id` | The user’s AWS IAM Role that trusts the Google-owned AWS IAM user Connection. | true | None | None |
| `identity` | (Output) A unique Google-owned and Google-generated identity for the Connection. This identity will be used to access the user's AWS IAM Role. | none | None | None |

### metastore_service_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `metastore_service` | Resource name of an existing Dataproc Metastore service in the form of projects/[projectId]/locations/[region]/services/[serviceId]. | false | None | None |

### spark_history_server_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataproc_cluster` | Resource name of an existing Dataproc Cluster to act as a Spark History Server for the connection if the form of projects/[projectId]/regions/[region]/clusters/[cluster_name]. | false | None | None |
