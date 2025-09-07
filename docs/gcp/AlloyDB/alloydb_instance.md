## 🛡️ Policy Deployment Engine: `alloydb_instance`

This section provides a concise policy evaluation for the `alloydb_instance` resource in GCP.

Reference: [Terraform Registry – alloydb_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_instance)

---

## 1. Argument Reference

### `instance_type`
- Description: (Required) The type of the instance. If the instance type is READ_POOL, provide the associated PRIMARY/SECONDARY instance in the `depends_on` meta-data attribute. If the instance type is SECONDARY, point to the cluster_type of the associated secondary cluster instead of mentioning SECONDARY. Example: {instance_type = google_alloydb_cluster.<secondary_cluster_name>.cluster_type} instead of {instance_type = SECONDARY} If the instance type is SECONDARY, the terraform delete instance operation does not delete the secondary instance but abandons it instead. Use deletion_policy = "FORCE" in the associated secondary cluster and delete the cluster forcefully to delete the secondary cluster as well its associated secondary instance. Users can undo the delete secondary instance action by importing the deleted secondary instance by calling terraform import. Possible values are: `PRIMARY`, `READ_POOL`, `SECONDARY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Required) Identifies the alloydb cluster. Must be in the format 'projects/{project}/locations/{location}/clusters/{cluster_id}'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_id`
- Description: (Required) The ID of the alloydb instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels for the alloydb instance. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Annotations to allow client tools to store small amount of arbitrary data. This is distinct from labels. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User-settable and human-readable display name for the Instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gce_zone`
- Description: (Optional) The Compute Engine zone that the instance should serve from, per https://cloud.google.com/compute/docs/regions-zones This can ONLY be specified for ZONAL instances. If present for a REGIONAL instance, an error will be thrown. If this is absent for a ZONAL instance, instance is created in a random zone with available capacity.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_flags`
- Description: (Optional) Database flags. Set at instance level. * They are copied from primary instance on read instance creation. * Read instances can set new or override existing flags that are relevant for reads, e.g. for enabling columnar cache on a read instance. Flags set on read instance may or may not be present on primary.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `availability_type`
- Description: (Optional) 'Availability type of an Instance. Defaults to REGIONAL for both primary and read instances. Note that primary and read instances can have different availability types. Primary instances can be either ZONAL or REGIONAL. Read Pool instances can also be either ZONAL or REGIONAL. Read pools of size 1 can only have zonal availability. Read pools with a node count of 2 or more can have regional availability (nodes are present in 2 or more zones in a region). Possible values are: `AVAILABILITY_TYPE_UNSPECIFIED`, `ZONAL`, `REGIONAL`.' Possible values are: `AVAILABILITY_TYPE_UNSPECIFIED`, `ZONAL`, `REGIONAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `activation_policy`
- Description: (Optional) 'Specifies whether an instance needs to spin up. Once the instance is active, the activation policy can be updated to the `NEVER` to stop the instance. Likewise, the activation policy can be updated to `ALWAYS` to start the instance. There are restrictions around when an instance can/cannot be activated (for example, a read pool instance should be stopped before stopping primary etc.). Please refer to the API documentation for more details. Possible values are: `ACTIVATION_POLICY_UNSPECIFIED`, `ALWAYS`, `NEVER`.' Possible values are: `ACTIVATION_POLICY_UNSPECIFIED`, `ALWAYS`, `NEVER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_insights_config`
- Description: (Optional) Configuration for query insights. Structure is [documented below](#nested_query_insights_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `observability_config`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Configuration for enhanced query insights. Structure is [documented below](#nested_observability_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_pool_config`
- Description: (Optional) Read pool specific config. If the instance type is READ_POOL, this configuration must be provided. Structure is [documented below](#nested_read_pool_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_config`
- Description: (Optional) Configurations for the machines that host the underlying database engine. Structure is [documented below](#nested_machine_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_connection_config`
- Description: (Optional) Client connection specific configurations. Structure is [documented below](#nested_client_connection_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_instance_config`
- Description: (Optional) Configuration for Private Service Connect (PSC) for the instance. Structure is [documented below](#nested_psc_instance_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_config`
- Description: (Optional) Instance level network configuration. Structure is [documented below](#nested_network_config). <a name="nested_query_insights_config"></a>The `query_insights_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_string_length`
- Description: (Optional) Query string length. The default value is 1024. Any integer between 256 and 4500 is considered valid.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `record_application_tags`
- Description: (Optional) Record application tags for an instance. This flag is turned "on" by default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `record_client_address`
- Description: (Optional) Record client address for an instance. Client address is PII information. This flag is turned "on" by default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_plans_per_minute`
- Description: (Optional) Number of query execution plans captured by Insights per minute for all queries combined. The default value is 5. Any integer between 0 and 20 is considered valid. <a name="nested_observability_config"></a>The `observability_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Observability feature status for an instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preserve_comments`
- Description: (Optional) Preserve comments in the query string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `track_wait_events`
- Description: (Optional) Record wait events during query execution for an instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `track_wait_event_types`
- Description: (Optional) Record wait event types during query execution for an instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_query_string_length`
- Description: (Optional) Query string length. The default value is 10240. Any integer between 1024 and 100000 is considered valid.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `record_application_tags`
- Description: (Optional) Record application tags for an instance. This flag is turned "on" by default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_plans_per_minute`
- Description: (Optional) Number of query execution plans captured by Insights per minute for all queries combined. The default value is 5. Any integer between 0 and 200 is considered valid.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `track_active_queries`
- Description: (Optional) Track actively running queries. If not set, default value is "off".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `assistive_experiences_enabled`
- Description: (Optional) Whether assistive experiences are enabled for this AlloyDB instance. <a name="nested_read_pool_config"></a>The `read_pool_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_count`
- Description: (Optional) Read capacity, i.e. number of nodes in a read pool instance. <a name="nested_machine_config"></a>The `machine_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_count`
- Description: (Optional) The number of CPU's in the VM instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: (Optional) Machine type of the VM instance. E.g. "n2-highmem-4", "n2-highmem-8", "c4a-highmem-4-lssd". `cpu_count` must match the number of vCPUs in the machine type. <a name="nested_client_connection_config"></a>The `client_connection_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_connectors`
- Description: (Optional) Configuration to enforce connectors only (ex: AuthProxy) connections to the database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_config`
- Description: (Optional) SSL config option for this instance. Structure is [documented below](#nested_client_connection_config_ssl_config). <a name="nested_client_connection_config_ssl_config"></a>The `ssl_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_mode`
- Description: (Optional) SSL mode. Specifies client-server SSL/TLS connection behavior. Possible values are: `ENCRYPTED_ONLY`, `ALLOW_UNENCRYPTED_AND_ENCRYPTED`. <a name="nested_psc_instance_config"></a>The `psc_instance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_attachment_link`
- Description: (Output) The service attachment created when Private Service Connect (PSC) is enabled for the instance. The name of the resource will be in the format of `projects/<alloydb-tenant-project-number>/regions/<region-name>/serviceAttachments/<service-attachment-name>`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_consumer_projects`
- Description: (Optional) List of consumer projects that are allowed to create PSC endpoints to service-attachments to this instance. These should be specified as project numbers only.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_dns_name`
- Description: (Output) The DNS name of the instance for PSC connectivity. Name convention: <uid>.<uid>.<region>.alloydb-psc.goog
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_interface_configs`
- Description: (Optional) Configurations for setting up PSC interfaces attached to the instance which are used for outbound connectivity. Currently, AlloyDB supports only 0 or 1 PSC interface. Structure is [documented below](#nested_psc_instance_config_psc_interface_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_auto_connections`
- Description: (Optional) Configurations for setting up PSC service automation. Structure is [documented below](#nested_psc_instance_config_psc_auto_connections). <a name="nested_psc_instance_config_psc_interface_configs"></a>The `psc_interface_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_attachment_resource`
- Description: (Optional) The network attachment resource created in the consumer project to which the PSC interface will be linked. This is of the format: "projects/${CONSUMER_PROJECT}/regions/${REGION}/networkAttachments/${NETWORK_ATTACHMENT_NAME}". The network attachment must be in the same region as the instance. <a name="nested_psc_instance_config_psc_auto_connections"></a>The `psc_auto_connections` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consumer_project`
- Description: (Optional) The consumer project to which the PSC service automation endpoint will be created. The API expects the consumer project to be the project ID( and not the project number).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consumer_network`
- Description: (Optional) The consumer network for the PSC service automation, example: "projects/vpc-host-project/global/networks/default". The consumer network might be hosted a different project than the consumer project. The API expects the consumer project specified to be the project ID (and not the project number)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Output) The IP address of the PSC service automation endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `status`
- Description: (Output) The status of the PSC service automation connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consumer_network_status`
- Description: (Output) The status of the service connection policy. <a name="nested_network_config"></a>The `network_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorized_external_networks`
- Description: (Optional) A list of external networks authorized to access this instance. This field is only allowed to be set when `enable_public_ip` is set to true. Structure is [documented below](#nested_network_config_authorized_external_networks).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_public_ip`
- Description: (Optional) Enabling public ip for the instance. If a user wishes to disable this, please also clear the list of the authorized external networks set on the same instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_outbound_public_ip`
- Description: (Optional) Enabling outbound public ip for the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allocated_ip_range_override`
- Description: (Optional) Name of the allocated IP range for the private IP AlloyDB instance, for example: "google-managed-services-default". If set, the instance IPs will be created from this allocated range and will override the IP range used by the parent cluster. The range name must comply with RFC 1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])?. <a name="nested_network_config_authorized_external_networks"></a>The `authorized_external_networks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cidr_range`
- Description: (Optional) CIDR range for one authorized network of the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
