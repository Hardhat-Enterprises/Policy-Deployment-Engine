## 🛡️ Policy Deployment Engine: `dataproc_cluster`

This section provides a concise policy evaluation for the `dataproc_cluster` resource in GCP.

Reference: [Terraform Registry – dataproc_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | zone. - - - | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
| `region` | Defaults to `global`. | none | None | None |
| `labels` | instances in the cluster. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | none | None | None |
| `terraform_labels` | The combination of labels configured directly on the resource and default labels configured on the provider. | none | None | None |
| `effective_labels` | instances in the cluster. GCP generates some itself including `goog-dataproc-cluster-name` which is the name of the cluster. | none | None | None |
| `graceful_decommission_timeout` | Does not affect auto scaling decomissioning from an autoscaling policy. Graceful decommissioning allows removing nodes from the cluster without interrupting jobs in progress. Timeout specifies how long to wait for jobs in progress to finish before forcefully removing nodes (and potentially interrupting jobs). Default timeout is 0 (for forceful decommission), and the maximum allowed timeout is 1 day. (see JSON representation of [Duration](https://developers.google.com/protocol-buffers/docs/proto3#json)). Only supported on Dataproc image versions 1.2 and higher. For more context see the [docs](https://cloud.google.com/dataproc/docs/reference/rest/v1/projects.regions.clusters/patch#query-parameters) - - - | none | None | None |
| `auxiliary_services_config` |  | none | None | None |
| `kubernetes_cluster_config` |  | none | None | None |

### virtual_cluster_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `staging_bucket` | such as Hadoop jars, between client machines and the cluster. Note: If you don't explicitly specify a `staging_bucket` then GCP will auto create / assign one for you. However, you are not guaranteed an auto generated bucket which is solely dedicated to your cluster; it may be shared with other clusters in the same region/zone also choosing to use the auto generation option. * `auxiliary_services_config` (Optional) Configuration of auxiliary services used by this cluster. Structure [defined below](#nested_auxiliary_services_config). * `kubernetes_cluster_config` (Required) The configuration for running the Dataproc cluster on Kubernetes. Structure [defined below](#nested_kubernetes_cluster_config). - - - | none | None | None |

### cluster_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `staging_bucket` | such as Hadoop jars, between client machines and the cluster. Note: If you don't explicitly specify a `staging_bucket` then GCP will auto create / assign one for you. However, you are not guaranteed an auto generated bucket which is solely dedicated to your cluster; it may be shared with other clusters in the same region/zone also choosing to use the auto generation option. | none | None | None |
| `temp_bucket` | and jobs data, such as Spark and MapReduce history files. Note: If you don't explicitly specify a `temp_bucket` then GCP will auto create / assign one for you. | none | None | None |
| `cluster_tier` | * `gce_cluster_config` (Optional) Common config settings for resources of Google Compute Engine cluster instances, applicable to all instances in the cluster. Structure [defined below](#nested_gce_cluster_config). * `master_config` (Optional) The Google Compute Engine config settings for the master instances in a cluster. Structure [defined below](#nested_master_config). * `worker_config` (Optional) The Google Compute Engine config settings for the worker instances in a cluster. Structure [defined below](#nested_worker_config). * `preemptible_worker_config` (Optional) The Google Compute Engine config settings for the additional instances in a cluster. Structure [defined below](#nested_preemptible_worker_config). * **NOTE** : `preemptible_worker_config` is an alias for the api's [secondaryWorkerConfig](https://cloud.google.com/dataproc/docs/reference/rest/v1/ClusterConfig#InstanceGroupConfig). The name doesn't necessarily mean it is preemptible and is named as such for legacy/compatibility reasons. * `software_config` (Optional) The config settings for software inside the cluster. Structure [defined below](#nested_software_config). * `security_config` (Optional) Security related configuration. Structure [defined below](#nested_security_config). * `autoscaling_config` (Optional)  The autoscaling policy config associated with the cluster. Note that once set, if `autoscaling_config` is the only field set in `cluster_config`, it can only be removed by setting `policy_uri = ""`, rather than removing the whole block. Structure [defined below](#nested_autoscaling_config). * `initialization_action` (Optional) Commands to execute on each node after config is completed. You can specify multiple versions of these. Structure [defined below](#nested_initialization_action). * `encryption_config` (Optional) The Customer managed encryption keys settings for the cluster. Structure [defined below](#nested_encryption_config). * `lifecycle_config` (Optional) The settings for auto deletion cluster schedule. Structure [defined below](#nested_lifecycle_config). * `endpoint_config` (Optional) The config settings for port access on the cluster. Structure [defined below](#nested_endpoint_config). * `dataproc_metric_config` (Optional) The Compute Engine accelerator (GPU) configuration for these instances. Can be specified multiple times. Structure [defined below](#nested_dataproc_metric_config). * `auxiliary_node_groups` (Optional) A Dataproc NodeGroup resource is a group of Dataproc cluster nodes that execute an assigned role. Structure [defined below](#nested_auxiliary_node_groups). * `metastore_config` (Optional) The config setting for metastore service with the cluster. Structure [defined below](#nested_metastore_config). - - - | none | None | None |

### cluster_config.gce_cluster_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `zone` | the master and the worker nodes will be created in). If `region` is set to 'global' (default) then `zone` is mandatory, otherwise GCP is able to make use of [Auto Zone Placement](https://cloud.google.com/dataproc/docs/concepts/auto-zone) to determine this automatically for you. Note: This setting additionally determines and restricts which computing resources are available for use with other configs such as `cluster_config.master_config.machine_type` and `cluster_config.worker_config.machine_type`. | none | None | None |
| `network` | network to the cluster will be part of. Conflicts with `subnetwork`. If neither is specified, this defaults to the "default" network. | none | None | None |
| `subnetwork` | subnetwork the cluster will be part of. Conflicts with `network`. | none | None | None |
| `service_account` | If not specified, the "default" service account is used. | none | None | None |
| `service_account_scopes` | to be made available on all of the node VMs under the `service_account` specified. Both OAuth2 URLs and gcloud short names are supported. To allow full access to all Cloud APIs, use the `cloud-platform` scope. See a complete list of scopes [here](https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes). | none | None | None |
| `tags` | Tags are used to identify valid sources or targets for network firewalls. | none | None | None |
| `internal_ip_only` | and will have ephemeral external IP addresses assigned to each instance. If set to true, all instances in the cluster will only have internal IP addresses. Note: Private Google Access (also known as `privateIpGoogleAccess`) must be enabled on the subnetwork that the cluster will be launched in. | none | None | None |
| `metadata` | (see [Project and instance metadata](https://cloud.google.com/compute/docs/storing-retrieving-metadata#project_and_instance_metadata)). | none | None | None |
| `reservation_affinity` |  | none | None | None |
| `consume_reservation_type` |  | none | None | None |
| `key` |  | none | None | None |
| `values` |  | none | None | None |
| `node_group_affinity` |  | none | None | None |
| `node_group_uri` |  | none | None | None |
| `confidential_instance_config` |  | none | None | None |
| `enable_confidential_compute` | * `shielded_instance_config` (Optional) Shielded Instance Config for clusters using [Compute Engine Shielded VMs](https://cloud.google.com/security/shielded-cloud/shielded-vm). - - - | none | None | None |

### cluster_config.gce_cluster_config.shielded_instance_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_secure_boot` |  | none | None | None |
| `enable_vtpm` |  | none | None | None |
| `enable_integrity_monitoring` | - - - | none | None | None |

### cluster_config.master_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `machine_type` | to create for the master. If not specified, GCP will default to a predetermined computed value (currently `n1-standard-4`). | none | None | None |
| `min_cpu_platform` | for the master. If not specified, GCP will default to a predetermined computed value for each zone. See [the guide](https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform) for details about which CPU families are available (and defaulted) for each zone. * `image_uri` (Optional) The URI for the image to use for this worker.  See [the guide](https://cloud.google.com/dataproc/docs/guides/dataproc-images) for more information. * `disk_config` (Optional) Disk Config | none | None | None |
| `boot_disk_type` | One of `"pd-ssd"` or `"pd-standard"`. Defaults to `"pd-standard"`. | none | None | None |
| `boot_disk_size_gb` | in GB. The primary disk contains the boot volume and system libraries, and the smallest allowed disk size is 10GB. GCP will default to a predetermined computed value if not set (currently 500GB). Note: If SSDs are not attached, it also contains the HDFS data blocks and Hadoop working directories. | none | None | None |
| `num_local_ssds` | attached to each master cluster node. Defaults to 0. | none | None | None |
| `local_ssd_interface` | Valid values: "scsi" (Small Computer System Interface), "nvme" (Non-Volatile Memory Express). See [local SSD performance](https://cloud.google.com/compute/docs/disks/local-ssd#performance). * `accelerators` (Optional) The Compute Engine accelerator (GPU) configuration for these instances. Can be specified multiple times. | none | None | None |
| `accelerator_type` |  | none | None | None |
| `accelerator_count` | ~> The Cloud Dataproc API can return unintuitive error messages when using accelerators; even when you have defined an accelerator, Auto Zone Placement does not exclusively select zones that have that accelerator available. If you get a 400 error that the accelerator can't be found, this is a likely cause. Make sure you check [accelerator availability by zone](https://cloud.google.com/compute/docs/reference/rest/v1/acceleratorTypes/list) if you are trying to use accelerators in a given zone. - - - | none | None | None |

### cluster_config.worker_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `machine_type` | to create for the worker nodes. If not specified, GCP will default to a predetermined computed value (currently `n1-standard-4`). | none | None | None |
| `min_cpu_platform` | for the master. If not specified, GCP will default to a predetermined computed value for each zone. See [the guide](https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform) for details about which CPU families are available (and defaulted) for each zone. * `disk_config` (Optional) Disk Config | none | None | None |
| `boot_disk_type` | One of `"pd-ssd"` or `"pd-standard"`. Defaults to `"pd-standard"`. | none | None | None |
| `boot_disk_size_gb` | in GB. The smallest allowed disk size is 10GB. GCP will default to a predetermined computed value if not set (currently 500GB). Note: If SSDs are not attached, it also contains the HDFS data blocks and Hadoop working directories. | none | None | None |
| `num_local_ssds` | attached to each worker cluster node. Defaults to 0. * `image_uri` (Optional) The URI for the image to use for this worker.  See [the guide](https://cloud.google.com/dataproc/docs/guides/dataproc-images) for more information. * `min_num_instances` (Optional) The minimum number of primary worker instances to create.  If `min_num_instances` is set, cluster creation will succeed if the number of primary workers created is at least equal to the `min_num_instances` number. * `accelerators` (Optional) The Compute Engine accelerator configuration for these instances. Can be specified multiple times. | none | None | None |
| `accelerator_type` |  | none | None | None |
| `accelerator_count` | ~> The Cloud Dataproc API can return unintuitive error messages when using accelerators; even when you have defined an accelerator, Auto Zone Placement does not exclusively select zones that have that accelerator available. If you get a 400 error that the accelerator can't be found, this is a likely cause. Make sure you check [accelerator availability by zone](https://cloud.google.com/compute/docs/reference/rest/v1/acceleratorTypes/list) if you are trying to use accelerators in a given zone. - - - | none | None | None |

### cluster_config.preemptible_worker_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `boot_disk_type` | One of `"pd-ssd"` or `"pd-standard"`. Defaults to `"pd-standard"`. | none | None | None |
| `boot_disk_size_gb` | in GB. The smallest allowed disk size is 10GB. GCP will default to a predetermined computed value if not set (currently 500GB). Note: If SSDs are not attached, it also contains the HDFS data blocks and Hadoop working directories. | none | None | None |
| `num_local_ssds` | attached to each preemptible worker node. Defaults to 0. * `instance_flexibility_policy` (Optional) Instance flexibility Policy allowing a mixture of VM shapes and provisioning models. | none | None | None |
| `instance_selection_list` |  | none | None | None |
| `machine_types` |  | none | None | None |
| `rank` |  | none | None | None |
| `provisioning_model_mix` |  | none | None | None |
| `standard_capacity_base` |  | none | None | None |
| `standard_capacity_percent_above_base` | - - - | none | None | None |

### cluster_config.software_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `image_version` | for the cluster - this controls the sets of software versions installed onto the nodes when you create clusters. If not specified, defaults to the latest version. For a list of valid versions see [Cloud Dataproc versions](https://cloud.google.com/dataproc/docs/concepts/dataproc-versions) | none | None | None |
| `override_properties` | used to modify various aspects of the common configuration files used when creating a cluster. For a list of valid properties please see [Cluster properties](https://cloud.google.com/dataproc/docs/concepts/cluster-properties) | none | None | None |
| `optional_components` | - - - | none | None | None |

### cluster_config.security_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cross_realm_trust_admin_server` | remote trusted realm in a cross realm trust relationship. | none | None | None |
| `cross_realm_trust_kdc` | remote trusted realm in a cross realm trust relationship. | none | None | None |
| `cross_realm_trust_realm` | trust, should the user enable cross realm trust. | none | None | None |
| `cross_realm_trust_shared_password_uri` | encrypted file containing the shared password between the on-cluster Kerberos realm and the remote trusted realm, in a cross realm trust relationship. | none | None | None |
| `enable_kerberos` |  | none | None | None |
| `kdc_db_key_uri` | the master key of the KDC database. | none | None | None |
| `key_password_uri` | the password to the user provided key. For the self-signed certificate, this password is generated by Dataproc. | none | None | None |
| `keystore_uri` | If not provided, Dataproc will provide a self-signed certificate. | none | None | None |
| `keystore_password_uri` | the password to the user provided keystore. For the self-signed certificated, the password is generated by Dataproc. | none | None | None |
| `kms_key_uri` |  | none | None | None |
| `realm` | uppercased domain of hostnames will be the realm. | none | None | None |
| `root_principal_password_uri` | containing the root principal password. | none | None | None |
| `tgt_lifetime_hours` |  | none | None | None |
| `truststore_password_uri` | containing the password to the user provided truststore. For the self-signed certificate, this password is generated by Dataproc. | none | None | None |
| `truststore_uri` | SSL encryption. If not provided, Dataproc will provide a self-signed certificate. * `identity_config` (Optional) Identity Configuration. At least one of `identity_config` or `kerberos_config` is required. | none | None | None |
| `user_service_account_mapping` | in a service account based multi-tenant cluster - - - | none | None | None |

### cluster_config.autoscaling_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `policy_uri` | Only resource names including projectid and location (region) are valid. Examples: `https://www.googleapis.com/compute/v1/projects/[projectId]/locations/[dataproc_region]/autoscalingPolicies/[policy_id]` `projects/[projectId]/locations/[dataproc_region]/autoscalingPolicies/[policy_id]` Note that the policy must be in the same project and Cloud Dataproc region. - - - The `initialization_action` block (Optional) can be specified multiple times and supports: ```hcl cluster_config { # You can define multiple initialization_action blocks initialization_action { script      = "gs://dataproc-initialization-actions/stackdriver/stackdriver.sh" timeout_sec = 500 } } ``` * `script`- (Required) The script to be executed during initialization of the cluster. The script must be a GCS file with a gs:// prefix. | none | None | None |
| `timeout_sec` | allowed to take to execute its action. GCP will default to a predetermined computed value if not set (currently 300). - - - | none | None | None |

### encryption_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_name` | all instances in the cluster. - - - | none | None | None |

### dataproc_metric_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `metrics` |  | none | None | None |
| `metric_source` |  | none | None | None |
| `metric_overrides` | - - - | none | None | None |

### auxiliary_node_groups Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_group` |  | none | None | None |
| `roles` | One of `"DRIVER"`. | none | None | None |
| `name` |  | none | None | None |
| `node_group_config` | * `num_instances`- (Optional, Computed) Specifies the number of master nodes to create. Please set a number greater than 0. Node Group must have at least 1 instance. | none | None | None |
| `machine_type` | to create for the node group. If not specified, GCP will default to a predetermined computed value (currently `n1-standard-4`). | none | None | None |
| `min_cpu_platform` | for the node group. If not specified, GCP will default to a predetermined computed value for each zone. See [the guide](https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform) for details about which CPU families are available (and defaulted) for each zone. * `disk_config` (Optional) Disk Config | none | None | None |
| `boot_disk_type` | One of `"pd-ssd"` or `"pd-standard"`. Defaults to `"pd-standard"`. | none | None | None |
| `boot_disk_size_gb` | in GB. The primary disk contains the boot volume and system libraries, and the smallest allowed disk size is 10GB. GCP will default to a predetermined computed value if not set (currently 500GB). Note: If SSDs are not attached, it also contains the HDFS data blocks and Hadoop working directories. | none | None | None |
| `num_local_ssds` | Defaults to 0. * `accelerators` (Optional) The Compute Engine accelerator (GPU) configuration for these instances. Can be specified multiple times. | none | None | None |
| `accelerator_type` |  | none | None | None |
| `accelerator_count` | - - - | none | None | None |

### lifecycle_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `idle_delete_ttl` | (no jobs running). After this TTL, the cluster will be deleted. Valid range: [10m, 14d]. | none | None | None |
| `auto_delete_time` | A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds. Example: "2014-10-02T15:01:23.045123456Z". - - - The `endpoint_config` block (Optional, Computed, Beta) supports: ```hcl cluster_config { endpoint_config { enable_http_port_access = true } } ``` | none | None | None |
| `enable_http_port_access` | on the cluster from external sources (aka Component Gateway). Defaults to false. The `metastore_config` block (Optional, Computed, Beta) supports: ```hcl cluster_config { metastore_config { dataproc_metastore_service = "projects/projectId/locations/region/services/serviceName" } } ``` | none | None | None |
| `dataproc_metastore_service` | Only resource names including projectid and location (region) are valid. Examples: `projects/[projectId]/locations/[dataproc_region]/services/[service-name]` | none | None | None |
