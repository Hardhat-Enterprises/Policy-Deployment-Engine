## 🛡️ Policy Deployment Engine: `oracle_database_cloud_vm_cluster`

This section provides a concise policy evaluation for the `oracle_database_cloud_vm_cluster` resource in GCP.

Reference: [Terraform Registry – oracle_database_cloud_vm_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/oracle_database_cloud_vm_cluster)

---

## 1. Argument Reference

### `exadata_infrastructure`
- Description: (Required) The name of the Exadata Infrastructure resource on which VM cluster resource is created, in the following format: projects/{project}/locations/{region}/cloudExadataInfrastuctures/{cloud_extradata_infrastructure}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Resource ID segment making up resource `name`. See documentation for resource type `oracledatabase.googleapis.com/DbNode`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_vm_cluster_id`
- Description: (Required) The ID of the VM Cluster to create. This value is restricted to (^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$) and must be a maximum of 63 characters in length. The value must start with a letter and end with a letter or a number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User friendly name for this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) Various properties and settings associated with Exadata VM cluster. Structure is [documented below](#nested_properties).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels or tags associated with the VM Cluster. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cidr`
- Description: (Optional) Network settings. CIDR to use for cluster IP allocation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_subnet_cidr`
- Description: (Optional) CIDR range of the backup subnet.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The name of the VPC network. Format: projects/{project}/global/networks/{network}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `odb_network`
- Description: (Optional) The name of the OdbNetwork associated with the VM Cluster. Format: projects/{project}/locations/{location}/odbNetworks/{odb_network} It is optional but if specified, this should match the parent ODBNetwork of the odb_subnet and backup_odb_subnet.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `odb_subnet`
- Description: (Optional) The name of the OdbSubnet associated with the VM Cluster for IP allocation. Format: projects/{project}/locations/{location}/odbNetworks/{odb_network}/odbSubnets/{odb_subnet}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_odb_subnet`
- Description: (Optional) The name of the backup OdbSubnet associated with the VM Cluster. Format: projects/{project}/locations/{location}/odbNetworks/{odb_network}/odbSubnets/{odb_subnet}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: <a name="nested_properties"></a>The `properties` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ocid`
- Description: (Output) Oracle Cloud Infrastructure ID of VM Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `license_type`
- Description: (Required) License type of VM Cluster. Possible values: LICENSE_TYPE_UNSPECIFIED LICENSE_INCLUDED BRING_YOUR_OWN_LICENSE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gi_version`
- Description: (Optional) Grid Infrastructure Version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: (Optional) Represents a time zone from the [IANA Time Zone Database](https://www.iana.org/time-zones). Structure is [documented below](#nested_properties_time_zone).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssh_public_keys`
- Description: (Optional) SSH public keys to be stored with cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_count`
- Description: (Optional) Number of database servers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shape`
- Description: (Output) Shape of VM Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ocpu_count`
- Description: (Optional) OCPU count per VM. Minimum is 0.1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory_size_gb`
- Description: (Optional) Memory allocated in GBs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `db_node_storage_size_gb`
- Description: (Optional) Local storage per VM
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_size_gb`
- Description: (Output) The storage allocation for the disk group, in gigabytes (GB).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_storage_size_tb`
- Description: (Optional) The data disk group size to be allocated in TBs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_redundancy`
- Description: (Optional) The type of redundancy. Possible values: DISK_REDUNDANCY_UNSPECIFIED HIGH NORMAL
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sparse_diskgroup_enabled`
- Description: (Optional) Use exadata sparse snapshots.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_backup_enabled`
- Description: (Optional) Use local backup.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname_prefix`
- Description: (Optional) Prefix for VM cluster host names.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `diagnostics_data_collection_options`
- Description: (Optional) Data collection options for diagnostics. Structure is [documented below](#nested_properties_diagnostics_data_collection_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) State of the cluster. Possible values: STATE_UNSPECIFIED PROVISIONING AVAILABLE UPDATING TERMINATING TERMINATED FAILED MAINTENANCE_IN_PROGRESS
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scan_listener_port_tcp`
- Description: (Output) SCAN listener port - TCP
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scan_listener_port_tcp_ssl`
- Description: (Output) SCAN listener port - TLS
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain`
- Description: (Output) Parent DNS domain where SCAN DNS and hosts names are qualified. ex: ocispdelegated.ocisp10jvnet.oraclevcn.com
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scan_dns`
- Description: (Output) SCAN DNS name. ex: sp2-yi0xq-scan.ocispdelegated.ocisp10jvnet.oraclevcn.com
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname`
- Description: (Output) host name without domain. format: "-" with some suffix. ex: sp2-yi0xq where "sp2" is the hostname_prefix.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_core_count`
- Description: (Required) Number of enabled CPU cores.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `system_version`
- Description: (Output) Operating system version of the image.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scan_ip_ids`
- Description: (Output) OCIDs of scan IPs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scan_dns_record_id`
- Description: (Output) OCID of scan DNS record.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oci_url`
- Description: (Output) Deep link to the OCI console to view this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `db_server_ocids`
- Description: (Optional) OCID of database servers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `compartment_id`
- Description: (Output) Compartment ID of cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_listener_ip`
- Description: (Output) DNS listener IP.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_name`
- Description: (Optional) OCI Cluster name. <a name="nested_properties_time_zone"></a>The `time_zone` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Optional) IANA Time Zone Database time zone, e.g. "America/New_York". <a name="nested_properties_diagnostics_data_collection_options"></a>The `diagnostics_data_collection_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `diagnostics_events_enabled`
- Description: (Optional) Indicates whether diagnostic collection is enabled for the VM cluster
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `health_monitoring_enabled`
- Description: (Optional) Indicates whether health monitoring is enabled for the VM cluster
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `incident_logs_enabled`
- Description: (Optional) Indicates whether incident logs and trace collection are enabled for the VM cluster
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
