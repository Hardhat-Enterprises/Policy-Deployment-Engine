## 🛡️ Policy Deployment Engine: `database_migration_service_connection_profile`

This section provides a concise policy evaluation for the `database_migration_service_connection_profile` resource in GCP.

Reference: [Terraform Registry – database_migration_service_connection_profile](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/database_migration_service_connection_profile)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `connection_profile_id` | The ID of the connection profile. | true | false | Connection Profile ID has no impact on the security of the resource or data contained | None | None |
| `display_name` | The connection profile display name. | false | false | Display name has no impact on the security of the resource or data contained | None | None |
| `labels` | The resource labels for connection profile to use to annotate any related underlying resources such as Compute Engine VMs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels have no impact on the security of the resource or data contained | None | None |
| `mysql` | Specifies connection parameters required specifically for MySQL databases. Structure is [documented below](#nested_mysql). | false | true | MySQL profiles may expose sensitive database connection details. Misconfigured host, ports, or missing SSL can lead to data breaches. | None | None |
| `postgresql` | Specifies connection parameters required specifically for PostgreSQL databases. Structure is [documented below](#nested_postgresql). | false | true | None | None | None |
| `oracle` | Specifies connection parameters required specifically for Oracle databases. Structure is [documented below](#nested_oracle). | false | true | None | None | None |
| `cloudsql` | Specifies required connection parameters, and, optionally, the parameters required to create a Cloud SQL destination database instance. Structure is [documented below](#nested_cloudsql). | false | true | Cloud SQL instances must enforce private networking and SSL to prevent exposure. | None | None |
| `alloydb` | Specifies required connection parameters, and the parameters required to create an AlloyDB destination cluster. Structure is [documented below](#nested_alloydb). | false | false | Not Security Related | None | None |
| `location` | The location where the connection profile should reside. | false | true | Location determines the region where the connection profile is deployed. | 'australia-southeast1', 'australia-southeast2' | us-east1 |
| `project` | If it is not provided, the provider project is used. | false | false | Not Security Related | None | None |
| `ssl` | This field is used in attributes of MySql PostgreSql and Oracle databases | false | true | The type of SSL used must be described | None | None |
| `forward_ssh_connectivity` | SSL configuration for the destination to connect to the source database. | false | true | Forward SSH introduces risk of misconfigurations and exposure. Configure private connectivity instead | Not configured | Configured |
| `private_connectivity` | Use private network to connect to Oracle database. | false | true | Private connectivity prevents external access over public networks. | None | None |
| `settings` | Immutable. Metadata used to create the destination Cloud SQL database. | false | true | Configure SSL and private network | None | None |
| `ip_config` | The settings for IP Management.  | false | true | Enable SSL and Private connection | None | None |
| `authorized_networks` | The list of external networks that are allowed to connect to the instance using the IP. Structure is [documented below](#nested_cloudsql_settings_ip_config_authorized_networks). | false | true | Authorized networks define which external IPs can access the database. Better not configured | Not configured | Configured |
| `initial_user` |  Initial user to setup during cluster creation. | true | false | Not Security Related | None | None |
| `primary_instance_settings` | Settings for the cluster's primary instance Structure  | false | false | Not Security Related | None | None |
| `machine_config` | Configuration for the machines that host the underlying database engine. Structure is [documented below](#nested_alloydb_settings_primary_instance_settings_machine_config). | true | false | Not Security Related | None | None |

### mysql Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `host` | The IP or hostname of the source MySQL database. | false | false | host value itself does not impact security since networking and SSL enforcement are controlled by other parameters such as private_network and require_ssl. | None | None |
| `port` | The network port of the source MySQL database. | false | false | Port has no impact on the security since the host will be private | None | None |
| `username` | The username that Database Migration Service will use to connect to the database. The value is encrypted when stored in Database Migration Service. | false | false | Username has no impact on the security of the resource or data contained | None | None |
| `password` | Input only. The password for the user that Database Migration Service will be using to connect to the database. This field is not returned on request, and the value is encrypted when stored in Database Migration Service. **Note**: This property is sensitive and will not be displayed in the plan. | false | false | Password will be set with the username buy deafault and doesnot depend on a rego policy | None | None |
| `password_set` | (Output) Output only. Indicates If this connection profile password is stored. | false | false | This is the output | None | None |
| `ssl` | SSL configuration for the destination to connect to the source database. Structure is [documented below](#nested_mysql_ssl). | false | true | SSL ensures data in transit is encrypted, preventing eavesdropping or man-in-the-middle attacks. | 'SERVER_ONLY','SERVER_CLIENT','REQUIRED' | NONE |
| `cloud_sql_id` | If the source is a Cloud SQL database, use this field to provide the Cloud SQL instance ID of the source. | false | false | cloud_sql_id has no impact on the security of the resource or data contained | None | None |

### postgresql Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `host` | The IP or hostname of the source postgresql database. | false | false | host value itself does not impact security since networking and SSL enforcement are controlled by other parameters such as private_network and require_ssl. | None | None |
| `port` | The network port of the source postgresql database. | false | false | Port number itself does not impact security if host is private. | None | None |
| `username` | The username that Database Migration Service will use to connect to the database. The value is encrypted when stored in Database Migration Service. | false | false | Username alone has no security effect unless paired with weak roles. | None | None |
| `password` | Input only. The password for the user that Database Migration Service will be using to connect to the database. This field is not returned on request, and the value is encrypted when stored in Database Migration Service. **Note**: This property is sensitive and will not be displayed in the plan. | false | false | Password is handled securely by GCP. Policy cannot enforce complexity. | None | None |
| `password_set` | (Output) Output only. Indicates If this connection profile password is stored. | false | false | This is the output | None | None |
| `ssl` | SSL configuration for the destination to connect to the source database. Structure is [documented below](#nested_postgresql_ssl). | false | true | SSL is required for encryption of data in transit. | 'SERVER_ONLY','SERVER_CLIENT','REQUIRED' | NONE |
| `cloud_sql_id` | If the source is a Cloud SQL database, use this field to provide the Cloud SQL instance ID of the source. | false | false | cloud_sql_id has no impact on the security of the resource or data contained | None | None |
| `alloydb_cluster_id` | If the connected database is an AlloyDB instance, use this field to provide the AlloyDB cluster ID. | false | false | Alloydb cluster ID has no impact on the security of the resource or data contained | None | None |
| `network_architecture` | (Output) Output only. If the source is a Cloud SQL database, this field indicates the network architecture it's associated with. | false | false | This is the output | None | None |

### oracle Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `host` | Required. The IP or hostname of the source Oracle database. | true | false | host value itself does not impact security since networking and SSL enforcement are controlled by other parameters. | None | None |
| `port` | Required. The network port of the source Oracle database. | true | false | Port has no impact on the security since the host will be private | None | None |
| `username` | Required. The username that Database Migration Service will use to connect to the database. The value is encrypted when stored in Database Migration Service. | true | false | Username alone has no security effect unless paired with weak roles. | None | None |
| `password` | Required. Input only. The password for the user that Database Migration Service will be using to connect to the database. This field is not returned on request, and the value is encrypted when stored in Database Migration Service. **Note**: This property is sensitive and will not be displayed in the plan. | true | false | Password is handled securely by GCP. Policy cannot enforce complexity. | None | None |
| `password_set` | (Output) Output only. Indicates If this connection profile password is stored. | false | false | This is the output | None | None |
| `database_service` | Required. Database service for the Oracle connection. | true | false | Database service has no impact on the security of the resource or data contained | None | None |
| `ssl` | SSL configuration for the destination to connect to the source database. Structure is [documented below](#nested_oracle_ssl). | false | true | SSL protects sensitive Oracle traffic from interception. | 'SERVER_ONLY','SERVER_CLIENT','REQUIRED' | NONE |
| `static_service_ip_connectivity` | This object has no nested fields. Static IP address connectivity configured on service project. | false | true | Static service IP connectivity exposes the Oracle database over a fixed public IP. Use private connectivity instead | Not configured | Configured |
| `forward_ssh_connectivity` | SSL configuration for the destination to connect to the source database. Structure is [documented below](#nested_oracle_forward_ssh_connectivity). | false | true | Forward SSH introduces risk of misconfigurations and exposure. Use private connectivity instead | Not configured | Configured |
| `private_connectivity` | Configuration for using a private network to communicate with the source database Structure is [documented below](#nested_oracle_private_connectivity). | false | true | Private connectivity prevents external access over public networks. | Configured | Not configured |

### cloudsql Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cloud_sql_id` | (Output) Output only. The Cloud SQL instance ID that this connection profile is associated with. | false | false | This is the output | None | None |
| `settings` | Immutable. Metadata used to create the destination Cloud SQL database. Structure is [documented below](#nested_cloudsql_settings). | false | true | Configure SSL and private network | None | None |
| `private_ip` | (Output) Output only. The Cloud SQL database instance's private IP. | false | false | This is the output | None | None |
| `public_ip` | (Output) Output only. The Cloud SQL database instance's public IP. | false | false | This is the output | None | None |

### alloydb Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster_id` | Required. The AlloyDB cluster ID that this connection profile is associated with. | true | false | Not Security Related | None | None |
| `settings` | Immutable. Metadata used to create the destination AlloyDB cluster. Structure is [documented below](#nested_alloydb_settings). | false | false | Not Security Related | None | None |

### ssl Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | (Output) The current connection profile state. | false | true | The SSL type determines the level of encryption and whether client certificates are enforced. | 'SERVER_ONLY','SERVER_CLIENT','REQUIRED' | NONE |
| `client_key` | Input only. The unencrypted PKCS#1 or PKCS#8 PEM-encoded private key associated with the Client Certificate. If this field is used then the 'clientCertificate' field is mandatory. **Note**: This property is sensitive and will not be displayed in the plan. | false | false | Depends on SSL Type | None | None |
| `client_certificate` | Input only. The x509 PEM-encoded certificate that will be used by the replica to authenticate against the source database server. If this field is used then the 'clientKey' field is mandatory **Note**: This property is sensitive and will not be displayed in the plan. | false | false | Depends on SSL Type | None | None |
| `ca_certificate` | Input only. The x509 PEM-encoded certificate of the CA that signed the source database server's certificate. The replica will use this certificate to verify it's connecting to the right host. **Note**: This property is sensitive and will not be displayed in the plan. | false | false | Depends on SSL Type | None | None |

### forward_ssh_connectivity Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `hostname` | Required. Hostname for the SSH tunnel. | true | false | None | None | None |
| `username` | Required. Username for the SSH tunnel. | true | false | None | None | None |
| `port` | Port for the SSH tunnel, default value is 22. | true | false | None | None | None |
| `password` | Input only. SSH password. Only one of `password` and `private_key` can be configured. **Note**: This property is sensitive and will not be displayed in the plan. | false | false | None | None | None |
| `private_key` | Input only. SSH private key. Only one of `password` and `private_key` can be configured. **Note**: This property is sensitive and will not be displayed in the plan. | false | false | None | None | None |

### private_connectivity Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `private_connection` | Required. The resource name (URI) of the private connection. | true | true | Private connectivity prevents external access over public networks. | Compliant URI | Non-Compliant URI |

### settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `database_version` | The database engine type and version. Currently supported values located at https://cloud.google.com/database-migration/docs/reference/rest/v1/projects.locations.connectionProfiles#sqldatabaseversion | false | false | Not Security Related | None | None |
| `user_labels` | The resource labels for a Cloud SQL instance to use to annotate any related underlying resources such as Compute Engine VMs. | false | false | Not Security Related | None | None |
| `tier` | The tier (or machine type) for this instance, for example: db-n1-standard-1 (MySQL instances) or db-custom-1-3840 (PostgreSQL instances). For more information, see https://cloud.google.com/sql/docs/mysql/instance-settings | false | false | Not Security Related | None | None |
| `storage_auto_resize_limit` | The maximum size to which storage capacity can be automatically increased. The default value is 0, which specifies that there is no limit. | false | false | Not Security Related | None | None |
| `activation_policy` | The activation policy specifies when the instance is activated; it is applicable only when the instance state is 'RUNNABLE'. Possible values are: `ALWAYS`, `NEVER`. | false | false | Not Security Related | None | None |
| `ip_config` | The settings for IP Management. This allows to enable or disable the instance IP and manage which external networks can connect to the instance. The IPv4 address cannot be disabled. Structure is [documented below](#nested_cloudsql_settings_ip_config). | false | true | Enable SSL and Private connection | None | None |
| `auto_storage_increase` | If you enable this setting, Cloud SQL checks your available storage every 30 seconds. If the available storage falls below a threshold size, Cloud SQL automatically adds additional storage capacity. If the available storage repeatedly falls below the threshold size, Cloud SQL continues to add storage until it reaches the maximum of 30 TB. | false | false | Not Security Related | None | None |
| `database_flags` | The database flags passed to the Cloud SQL instance at startup. | false | false | Not Security Related | None | None |
| `data_disk_type` | The type of storage. Possible values are: `PD_SSD`, `PD_HDD`. | false | false | Not Security Related | None | None |
| `data_disk_size_gb` | The storage capacity available to the database, in GB. The minimum (and default) size is 10GB. | false | false | Not Security Related | None | None |
| `zone` | The Google Cloud Platform zone where your Cloud SQL datdabse instance is located. | false | false | Not Security Related | None | None |
| `source_id` | The Database Migration Service source connection profile ID, in the format: projects/my_project_name/locations/us-central1/connectionProfiles/connection_profile_ID | true | false | Not Security Related | None | None |
| `root_password` | Input only. Initial root password. **Note**: This property is sensitive and will not be displayed in the plan. | false | false | Not Security Related | None | None |
| `root_password_set` | (Output) Output only. Indicates If this connection profile root password is stored. | false | false | This is the output | None | None |
| `collation` | The Cloud SQL default instance level collation. | false | false | Not Security Related | None | None |
| `cmek_key_name` | The KMS key name used for the csql instance. | false | true | CloudSQL connection profiles must use CMEK encryption. | Compliant_Key | Non_Compliant_Key |
| `edition` | The edition of the given Cloud SQL instance. Possible values are: `ENTERPRISE`, `ENTERPRISE_PLUS`. | false | false | Not Security Related | None | None |
| `initial_user` | Required. Input only. Initial user to setup during cluster creation. Structure is [documented below](#nested_alloydb_settings_initial_user). | true | false | Not Security Related | None | None |
| `vpc_network` | Required. The resource link for the VPC network in which cluster resources are created and from which they are accessible via Private IP. The network must belong to the same project as the cluster. It is specified in the form: 'projects/{project_number}/global/networks/{network_id}'. This is required to create a cluster. | true | false | This is a required field already | None | None |
| `labels` | Labels for the AlloyDB cluster created by DMS. | false | false | Not Security Related | None | None |
| `primary_instance_settings` | Settings for the cluster's primary instance Structure is [documented below](#nested_alloydb_settings_primary_instance_settings). | false | false | Not Security Related | None | None |

### ip_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enable_ipv4` | Whether the instance should be assigned an IPv4 address or not. | false | false | Not Security Related | None | None |
| `private_network` | The resource link for the VPC network from which the Cloud SQL instance is accessible for private IP. For example, projects/myProject/global/networks/default. This setting can be updated, but it cannot be removed after it is set. | false | true | Private networks restrict connectivity to internal VPCs, preventing exposure over the public internet. | projects/myProject/global/networks/default | Not configured |
| `require_ssl` | Whether SSL connections over IP should be enforced or not. | false | true | Enforcing SSL ensures that all traffic between clients and the database is encrypted | True | False |
| `authorized_networks` | The list of external networks that are allowed to connect to the instance using the IP. Structure is [documented below](#nested_cloudsql_settings_ip_config_authorized_networks). | false | true | Authorized networks define which external IPs can access the database. Better not configured | Not configured | Configured |

### authorized_networks Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `value` | The allowlisted value for the access control list. | true | false | None | None | None |
| `label` | A label to identify this entry. | false | false | None | None | None |
| `expire_time` | The time when this access control entry expires in RFC 3339 format. | false | false | None | None | None |
| `ttl` | Input only. The time-to-leave of this access control entry. | false | false | None | None | None |

### initial_user Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `user` | The database username. | true | false | None | None | None |
| `password` | The initial password for the user. **Note**: This property is sensitive and will not be displayed in the plan. | true | false | None | None | None |
| `password_set` | (Output) Output only. Indicates if the initialUser.password field has been set. | false | false | None | None | None |

### primary_instance_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | The database username. | true | false | None | None | None |
| `machine_config` | Configuration for the machines that host the underlying database engine. Structure is [documented below](#nested_alloydb_settings_primary_instance_settings_machine_config). | true | false | None | None | None |
| `database_flags` | Database flags to pass to AlloyDB when DMS is creating the AlloyDB cluster and instances. See the AlloyDB documentation for how these can be used. | false | false | None | None | None |
| `labels` | Labels for the AlloyDB primary instance created by DMS. | false | false | None | None | None |
| `private_ip` | (Output) Output only. The private IP address for the Instance. This is the connection endpoint for an end-user application. | false | false | None | None | None |

### machine_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cpu_count` | The number of CPU's in the VM instance. | true | false | None | None | None |
