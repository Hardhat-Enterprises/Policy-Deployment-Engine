## 🛡️ Policy Deployment Engine: `database_migration_service_connection_profile`

This section provides a concise policy evaluation for the `database_migration_service_connection_profile` resource in GCP.

Reference: [Terraform Registry – database_migration_service_connection_profile](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/database_migration_service_connection_profile)

---

## 1. Argument Reference

### `connection_profile_id`
- Description: (Required) The ID of the connection profile.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The connection profile display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The resource labels for connection profile to use to annotate any related underlying resources such as Compute Engine VMs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mysql`
- Description: (Optional) Specifies connection parameters required specifically for MySQL databases. Structure is [documented below](#nested_mysql).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postgresql`
- Description: (Optional) Specifies connection parameters required specifically for PostgreSQL databases. Structure is [documented below](#nested_postgresql).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oracle`
- Description: (Optional) Specifies connection parameters required specifically for Oracle databases. Structure is [documented below](#nested_oracle).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloudsql`
- Description: (Optional) Specifies required connection parameters, and, optionally, the parameters required to create a Cloud SQL destination database instance. Structure is [documented below](#nested_cloudsql).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `alloydb`
- Description: (Optional) Specifies required connection parameters, and the parameters required to create an AlloyDB destination cluster. Structure is [documented below](#nested_alloydb).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location where the connection profile should reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_mysql"></a>The `mysql` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Optional) The IP or hostname of the source MySQL database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) The network port of the source MySQL database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Optional) The username that Database Migration Service will use to connect to the database. The value is encrypted when stored in Database Migration Service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) Input only. The password for the user that Database Migration Service will be using to connect to the database. This field is not returned on request, and the value is encrypted when stored in Database Migration Service. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password_set`
- Description: (Output) Output only. Indicates If this connection profile password is stored.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl`
- Description: (Optional) SSL configuration for the destination to connect to the source database. Structure is [documented below](#nested_mysql_ssl).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_sql_id`
- Description: (Optional) If the source is a Cloud SQL database, use this field to provide the Cloud SQL instance ID of the source. <a name="nested_mysql_ssl"></a>The `ssl` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The current connection profile state. Possible values are: `SERVER_ONLY`, `SERVER_CLIENT`, `REQUIRED`, `NONE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_key`
- Description: (Optional) Input only. The unencrypted PKCS#1 or PKCS#8 PEM-encoded private key associated with the Client Certificate. If this field is used then the 'clientCertificate' field is mandatory. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_certificate`
- Description: (Optional) Input only. The x509 PEM-encoded certificate that will be used by the replica to authenticate against the source database server. If this field is used then the 'clientKey' field is mandatory **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_certificate`
- Description: (Optional) Input only. The x509 PEM-encoded certificate of the CA that signed the source database server's certificate. The replica will use this certificate to verify it's connecting to the right host. **Note**: This property is sensitive and will not be displayed in the plan. <a name="nested_postgresql"></a>The `postgresql` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Optional) The IP or hostname of the source MySQL database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) The network port of the source MySQL database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Optional) The username that Database Migration Service will use to connect to the database. The value is encrypted when stored in Database Migration Service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) Input only. The password for the user that Database Migration Service will be using to connect to the database. This field is not returned on request, and the value is encrypted when stored in Database Migration Service. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password_set`
- Description: (Output) Output only. Indicates If this connection profile password is stored.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl`
- Description: (Optional) SSL configuration for the destination to connect to the source database. Structure is [documented below](#nested_postgresql_ssl).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_sql_id`
- Description: (Optional) If the source is a Cloud SQL database, use this field to provide the Cloud SQL instance ID of the source.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `alloydb_cluster_id`
- Description: (Optional) If the connected database is an AlloyDB instance, use this field to provide the AlloyDB cluster ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_architecture`
- Description: (Output) Output only. If the source is a Cloud SQL database, this field indicates the network architecture it's associated with. <a name="nested_postgresql_ssl"></a>The `ssl` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The current connection profile state. Possible values are: `SERVER_ONLY`, `SERVER_CLIENT`, `REQUIRED`, `NONE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_key`
- Description: (Optional) Input only. The unencrypted PKCS#1 or PKCS#8 PEM-encoded private key associated with the Client Certificate. If this field is used then the 'clientCertificate' field is mandatory. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_certificate`
- Description: (Optional) Input only. The x509 PEM-encoded certificate that will be used by the replica to authenticate against the source database server. If this field is used then the 'clientKey' field is mandatory **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_certificate`
- Description: (Optional) Input only. The x509 PEM-encoded certificate of the CA that signed the source database server's certificate. The replica will use this certificate to verify it's connecting to the right host. **Note**: This property is sensitive and will not be displayed in the plan. <a name="nested_oracle"></a>The `oracle` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Required) Required. The IP or hostname of the source Oracle database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Required) Required. The network port of the source Oracle database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) Required. The username that Database Migration Service will use to connect to the database. The value is encrypted when stored in Database Migration Service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Required) Required. Input only. The password for the user that Database Migration Service will be using to connect to the database. This field is not returned on request, and the value is encrypted when stored in Database Migration Service. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password_set`
- Description: (Output) Output only. Indicates If this connection profile password is stored.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_service`
- Description: (Required) Required. Database service for the Oracle connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl`
- Description: (Optional) SSL configuration for the destination to connect to the source database. Structure is [documented below](#nested_oracle_ssl).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `static_service_ip_connectivity`
- Description: (Optional) This object has no nested fields. Static IP address connectivity configured on service project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `forward_ssh_connectivity`
- Description: (Optional) SSL configuration for the destination to connect to the source database. Structure is [documented below](#nested_oracle_forward_ssh_connectivity).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_connectivity`
- Description: (Optional) Configuration for using a private network to communicate with the source database Structure is [documented below](#nested_oracle_private_connectivity). <a name="nested_oracle_ssl"></a>The `ssl` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Output) The current connection profile state.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_key`
- Description: (Optional) Input only. The unencrypted PKCS#1 or PKCS#8 PEM-encoded private key associated with the Client Certificate. If this field is used then the 'clientCertificate' field is mandatory. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_certificate`
- Description: (Optional) Input only. The x509 PEM-encoded certificate that will be used by the replica to authenticate against the source database server. If this field is used then the 'clientKey' field is mandatory **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_certificate`
- Description: (Optional) Input only. The x509 PEM-encoded certificate of the CA that signed the source database server's certificate. The replica will use this certificate to verify it's connecting to the right host. **Note**: This property is sensitive and will not be displayed in the plan. <a name="nested_oracle_forward_ssh_connectivity"></a>The `forward_ssh_connectivity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname`
- Description: (Required) Required. Hostname for the SSH tunnel.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) Required. Username for the SSH tunnel.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Required) Port for the SSH tunnel, default value is 22.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) Input only. SSH password. Only one of `password` and `private_key` can be configured. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_key`
- Description: (Optional) Input only. SSH private key. Only one of `password` and `private_key` can be configured. **Note**: This property is sensitive and will not be displayed in the plan. <a name="nested_oracle_private_connectivity"></a>The `private_connectivity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_connection`
- Description: (Required) Required. The resource name (URI) of the private connection. <a name="nested_cloudsql"></a>The `cloudsql` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_sql_id`
- Description: (Output) Output only. The Cloud SQL instance ID that this connection profile is associated with.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `settings`
- Description: (Optional) Immutable. Metadata used to create the destination Cloud SQL database. Structure is [documented below](#nested_cloudsql_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_ip`
- Description: (Output) Output only. The Cloud SQL database instance's private IP.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_ip`
- Description: (Output) Output only. The Cloud SQL database instance's public IP. <a name="nested_cloudsql_settings"></a>The `settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_version`
- Description: (Optional) The database engine type and version. Currently supported values located at https://cloud.google.com/database-migration/docs/reference/rest/v1/projects.locations.connectionProfiles#sqldatabaseversion
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_labels`
- Description: (Optional) The resource labels for a Cloud SQL instance to use to annotate any related underlying resources such as Compute Engine VMs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tier`
- Description: (Optional) The tier (or machine type) for this instance, for example: db-n1-standard-1 (MySQL instances) or db-custom-1-3840 (PostgreSQL instances). For more information, see https://cloud.google.com/sql/docs/mysql/instance-settings
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_auto_resize_limit`
- Description: (Optional) The maximum size to which storage capacity can be automatically increased. The default value is 0, which specifies that there is no limit.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `activation_policy`
- Description: (Optional) The activation policy specifies when the instance is activated; it is applicable only when the instance state is 'RUNNABLE'. Possible values are: `ALWAYS`, `NEVER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_config`
- Description: (Optional) The settings for IP Management. This allows to enable or disable the instance IP and manage which external networks can connect to the instance. The IPv4 address cannot be disabled. Structure is [documented below](#nested_cloudsql_settings_ip_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_storage_increase`
- Description: (Optional) If you enable this setting, Cloud SQL checks your available storage every 30 seconds. If the available storage falls below a threshold size, Cloud SQL automatically adds additional storage capacity. If the available storage repeatedly falls below the threshold size, Cloud SQL continues to add storage until it reaches the maximum of 30 TB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_flags`
- Description: (Optional) The database flags passed to the Cloud SQL instance at startup.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_disk_type`
- Description: (Optional) The type of storage. Possible values are: `PD_SSD`, `PD_HDD`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_disk_size_gb`
- Description: (Optional) The storage capacity available to the database, in GB. The minimum (and default) size is 10GB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) The Google Cloud Platform zone where your Cloud SQL datdabse instance is located.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_id`
- Description: (Required) The Database Migration Service source connection profile ID, in the format: projects/my_project_name/locations/us-central1/connectionProfiles/connection_profile_ID
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `root_password`
- Description: (Optional) Input only. Initial root password. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `root_password_set`
- Description: (Output) Output only. Indicates If this connection profile root password is stored.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `collation`
- Description: (Optional) The Cloud SQL default instance level collation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cmek_key_name`
- Description: (Optional) The KMS key name used for the csql instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `edition`
- Description: (Optional) The edition of the given Cloud SQL instance. Possible values are: `ENTERPRISE`, `ENTERPRISE_PLUS`. <a name="nested_cloudsql_settings_ip_config"></a>The `ip_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_ipv4`
- Description: (Optional) Whether the instance should be assigned an IPv4 address or not.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_network`
- Description: (Optional) The resource link for the VPC network from which the Cloud SQL instance is accessible for private IP. For example, projects/myProject/global/networks/default. This setting can be updated, but it cannot be removed after it is set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_ssl`
- Description: (Optional) Whether SSL connections over IP should be enforced or not.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorized_networks`
- Description: (Optional) The list of external networks that are allowed to connect to the instance using the IP. Structure is [documented below](#nested_cloudsql_settings_ip_config_authorized_networks). <a name="nested_cloudsql_settings_ip_config_authorized_networks"></a>The `authorized_networks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) The allowlisted value for the access control list.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `label`
- Description: (Optional) A label to identify this entry.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expire_time`
- Description: (Optional) The time when this access control entry expires in RFC 3339 format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ttl`
- Description: (Optional) Input only. The time-to-leave of this access control entry. <a name="nested_alloydb"></a>The `alloydb` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_id`
- Description: (Required) Required. The AlloyDB cluster ID that this connection profile is associated with.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `settings`
- Description: (Optional) Immutable. Metadata used to create the destination AlloyDB cluster. Structure is [documented below](#nested_alloydb_settings). <a name="nested_alloydb_settings"></a>The `settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initial_user`
- Description: (Required) Required. Input only. Initial user to setup during cluster creation. Structure is [documented below](#nested_alloydb_settings_initial_user).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_network`
- Description: (Required) Required. The resource link for the VPC network in which cluster resources are created and from which they are accessible via Private IP. The network must belong to the same project as the cluster. It is specified in the form: 'projects/{project_number}/global/networks/{network_id}'. This is required to create a cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels for the AlloyDB cluster created by DMS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_instance_settings`
- Description: (Optional) Settings for the cluster's primary instance Structure is [documented below](#nested_alloydb_settings_primary_instance_settings). <a name="nested_alloydb_settings_initial_user"></a>The `initial_user` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user`
- Description: (Required) The database username.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Required) The initial password for the user. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password_set`
- Description: (Output) Output only. Indicates if the initialUser.password field has been set. <a name="nested_alloydb_settings_primary_instance_settings"></a>The `primary_instance_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) The database username.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_config`
- Description: (Required) Configuration for the machines that host the underlying database engine. Structure is [documented below](#nested_alloydb_settings_primary_instance_settings_machine_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_flags`
- Description: (Optional) Database flags to pass to AlloyDB when DMS is creating the AlloyDB cluster and instances. See the AlloyDB documentation for how these can be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels for the AlloyDB primary instance created by DMS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_ip`
- Description: (Output) Output only. The private IP address for the Instance. This is the connection endpoint for an end-user application. <a name="nested_alloydb_settings_primary_instance_settings_machine_config"></a>The `machine_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_count`
- Description: (Required) The number of CPU's in the VM instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
