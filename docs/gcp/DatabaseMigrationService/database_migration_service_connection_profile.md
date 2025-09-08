## 🛡️ Policy Deployment Engine: `database_migration_service_connection_profile`

This section provides a concise policy evaluation for the `database_migration_service_connection_profile` resource in GCP.

Reference: [Terraform Registry – database_migration_service_connection_profile](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/database_migration_service_connection_profile)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `connection_profile_id` | The ID of the connection profile. | true | None | None |
| `display_name` | The connection profile display name. | false | None | None |
| `labels` | The resource labels for connection profile to use to annotate any related underlying resources such as Compute Engine VMs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `location` | The location where the connection profile should reside. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### mysql Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `host` | The IP or hostname of the source MySQL database. | false | None | None |
| `port` | The network port of the source MySQL database. | false | None | None |
| `username` | The username that Database Migration Service will use to connect to the database. The value is encrypted when stored in Database Migration Service. | false | None | None |
| `password` | Input only. The password for the user that Database Migration Service will be using to connect to the database. This field is not returned on request, and the value is encrypted when stored in Database Migration Service. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `password_set` | (Output) Output only. Indicates If this connection profile password is stored. | none | None | None |
| `ssl` | SSL configuration for the destination to connect to the source database. Structure is [documented below](#nested_mysql_ssl). | false | None | None |
| `cloud_sql_id` | If the source is a Cloud SQL database, use this field to provide the Cloud SQL instance ID of the source. | false | None | None |

### postgresql Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `host` | The IP or hostname of the source MySQL database. | false | None | None |
| `port` | The network port of the source MySQL database. | false | None | None |
| `username` | The username that Database Migration Service will use to connect to the database. The value is encrypted when stored in Database Migration Service. | false | None | None |
| `password` | Input only. The password for the user that Database Migration Service will be using to connect to the database. This field is not returned on request, and the value is encrypted when stored in Database Migration Service. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `password_set` | (Output) Output only. Indicates If this connection profile password is stored. | none | None | None |
| `ssl` | SSL configuration for the destination to connect to the source database. Structure is [documented below](#nested_postgresql_ssl). | false | None | None |
| `cloud_sql_id` | If the source is a Cloud SQL database, use this field to provide the Cloud SQL instance ID of the source. | false | None | None |
| `alloydb_cluster_id` | If the connected database is an AlloyDB instance, use this field to provide the AlloyDB cluster ID. | false | None | None |
| `network_architecture` | (Output) Output only. If the source is a Cloud SQL database, this field indicates the network architecture it's associated with. | none | None | None |

### oracle Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `host` | Required. The IP or hostname of the source Oracle database. | true | None | None |
| `port` | Required. The network port of the source Oracle database. | true | None | None |
| `username` | Required. The username that Database Migration Service will use to connect to the database. The value is encrypted when stored in Database Migration Service. | true | None | None |
| `password` | Required. Input only. The password for the user that Database Migration Service will be using to connect to the database. This field is not returned on request, and the value is encrypted when stored in Database Migration Service. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |
| `password_set` | (Output) Output only. Indicates If this connection profile password is stored. | none | None | None |
| `database_service` | Required. Database service for the Oracle connection. | true | None | None |
| `ssl` | SSL configuration for the destination to connect to the source database. Structure is [documented below](#nested_oracle_ssl). | false | None | None |
| `static_service_ip_connectivity` | This object has no nested fields. Static IP address connectivity configured on service project. | false | None | None |
| `forward_ssh_connectivity` | SSL configuration for the destination to connect to the source database. Structure is [documented below](#nested_oracle_forward_ssh_connectivity). | false | None | None |
| `private_connectivity` | Configuration for using a private network to communicate with the source database Structure is [documented below](#nested_oracle_private_connectivity). | false | None | None |

### cloudsql Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cloud_sql_id` | (Output) Output only. The Cloud SQL instance ID that this connection profile is associated with. | none | None | None |
| `settings` | Immutable. Metadata used to create the destination Cloud SQL database. Structure is [documented below](#nested_cloudsql_settings). | false | None | None |
| `private_ip` | (Output) Output only. The Cloud SQL database instance's private IP. | none | None | None |
| `public_ip` | (Output) Output only. The Cloud SQL database instance's public IP. | none | None | None |

### alloydb Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster_id` | Required. The AlloyDB cluster ID that this connection profile is associated with. | true | None | None |
| `settings` | Immutable. Metadata used to create the destination AlloyDB cluster. Structure is [documented below](#nested_alloydb_settings). | false | None | None |

### ssl Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | (Output) The current connection profile state. | none | None | None |
| `client_key` | Input only. The unencrypted PKCS#1 or PKCS#8 PEM-encoded private key associated with the Client Certificate. If this field is used then the 'clientCertificate' field is mandatory. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `client_certificate` | Input only. The x509 PEM-encoded certificate that will be used by the replica to authenticate against the source database server. If this field is used then the 'clientKey' field is mandatory **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `ca_certificate` | Input only. The x509 PEM-encoded certificate of the CA that signed the source database server's certificate. The replica will use this certificate to verify it's connecting to the right host. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |

### forward_ssh_connectivity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hostname` | Required. Hostname for the SSH tunnel. | true | None | None |
| `username` | Required. Username for the SSH tunnel. | true | None | None |
| `port` | Port for the SSH tunnel, default value is 22. | true | None | None |
| `password` | Input only. SSH password. Only one of `password` and `private_key` can be configured. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `private_key` | Input only. SSH private key. Only one of `password` and `private_key` can be configured. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |

### private_connectivity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `private_connection` | Required. The resource name (URI) of the private connection. | true | None | None |

### settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `database_version` | The database engine type and version. Currently supported values located at https://cloud.google.com/database-migration/docs/reference/rest/v1/projects.locations.connectionProfiles#sqldatabaseversion | false | None | None |
| `user_labels` | The resource labels for a Cloud SQL instance to use to annotate any related underlying resources such as Compute Engine VMs. | false | None | None |
| `tier` | The tier (or machine type) for this instance, for example: db-n1-standard-1 (MySQL instances) or db-custom-1-3840 (PostgreSQL instances). For more information, see https://cloud.google.com/sql/docs/mysql/instance-settings | false | None | None |
| `storage_auto_resize_limit` | The maximum size to which storage capacity can be automatically increased. The default value is 0, which specifies that there is no limit. | false | None | None |
| `activation_policy` | The activation policy specifies when the instance is activated; it is applicable only when the instance state is 'RUNNABLE'. Possible values are: `ALWAYS`, `NEVER`. | false | None | None |
| `ip_config` | The settings for IP Management. This allows to enable or disable the instance IP and manage which external networks can connect to the instance. The IPv4 address cannot be disabled. Structure is [documented below](#nested_cloudsql_settings_ip_config). | false | None | None |
| `auto_storage_increase` | If you enable this setting, Cloud SQL checks your available storage every 30 seconds. If the available storage falls below a threshold size, Cloud SQL automatically adds additional storage capacity. If the available storage repeatedly falls below the threshold size, Cloud SQL continues to add storage until it reaches the maximum of 30 TB. | false | None | None |
| `database_flags` | The database flags passed to the Cloud SQL instance at startup. | false | None | None |
| `data_disk_type` | The type of storage. Possible values are: `PD_SSD`, `PD_HDD`. | false | None | None |
| `data_disk_size_gb` | The storage capacity available to the database, in GB. The minimum (and default) size is 10GB. | false | None | None |
| `zone` | The Google Cloud Platform zone where your Cloud SQL datdabse instance is located. | false | None | None |
| `source_id` | The Database Migration Service source connection profile ID, in the format: projects/my_project_name/locations/us-central1/connectionProfiles/connection_profile_ID | true | None | None |
| `root_password` | Input only. Initial root password. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `root_password_set` | (Output) Output only. Indicates If this connection profile root password is stored. | none | None | None |
| `collation` | The Cloud SQL default instance level collation. | false | None | None |
| `cmek_key_name` | The KMS key name used for the csql instance. | false | None | None |
| `edition` | The edition of the given Cloud SQL instance. Possible values are: `ENTERPRISE`, `ENTERPRISE_PLUS`. | false | None | None |
| `initial_user` | Required. Input only. Initial user to setup during cluster creation. Structure is [documented below](#nested_alloydb_settings_initial_user). | true | None | None |
| `vpc_network` | Required. The resource link for the VPC network in which cluster resources are created and from which they are accessible via Private IP. The network must belong to the same project as the cluster. It is specified in the form: 'projects/{project_number}/global/networks/{network_id}'. This is required to create a cluster. | true | None | None |
| `labels` | Labels for the AlloyDB cluster created by DMS. | false | None | None |
| `primary_instance_settings` | Settings for the cluster's primary instance Structure is [documented below](#nested_alloydb_settings_primary_instance_settings). | false | None | None |

### ip_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_ipv4` | Whether the instance should be assigned an IPv4 address or not. | false | None | None |
| `private_network` | The resource link for the VPC network from which the Cloud SQL instance is accessible for private IP. For example, projects/myProject/global/networks/default. This setting can be updated, but it cannot be removed after it is set. | false | None | None |
| `require_ssl` | Whether SSL connections over IP should be enforced or not. | false | None | None |
| `authorized_networks` | The list of external networks that are allowed to connect to the instance using the IP. Structure is [documented below](#nested_cloudsql_settings_ip_config_authorized_networks). | false | None | None |

### authorized_networks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `value` | The allowlisted value for the access control list. | true | None | None |
| `label` | A label to identify this entry. | false | None | None |
| `expire_time` | The time when this access control entry expires in RFC 3339 format. | false | None | None |
| `ttl` | Input only. The time-to-leave of this access control entry. | false | None | None |

### initial_user Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `user` | The database username. | true | None | None |
| `password` | The initial password for the user. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |
| `password_set` | (Output) Output only. Indicates if the initialUser.password field has been set. | none | None | None |

### primary_instance_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | The database username. | true | None | None |
| `machine_config` | Configuration for the machines that host the underlying database engine. Structure is [documented below](#nested_alloydb_settings_primary_instance_settings_machine_config). | true | None | None |
| `database_flags` | Database flags to pass to AlloyDB when DMS is creating the AlloyDB cluster and instances. See the AlloyDB documentation for how these can be used. | false | None | None |
| `labels` | Labels for the AlloyDB primary instance created by DMS. | false | None | None |
| `private_ip` | (Output) Output only. The private IP address for the Instance. This is the connection endpoint for an end-user application. | none | None | None |

### machine_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cpu_count` | The number of CPU's in the VM instance. | true | None | None |
