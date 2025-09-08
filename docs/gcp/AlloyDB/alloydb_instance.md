## 🛡️ Policy Deployment Engine: `alloydb_instance`

This section provides a concise policy evaluation for the `alloydb_instance` resource in GCP.

Reference: [Terraform Registry – alloydb_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instance_type` | The type of the instance. If the instance type is READ_POOL, provide the associated PRIMARY/SECONDARY instance in the `depends_on` meta-data attribute. If the instance type is SECONDARY, point to the cluster_type of the associated secondary cluster instead of mentioning SECONDARY. Example: {instance_type = google_alloydb_cluster.<secondary_cluster_name>.cluster_type} instead of {instance_type = SECONDARY} If the instance type is SECONDARY, the terraform delete instance operation does not delete the secondary instance but abandons it instead. Use deletion_policy = "FORCE" in the associated secondary cluster and delete the cluster forcefully to delete the secondary cluster as well its associated secondary instance. Users can undo the delete secondary instance action by importing the deleted secondary instance by calling terraform import. Possible values are: `PRIMARY`, `READ_POOL`, `SECONDARY`. | true | None | None |
| `cluster` | Identifies the alloydb cluster. Must be in the format 'projects/{project}/locations/{location}/clusters/{cluster_id}' | true | None | None |
| `instance_id` | The ID of the alloydb instance. | true | None | None |
| `labels` | User-defined labels for the alloydb instance. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `annotations` | Annotations to allow client tools to store small amount of arbitrary data. This is distinct from labels. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `display_name` | User-settable and human-readable display name for the Instance. | false | None | None |
| `gce_zone` | The Compute Engine zone that the instance should serve from, per https://cloud.google.com/compute/docs/regions-zones This can ONLY be specified for ZONAL instances. If present for a REGIONAL instance, an error will be thrown. If this is absent for a ZONAL instance, instance is created in a random zone with available capacity. | false | None | None |
| `database_flags` | Database flags. Set at instance level. * They are copied from primary instance on read instance creation. * Read instances can set new or override existing flags that are relevant for reads, e.g. for enabling columnar cache on a read instance. Flags set on read instance may or may not be present on primary. | false | None | None |
| `availability_type` | 'Availability type of an Instance. Defaults to REGIONAL for both primary and read instances. Note that primary and read instances can have different availability types. Primary instances can be either ZONAL or REGIONAL. Read Pool instances can also be either ZONAL or REGIONAL. Read pools of size 1 can only have zonal availability. Read pools with a node count of 2 or more can have regional availability (nodes are present in 2 or more zones in a region). Possible values are: `AVAILABILITY_TYPE_UNSPECIFIED`, `ZONAL`, `REGIONAL`.' Possible values are: `AVAILABILITY_TYPE_UNSPECIFIED`, `ZONAL`, `REGIONAL`. | false | None | None |
| `activation_policy` | 'Specifies whether an instance needs to spin up. Once the instance is active, the activation policy can be updated to the `NEVER` to stop the instance. Likewise, the activation policy can be updated to `ALWAYS` to start the instance. There are restrictions around when an instance can/cannot be activated (for example, a read pool instance should be stopped before stopping primary etc.). Please refer to the API documentation for more details. Possible values are: `ACTIVATION_POLICY_UNSPECIFIED`, `ALWAYS`, `NEVER`.' Possible values are: `ACTIVATION_POLICY_UNSPECIFIED`, `ALWAYS`, `NEVER`. | false | None | None |

### query_insights_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `query_string_length` | Query string length. The default value is 1024. Any integer between 256 and 4500 is considered valid. | false | None | None |
| `record_application_tags` | Record application tags for an instance. This flag is turned "on" by default. | false | None | None |
| `record_client_address` | Record client address for an instance. Client address is PII information. This flag is turned "on" by default. | false | None | None |
| `query_plans_per_minute` | Number of query execution plans captured by Insights per minute for all queries combined. The default value is 5. Any integer between 0 and 20 is considered valid. | false | None | None |

### observability_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Observability feature status for an instance. | false | None | None |
| `preserve_comments` | Preserve comments in the query string. | false | None | None |
| `track_wait_events` | Record wait events during query execution for an instance. | false | None | None |
| `track_wait_event_types` | Record wait event types during query execution for an instance. | false | None | None |
| `max_query_string_length` | Query string length. The default value is 10240. Any integer between 1024 and 100000 is considered valid. | false | None | None |
| `record_application_tags` | Record application tags for an instance. This flag is turned "on" by default. | false | None | None |
| `query_plans_per_minute` | Number of query execution plans captured by Insights per minute for all queries combined. The default value is 5. Any integer between 0 and 200 is considered valid. | false | None | None |
| `track_active_queries` | Track actively running queries. If not set, default value is "off". | false | None | None |
| `assistive_experiences_enabled` | Whether assistive experiences are enabled for this AlloyDB instance. | false | None | None |

### read_pool_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_count` | Read capacity, i.e. number of nodes in a read pool instance. | false | None | None |

### machine_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cpu_count` | The number of CPU's in the VM instance. | false | None | None |
| `machine_type` | Machine type of the VM instance. E.g. "n2-highmem-4", "n2-highmem-8", "c4a-highmem-4-lssd". `cpu_count` must match the number of vCPUs in the machine type. | false | None | None |

### client_connection_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `require_connectors` | Configuration to enforce connectors only (ex: AuthProxy) connections to the database. | false | None | None |
| `ssl_config` | SSL config option for this instance. Structure is [documented below](#nested_client_connection_config_ssl_config). | false | None | None |

### psc_instance_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_attachment_link` | (Output) The service attachment created when Private Service Connect (PSC) is enabled for the instance. The name of the resource will be in the format of `projects/<alloydb-tenant-project-number>/regions/<region-name>/serviceAttachments/<service-attachment-name>` | none | None | None |
| `allowed_consumer_projects` | List of consumer projects that are allowed to create PSC endpoints to service-attachments to this instance. These should be specified as project numbers only. | false | None | None |
| `psc_dns_name` | (Output) The DNS name of the instance for PSC connectivity. Name convention: <uid>.<uid>.<region>.alloydb-psc.goog | none | None | None |
| `psc_interface_configs` | Configurations for setting up PSC interfaces attached to the instance which are used for outbound connectivity. Currently, AlloyDB supports only 0 or 1 PSC interface. Structure is [documented below](#nested_psc_instance_config_psc_interface_configs). | false | None | None |
| `psc_auto_connections` | Configurations for setting up PSC service automation. Structure is [documented below](#nested_psc_instance_config_psc_auto_connections). | false | None | None |

### network_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `authorized_external_networks` | A list of external networks authorized to access this instance. This field is only allowed to be set when `enable_public_ip` is set to true. Structure is [documented below](#nested_network_config_authorized_external_networks). | false | None | None |
| `enable_public_ip` | Enabling public ip for the instance. If a user wishes to disable this, please also clear the list of the authorized external networks set on the same instance. | false | None | None |
| `enable_outbound_public_ip` | Enabling outbound public ip for the instance. | false | None | None |
| `allocated_ip_range_override` | Name of the allocated IP range for the private IP AlloyDB instance, for example: "google-managed-services-default". If set, the instance IPs will be created from this allocated range and will override the IP range used by the parent cluster. The range name must comply with RFC 1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])?. | false | None | None |

### ssl_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ssl_mode` | SSL mode. Specifies client-server SSL/TLS connection behavior. Possible values are: `ENCRYPTED_ONLY`, `ALLOW_UNENCRYPTED_AND_ENCRYPTED`. | false | None | None |

### psc_interface_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network_attachment_resource` | The network attachment resource created in the consumer project to which the PSC interface will be linked. This is of the format: "projects/${CONSUMER_PROJECT}/regions/${REGION}/networkAttachments/${NETWORK_ATTACHMENT_NAME}". The network attachment must be in the same region as the instance. | false | None | None |

### psc_auto_connections Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `consumer_project` | The consumer project to which the PSC service automation endpoint will be created. The API expects the consumer project to be the project ID( and not the project number). | false | None | None |
| `consumer_network` | The consumer network for the PSC service automation, example: "projects/vpc-host-project/global/networks/default". The consumer network might be hosted a different project than the consumer project. The API expects the consumer project specified to be the project ID (and not the project number) | false | None | None |
| `ip_address` | (Output) The IP address of the PSC service automation endpoint. | none | None | None |
| `status` | (Output) The status of the PSC service automation connection. | none | None | None |
| `consumer_network_status` | (Output) The status of the service connection policy. | none | None | None |

### authorized_external_networks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cidr_range` | CIDR range for one authorized network of the instance. | false | None | None |
