## 🛡️ Policy Deployment Engine: `datastream_connection_profile`

This section provides a concise policy evaluation for the `datastream_connection_profile` resource in GCP.

Reference: [Terraform Registry – datastream_connection_profile](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/datastream_connection_profile)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Display name. | true | None | None |
| `connection_profile_id` | The connection profile identifier. | true | None | None |
| `location` | The name of the location this connection profile is located in. | true | None | None |
| `labels` | Labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `bigquery_profile` | BigQuery warehouse profile. | false | None | None |
| `create_without_validation` | Create the connection profile without validating it. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### oracle_profile Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hostname` | Hostname for the Oracle connection. | true | None | None |
| `port` | Port for the Oracle connection. | false | None | None |
| `username` | Username for the Oracle connection. | true | None | None |
| `password` | Password for the Oracle connection. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `secret_manager_stored_password` | A reference to a Secret Manager resource name storing the user's password. | false | None | None |
| `database_service` | Database for the Oracle connection. | true | None | None |
| `connection_attributes` | Connection string attributes | false | None | None |

### gcs_profile Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` | The Cloud Storage bucket name. | true | None | None |
| `root_path` | The root path inside the Cloud Storage bucket. | false | None | None |

### mysql_profile Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hostname` | Hostname for the MySQL connection. | true | None | None |
| `port` | Port for the MySQL connection. | false | None | None |
| `username` | Username for the MySQL connection. | true | None | None |
| `password` | Password for the MySQL connection. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `secret_manager_stored_password` | A reference to a Secret Manager resource name storing the user's password. | false | None | None |
| `ssl_config` | SSL configuration for the MySQL connection. Structure is [documented below](#nested_mysql_profile_ssl_config). | false | None | None |

### postgresql_profile Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hostname` | Hostname for the PostgreSQL connection. | true | None | None |
| `port` | Port for the PostgreSQL connection. | false | None | None |
| `username` | Username for the PostgreSQL connection. | true | None | None |
| `password` | Password for the PostgreSQL connection. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `secret_manager_stored_password` | A reference to a Secret Manager resource name storing the user's password. | false | None | None |
| `database` | Database for the PostgreSQL connection. | true | None | None |

### salesforce_profile Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `domain` | Domain for the Salesforce Org. | true | None | None |
| `user_credentials` | User credentials to use for Salesforce authentication. Structure is [documented below](#nested_salesforce_profile_user_credentials). | false | None | None |
| `oauth2_client_credentials` | OAuth credentials to use for Salesforce authentication. Structure is [documented below](#nested_salesforce_profile_oauth2_client_credentials). | false | None | None |

### sql_server_profile Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hostname` | Hostname for the SQL Server connection. | true | None | None |
| `port` | Port for the SQL Server connection. | false | None | None |
| `username` | Username for the SQL Server connection. | true | None | None |
| `password` | Password for the SQL Server connection. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `secret_manager_stored_password` | A reference to a Secret Manager resource name storing the user's password. | false | None | None |
| `database` | Database for the SQL Server connection. | true | None | None |

### forward_ssh_connectivity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hostname` | Hostname for the SSH tunnel. | true | None | None |
| `username` | Username for the SSH tunnel. | true | None | None |
| `port` | Port for the SSH tunnel. | false | None | None |
| `password` | SSH password. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `private_key` | SSH private key. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |

### private_connectivity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `private_connection` | A reference to a private connection resource. Format: `projects/{project}/locations/{location}/privateConnections/{name}` | true | None | None |

### ssl_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `client_key` | PEM-encoded private key associated with the Client Certificate. If this field is used then the 'client_certificate' and the 'ca_certificate' fields are mandatory. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `client_key_set` | (Output) Indicates whether the clientKey field is set. | none | None | None |
| `client_certificate` | PEM-encoded certificate that will be used by the replica to authenticate against the source database server. If this field is used then the 'clientKey' and the 'caCertificate' fields are mandatory. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `client_certificate_set` | (Output) Indicates whether the clientCertificate field is set. | none | None | None |
| `ca_certificate` | PEM-encoded certificate of the CA that signed the source database server's certificate. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `ca_certificate_set` | (Output) Indicates whether the clientKey field is set. | none | None | None |

### user_credentials Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username` | Username to use for authentication. | false | None | None |
| `password` | Password of the user. | false | None | None |
| `security_token` | Security token of the user. | false | None | None |
| `secret_manager_stored_password` | A reference to a Secret Manager resource name storing the user's password. | false | None | None |
| `secret_manager_stored_security_token` | A reference to a Secret Manager resource name storing the user's security token. | false | None | None |

### oauth2_client_credentials Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `client_id` | Client ID to use for authentication. | false | None | None |
| `client_secret` | Client secret to use for authentication. | false | None | None |
| `secret_manager_stored_client_secret` | A reference to a Secret Manager resource name storing the client secret. | false | None | None |
