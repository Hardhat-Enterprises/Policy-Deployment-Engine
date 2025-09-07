## 🛡️ Policy Deployment Engine: `datastream_connection_profile`

This section provides a concise policy evaluation for the `datastream_connection_profile` resource in GCP.

Reference: [Terraform Registry – datastream_connection_profile](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/datastream_connection_profile)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) Display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_profile_id`
- Description: (Required) The connection profile identifier.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The name of the location this connection profile is located in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oracle_profile`
- Description: (Optional) Oracle database profile. Structure is [documented below](#nested_oracle_profile).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_profile`
- Description: (Optional) Cloud Storage bucket profile. Structure is [documented below](#nested_gcs_profile).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mysql_profile`
- Description: (Optional) MySQL database profile. Structure is [documented below](#nested_mysql_profile).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bigquery_profile`
- Description: (Optional) BigQuery warehouse profile.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postgresql_profile`
- Description: (Optional) PostgreSQL database profile. Structure is [documented below](#nested_postgresql_profile).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `salesforce_profile`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Salesforce profile. Structure is [documented below](#nested_salesforce_profile).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sql_server_profile`
- Description: (Optional) SQL Server database profile. Structure is [documented below](#nested_sql_server_profile).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `forward_ssh_connectivity`
- Description: (Optional) Forward SSH tunnel connectivity. Structure is [documented below](#nested_forward_ssh_connectivity).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_connectivity`
- Description: (Optional) Private connectivity. Structure is [documented below](#nested_private_connectivity).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_without_validation`
- Description: (Optional) Create the connection profile without validating it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_oracle_profile"></a>The `oracle_profile` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname`
- Description: (Required) Hostname for the Oracle connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) Port for the Oracle connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) Username for the Oracle connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) Password for the Oracle connection. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_manager_stored_password`
- Description: (Optional) A reference to a Secret Manager resource name storing the user's password.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_service`
- Description: (Required) Database for the Oracle connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_attributes`
- Description: (Optional) Connection string attributes <a name="nested_gcs_profile"></a>The `gcs_profile` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) The Cloud Storage bucket name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `root_path`
- Description: (Optional) The root path inside the Cloud Storage bucket. <a name="nested_mysql_profile"></a>The `mysql_profile` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname`
- Description: (Required) Hostname for the MySQL connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) Port for the MySQL connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) Username for the MySQL connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) Password for the MySQL connection. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_manager_stored_password`
- Description: (Optional) A reference to a Secret Manager resource name storing the user's password.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_config`
- Description: (Optional) SSL configuration for the MySQL connection. Structure is [documented below](#nested_mysql_profile_ssl_config). <a name="nested_mysql_profile_ssl_config"></a>The `ssl_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_key`
- Description: (Optional) PEM-encoded private key associated with the Client Certificate. If this field is used then the 'client_certificate' and the 'ca_certificate' fields are mandatory. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_key_set`
- Description: (Output) Indicates whether the clientKey field is set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_certificate`
- Description: (Optional) PEM-encoded certificate that will be used by the replica to authenticate against the source database server. If this field is used then the 'clientKey' and the 'caCertificate' fields are mandatory. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_certificate_set`
- Description: (Output) Indicates whether the clientCertificate field is set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_certificate`
- Description: (Optional) PEM-encoded certificate of the CA that signed the source database server's certificate. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_certificate_set`
- Description: (Output) Indicates whether the clientKey field is set. <a name="nested_postgresql_profile"></a>The `postgresql_profile` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname`
- Description: (Required) Hostname for the PostgreSQL connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) Port for the PostgreSQL connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) Username for the PostgreSQL connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) Password for the PostgreSQL connection. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_manager_stored_password`
- Description: (Optional) A reference to a Secret Manager resource name storing the user's password.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database`
- Description: (Required) Database for the PostgreSQL connection. <a name="nested_salesforce_profile"></a>The `salesforce_profile` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain`
- Description: (Required) Domain for the Salesforce Org.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_credentials`
- Description: (Optional) User credentials to use for Salesforce authentication. Structure is [documented below](#nested_salesforce_profile_user_credentials).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth2_client_credentials`
- Description: (Optional) OAuth credentials to use for Salesforce authentication. Structure is [documented below](#nested_salesforce_profile_oauth2_client_credentials). <a name="nested_salesforce_profile_user_credentials"></a>The `user_credentials` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Optional) Username to use for authentication.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) Password of the user.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_token`
- Description: (Optional) Security token of the user.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_manager_stored_password`
- Description: (Optional) A reference to a Secret Manager resource name storing the user's password.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_manager_stored_security_token`
- Description: (Optional) A reference to a Secret Manager resource name storing the user's security token. <a name="nested_salesforce_profile_oauth2_client_credentials"></a>The `oauth2_client_credentials` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Optional) Client ID to use for authentication.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Optional) Client secret to use for authentication.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_manager_stored_client_secret`
- Description: (Optional) A reference to a Secret Manager resource name storing the client secret. <a name="nested_sql_server_profile"></a>The `sql_server_profile` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname`
- Description: (Required) Hostname for the SQL Server connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) Port for the SQL Server connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) Username for the SQL Server connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) Password for the SQL Server connection. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_manager_stored_password`
- Description: (Optional) A reference to a Secret Manager resource name storing the user's password.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database`
- Description: (Required) Database for the SQL Server connection. <a name="nested_forward_ssh_connectivity"></a>The `forward_ssh_connectivity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname`
- Description: (Required) Hostname for the SSH tunnel.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) Username for the SSH tunnel.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) Port for the SSH tunnel.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) SSH password. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_key`
- Description: (Optional) SSH private key. **Note**: This property is sensitive and will not be displayed in the plan. <a name="nested_private_connectivity"></a>The `private_connectivity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_connection`
- Description: (Required) A reference to a private connection resource. Format: `projects/{project}/locations/{location}/privateConnections/{name}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
