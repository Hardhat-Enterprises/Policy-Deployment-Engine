## 🛡️ Policy Deployment Engine: `oracle_database_cloud_vm_cluster`

This section provides a concise policy evaluation for the `oracle_database_cloud_vm_cluster` resource in GCP.

Reference: [Terraform Registry – oracle_database_cloud_vm_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/oracle_database_cloud_vm_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `exadata_infrastructure` | The name of the Exadata Infrastructure resource on which VM cluster resource is created, in the following format: projects/{project}/locations/{region}/cloudExadataInfrastuctures/{cloud_extradata_infrastructure} | true | None | None |
| `location` | Resource ID segment making up resource `name`. See documentation for resource type `oracledatabase.googleapis.com/DbNode`. | true | None | None |
| `cloud_vm_cluster_id` | The ID of the VM Cluster to create. This value is restricted to (^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$) and must be a maximum of 63 characters in length. The value must start with a letter and end with a letter or a number. | true | None | None |
| `display_name` | User friendly name for this resource. | false | None | None |
| `labels` | Labels or tags associated with the VM Cluster. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `cidr` | Network settings. CIDR to use for cluster IP allocation. | false | None | None |
| `backup_subnet_cidr` | CIDR range of the backup subnet. | false | None | None |
| `network` | The name of the VPC network. Format: projects/{project}/global/networks/{network} | false | None | None |
| `odb_network` | The name of the OdbNetwork associated with the VM Cluster. Format: projects/{project}/locations/{location}/odbNetworks/{odb_network} It is optional but if specified, this should match the parent ODBNetwork of the odb_subnet and backup_odb_subnet. | false | None | None |
| `odb_subnet` | The name of the OdbSubnet associated with the VM Cluster for IP allocation. Format: projects/{project}/locations/{location}/odbNetworks/{odb_network}/odbSubnets/{odb_subnet} | false | None | None |
| `backup_odb_subnet` | The name of the backup OdbSubnet associated with the VM Cluster. Format: projects/{project}/locations/{location}/odbNetworks/{odb_network}/odbSubnets/{odb_subnet} | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_protection` |  | none | None | None |

### properties Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ocid` | (Output) Oracle Cloud Infrastructure ID of VM Cluster. | none | None | None |
| `license_type` | License type of VM Cluster. Possible values: LICENSE_TYPE_UNSPECIFIED LICENSE_INCLUDED BRING_YOUR_OWN_LICENSE | true | None | None |
| `gi_version` | Grid Infrastructure Version. | false | None | None |
| `time_zone` | Represents a time zone from the [IANA Time Zone Database](https://www.iana.org/time-zones). Structure is [documented below](#nested_properties_time_zone). | false | None | None |
| `ssh_public_keys` | SSH public keys to be stored with cluster. | false | None | None |
| `node_count` | Number of database servers. | false | None | None |
| `shape` | (Output) Shape of VM Cluster. | none | None | None |
| `ocpu_count` | OCPU count per VM. Minimum is 0.1. | false | None | None |
| `memory_size_gb` | Memory allocated in GBs. | false | None | None |
| `db_node_storage_size_gb` | Local storage per VM | false | None | None |
| `storage_size_gb` | (Output) The storage allocation for the disk group, in gigabytes (GB). | none | None | None |
| `data_storage_size_tb` | The data disk group size to be allocated in TBs. | false | None | None |
| `disk_redundancy` | The type of redundancy. Possible values: DISK_REDUNDANCY_UNSPECIFIED HIGH NORMAL | false | None | None |
| `sparse_diskgroup_enabled` | Use exadata sparse snapshots. | false | None | None |
| `local_backup_enabled` | Use local backup. | false | None | None |
| `hostname_prefix` | Prefix for VM cluster host names. | false | None | None |
| `diagnostics_data_collection_options` | Data collection options for diagnostics. Structure is [documented below](#nested_properties_diagnostics_data_collection_options). | false | None | None |
| `state` | (Output) State of the cluster. Possible values: STATE_UNSPECIFIED PROVISIONING AVAILABLE UPDATING TERMINATING TERMINATED FAILED MAINTENANCE_IN_PROGRESS | none | None | None |
| `scan_listener_port_tcp` | (Output) SCAN listener port - TCP | none | None | None |
| `scan_listener_port_tcp_ssl` | (Output) SCAN listener port - TLS | none | None | None |
| `domain` | (Output) Parent DNS domain where SCAN DNS and hosts names are qualified. ex: ocispdelegated.ocisp10jvnet.oraclevcn.com | none | None | None |
| `scan_dns` | (Output) SCAN DNS name. ex: sp2-yi0xq-scan.ocispdelegated.ocisp10jvnet.oraclevcn.com | none | None | None |
| `hostname` | (Output) host name without domain. format: "-" with some suffix. ex: sp2-yi0xq where "sp2" is the hostname_prefix. | none | None | None |
| `cpu_core_count` | Number of enabled CPU cores. | true | None | None |
| `system_version` | (Output) Operating system version of the image. | none | None | None |
| `scan_ip_ids` | (Output) OCIDs of scan IPs. | none | None | None |
| `scan_dns_record_id` | (Output) OCID of scan DNS record. | none | None | None |
| `oci_url` | (Output) Deep link to the OCI console to view this resource. | none | None | None |
| `db_server_ocids` | OCID of database servers. | false | None | None |
| `compartment_id` | (Output) Compartment ID of cluster. | none | None | None |
| `dns_listener_ip` | (Output) DNS listener IP. | none | None | None |
| `cluster_name` | OCI Cluster name. | false | None | None |

### time_zone Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | IANA Time Zone Database time zone, e.g. "America/New_York". | false | None | None |

### diagnostics_data_collection_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `diagnostics_events_enabled` | Indicates whether diagnostic collection is enabled for the VM cluster | false | None | None |
| `health_monitoring_enabled` | Indicates whether health monitoring is enabled for the VM cluster | false | None | None |
| `incident_logs_enabled` | Indicates whether incident logs and trace collection are enabled for the VM cluster | false | None | None |
