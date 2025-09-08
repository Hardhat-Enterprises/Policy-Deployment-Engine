## 🛡️ Policy Deployment Engine: `container_cluster`

This section provides a concise policy evaluation for the `container_cluster` resource in GCP.

Reference: [Terraform Registry – container_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | location. - - - | none | None | None |
| `location` | master will be created, as well as the default node location. If you specify a zone (such as `us-central1-a`), the cluster will be a zonal cluster with a single cluster master. If you specify a region (such as `us-west1`), the cluster will be a regional cluster with multiple masters spread across zones in the region, and with default node locations in those zones as well | none | None | None |
| `node_locations` | are located. Nodes must be in the region of their regional cluster or in the same region as their cluster's zone for zonal clusters. If this is specified for a zonal cluster, omit the cluster's zone. -> A "multi-zonal" cluster is a zonal cluster with at least one additional zone defined; in a multi-zonal cluster, the cluster master is only present in a single zone while nodes are present in each of the primary zone and the node locations. In contrast, in a regional cluster, cluster master nodes are present in multiple zones in the region. For that reason, regional clusters should be preferred. | none | None | None |
| `deletion_protection` | destroying the cluster.  Deleting this cluster via `terraform destroy` or `terraform apply` will only succeed if this field is `false` in the Terraform state. | none | None | None |
| `allow_net_admin` | `false`. This field should only be enabled for Autopilot clusters (`enable_autopilot` set to `true`). | none | None | None |
| `cluster_ipv4_cidr` | in this cluster in CIDR notation (e.g. `10.96.0.0/14`). Leave blank to have one automatically chosen or specify a `/14` block in `10.0.0.0/8`. This field will default a new cluster to routes-based, where `ip_allocation_policy` is not defined. | none | None | None |
| `description` |  | none | None | None |
| `default_max_pods_per_node` | per node in this cluster. This doesn't work on "routes-based" clusters, clusters that don't have IP Aliasing enabled. See the [official documentation](https://cloud.google.com/kubernetes-engine/docs/how-to/flexible-pod-cidr) for more information. | none | None | None |
| `enable_kubernetes_alpha` | this cluster. Note that when this option is enabled, the cluster cannot be upgraded and will be automatically deleted after 30 days. | none | None | None |
| `enable_tpu` | See the [official documentation](https://cloud.google.com/tpu/docs/kubernetes-engine-setup). | none | None | None |
| `enable_legacy_abac` | When enabled, identities in the system, including service accounts, nodes, and controllers, will have statically granted permissions beyond those provided by the RBAC configuration or IAM. Defaults to `false` | none | None | None |
| `enable_shielded_nodes` |  | none | None | None |
| `enable_autopilot` | Note that when this option is enabled, certain features of Standard GKE are not available. See the [official documentation](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview#comparison) for available features. | none | None | None |
| `initial_node_count` | cluster's default node pool. In regional or multi-zonal clusters, this is the number of nodes per zone. Must be set if `node_pool` is not set. If you're using `google_container_node_pool` objects with no default node pool, you'll need to set this to a value of at least `1`, alongside setting `remove_default_node_pool` to `true`. | none | None | None |
| `networking_mode` | Options are `VPC_NATIVE` or `ROUTES`. `VPC_NATIVE` enables [IP aliasing](https://cloud.google.com/kubernetes-engine/docs/how-to/ip-aliases). Newly created clusters will default to `VPC_NATIVE`. | none | None | None |
| `logging_service` | write logs to. Available options include `logging.googleapis.com`(Legacy Stackdriver), `logging.googleapis.com/kubernetes`(Stackdriver Kubernetes Engine Logging), and `none`. Defaults to `logging.googleapis.com/kubernetes` | none | None | None |
| `min_master_version` | will auto-update the master to new versions, so this does not guarantee the current master version--use the read-only `master_version` field to obtain that. If unset, the cluster's version will be set by GKE to the version of the most recent official release (which is not necessarily the latest version).  Most users will find the `google_container_engine_versions` data source useful - it indicates which versions are available, and can be use to approximate fuzzy versions in a Terraform-compatible way. If you intend to specify versions manually, [the docs](https://cloud.google.com/kubernetes-engine/versioning-and-upgrades#specifying_cluster_version) describe the various acceptable formats for this field. -> If you are using the `google_container_engine_versions` datasource with a regional cluster, ensure that you have provided a `location` to the datasource. A region can have a different set of supported versions than its corresponding zones, and not all zones in a region are guaranteed to support the same version. | none | None | None |
| `monitoring_service` | should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting Available options include `monitoring.googleapis.com`(Legacy Stackdriver), `monitoring.googleapis.com/kubernetes`(Stackdriver Kubernetes Engine Monitoring), and `none`. Defaults to `monitoring.googleapis.com/kubernetes` | none | None | None |
| `network` | network to which the cluster is connected. For Shared VPC, set this to the self link of the shared network. | none | None | None |
| `node_pool` | See [google_container_node_pool](container_node_pool.html) for schema. **Warning:** node pools defined inside a cluster can't be changed (or added/removed) after cluster creation without deleting and recreating the entire cluster. Unless you absolutely need the ability to say "these are the _only_ node pools associated with this cluster", use the [google_container_node_pool](container_node_pool.html) resource instead of this property. | none | None | None |
| `node_pool_defaults` |  | none | None | None |
| `node_version` | or set to the same value as `min_master_version` on create. Defaults to the default version set by GKE which is not necessarily the latest version. This only affects nodes in the default node pool. While a fuzzy version can be specified, it's recommended that you specify explicit versions as Terraform will see spurious diffs when fuzzy versions are used. See the `google_container_engine_versions` data source's `version_prefix` field to approximate fuzzy versions in a Terraform-compatible way. To update nodes in other node pools, use the `version` attribute on the node pool. | none | None | None |
| `notification_config` |  | none | None | None |
| `confidential_nodes` |  | none | None | None |
| `pod_security_policy_config` | [PodSecurityPolicy](https://cloud.google.com/kubernetes-engine/docs/how-to/pod-security-policies) feature. Structure is [documented below](#nested_pod_security_policy_config). | none | None | None |
| `pod_autoscaling` | Structure is [documented below](#nested_pod_autoscaling). | none | None | None |
| `secret_manager_config` | [SecretManagerConfig](https://cloud.google.com/secret-manager/docs/secret-manager-managed-csi-component) feature. Structure is [documented below](#nested_secret_manager_config). | none | None | None |
| `cluster_telemetry` | [ClusterTelemetry](https://cloud.google.com/monitoring/kubernetes-engine/installing#controlling_the_collection_of_application_logs) feature, Structure is [documented below](#nested_cluster_telemetry). | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
| `remove_default_node_pool` | pool upon cluster creation. If you're using `google_container_node_pool` resources with no default node pool, this should be set to `true`, alongside setting `initial_node_count` to at least `1`. | none | None | None |
| `resource_labels` | **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource. | none | None | None |
| `terraform_labels` | The combination of labels configured directly on the resource and default labels configured on the provider. | none | None | None |
| `effective_labels` | All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. | none | None | None |
| `cost_management_config` | [Cost Allocation](https://cloud.google.com/kubernetes-engine/docs/how-to/cost-allocations) feature. Structure is [documented below](#nested_cost_management_config). | none | None | None |
| `resource_usage_export_config` | [ResourceUsageExportConfig](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-usage-metering) feature. Structure is [documented below](#nested_resource_usage_export_config). | none | None | None |
| `subnetwork` | subnetwork in which the cluster's instances are launched. | none | None | None |
| `vertical_pod_autoscaling` | Vertical Pod Autoscaling automatically adjusts the resources of pods controlled by it. Structure is [documented below](#nested_vertical_pod_autoscaling). | none | None | None |
| `workload_identity_config` | Workload Identity allows Kubernetes service accounts to act as a user-managed [Google IAM Service Account](https://cloud.google.com/iam/docs/service-accounts#user-managed_service_accounts). Structure is [documented below](#nested_workload_identity_config). | none | None | None |
| `enable_intranode_visibility` | Whether Intra-node visibility is enabled for this cluster. This makes same node pod to pod traffic visible for VPC network. | none | None | None |
| `enable_l4_ilb_subsetting` | Whether L4ILB Subsetting is enabled for this cluster. | none | None | None |
| `disable_l4_lb_firewall_reconciliation` | Disable L4 load balancer VPC firewalls to enable firewall policies. | none | None | None |
| `enable_multi_networking` | Whether multi-networking is enabled for this cluster. | none | None | None |
| `enable_fqdn_network_policy` | Whether FQDN Network Policy is enabled on this cluster. Users who enable this feature for existing Standard clusters must restart the GKE Dataplane V2 `anetd` DaemonSet after enabling it. See the [Enable FQDN Network Policy in an existing cluster](https://cloud.google.com/kubernetes-engine/docs/how-to/fqdn-network-policies#enable_fqdn_network_policy_in_an_existing_cluster) for more information. | none | None | None |
| `private_ipv6_google_access` | The desired state of IPv6 connectivity to Google Services. By default, no private IPv6 access to or from Google Services (all access will be via IPv4). | none | None | None |
| `datapath_provider` | The desired datapath provider for this cluster. This is set to `LEGACY_DATAPATH` by default, which uses the IPTables-based kube-proxy implementation. Set to `ADVANCED_DATAPATH` to enable Dataplane v2. | none | None | None |
| `in_transit_encryption_config` | Defines the config of in-transit encryption. Valid values are `IN_TRANSIT_ENCRYPTION_DISABLED` and `IN_TRANSIT_ENCRYPTION_INTER_NODE_TRANSPARENT`. | none | None | None |
| `enable_cilium_clusterwide_network_policy` | Whether CiliumClusterWideNetworkPolicy is enabled on this cluster. Defaults to false. | none | None | None |
| `default_snat_status` | [GKE SNAT](https://cloud.google.com/kubernetes-engine/docs/how-to/ip-masquerade-agent#how_ipmasq_works) DefaultSnatStatus contains the desired state of whether default sNAT should be disabled on the cluster, [API doc](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.locations.clusters#networkconfig). Structure is [documented below](#nested_default_snat_status) | none | None | None |
| `disabled` | The `cluster_telemetry` block supports | none | None | None |
| `type` | `SYSTEM_ONLY` (Only system components are monitored and logged) is only available in GKE versions 1.15 and later. | none | None | None |
| `node_affinity` |  | none | None | None |
| `ephemeral_storage_config` |  | none | None | None |
| `ephemeral_storage_local_ssd_config` |  | none | None | None |
| `fast_socket` |  | none | None | None |
| `local_nvme_ssd_block_config` |  | none | None | None |
| `secondary_boot_disks` |  | none | None | None |
| `gcfs_config` |  | none | None | None |
| `gvnic` |  | none | None | None |
| `guest_accelerator` |  | none | None | None |
| `gpu_driver_installation_config` |  | none | None | None |
| `gpu_sharing_config` |  | none | None | None |
| `network_performance_config` |  | none | None | None |
| `network_tags` |  | none | None | None |
| `node_config_defaults` |  | none | None | None |
| `pubsub` |  | none | None | None |
| `filter` |  | none | None | None |
| `rotation_config` |  | none | None | None |
| `private_cluster_config.master_global_access_config` |  | none | None | None |
| `reservation_affinity` |  | none | None | None |
| `sandbox_config` |  | none | None | None |
| `shielded_instance_config` |  | none | None | None |
| `taint` |  | none | None | None |
| `workload_metadata_config` |  | none | None | None |
| `containerd_config` |  | none | None | None |

### addons_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `horizontal_pod_autoscaling` | addon, which increases or decreases the number of replica pods a replication controller has based on the resource usage of the existing pods. It is enabled by default; set `disabled = true` to disable. | none | None | None |
| `http_load_balancing` | controller addon, which makes it easy to set up HTTP load balancers for services in a cluster. It is enabled by default; set `disabled = true` to disable. | none | None | None |
| `network_policy_config` | for the master.  This must be enabled in order to enable network policy for the nodes. To enable this, you must also define a [`network_policy`](#network_policy) block, otherwise nothing will happen. It can only be disabled if the nodes already do not have network policies enabled. Defaults to disabled; set `disabled = false` to enable. | none | None | None |
| `gcp_filestore_csi_driver_config` | which allows the usage of filestore instance as volumes. It is disabled by default; set `enabled = true` to enable. | none | None | None |
| `gcs_fuse_csi_driver_config` | which allows the usage of a gcs bucket as volumes. It is disabled by default for Standard clusters; set `enabled = true` to enable. It is enabled by default for Autopilot clusters with version 1.24 or later; set `enabled = true` to enable it explicitly. See [Enable the Cloud Storage FUSE CSI driver](https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/cloud-storage-fuse-csi-driver#enable) for more information. | none | None | None |
| `cloudrun_config` |  | none | None | None |
| `istio_config` | Structure is [documented below](#nested_istio_config). | none | None | None |
| `dns_cache_config` | The status of the NodeLocal DNSCache addon. It is disabled by default. Set `enabled = true` to enable. **Enabling/Disabling NodeLocal DNSCache in an existing cluster is a disruptive operation. All cluster nodes running GKE 1.15 and higher are recreated.** | none | None | None |
| `gce_persistent_disk_csi_driver_config` | Whether this cluster should enable the Google Compute Engine Persistent Disk Container Storage Interface (CSI) Driver. Set `enabled = true` to enable. **Note:** The Compute Engine persistent disk CSI Driver is enabled by default on newly created clusters for the following versions: Linux clusters: GKE version 1.18.10-gke.2100 or later, or 1.19.3-gke.2100 or later. | none | None | None |
| `gke_backup_agent_config` | The status of the Backup for GKE agent addon. It is disabled by default; Set `enabled = true` to enable. | none | None | None |
| `kalm_config` | Configuration for the KALM addon, which manages the lifecycle of k8s. It is disabled by default; Set `enabled = true` to enable. | none | None | None |
| `config_connector_config` | The status of the ConfigConnector addon. It is disabled by default; Set `enabled = true` to enable. | none | None | None |
| `stateful_ha_config` | The status of the Stateful HA addon, which provides automatic configurable failover for stateful applications. It is disabled by default for Standard clusters. Set `enabled = true` to enable. | none | None | None |
| `ray_operator_config` | addon](https://cloud.google.com/kubernetes-engine/docs/add-on/ray-on-gke/concepts/overview). It is disabled by default. Set `enabled = true` to enable. The minimum cluster version to enable Ray is 1.30.0-gke.1747000. Ray Operator config has optional subfields `ray_cluster_logging_config.enabled` and `ray_cluster_monitoring_config.enabled` which control Ray Cluster logging and monitoring respectively. See [Collect and view logs and metrics for Ray clusters on GKE](https://cloud.google.com/kubernetes-engine/docs/add-on/ray-on-gke/how-to/collect-view-logs-metrics) for more information. | none | None | None |
| `parallelstore_csi_driver_config` | which allows the usage of a Parallelstore instances as volumes. It is disabled by default for Standard clusters; set `enabled = true` to enable. It is enabled by default for Autopilot clusters with version 1.29 or later; set `enabled = true` to enable it explicitly. See [Enable the Parallelstore CSI driver](https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/parallelstore-csi-new-volume#enable) for more information. | none | None | None |
| `lustre_csi_driver_config` | which allows the usage of a Lustre instances as volumes. It is disabled by default for Standard clusters; set `enabled = true` to enable. It is disabled by default for Autopilot clusters; set `enabled = true` to enable. Lustre CSI Driver Config has optional subfield `enable_legacy_lustre_port` which allows the Lustre CSI driver to initialize LNet (the virtual networklayer for Lustre kernel module) using port 6988. This flag is required to workaround a port conflict with the gke-metadata-server on GKE nodes. See [Enable Lustre CSI driver](https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/lustre-csi-driver-new-volume) for more information. This example `addons_config` disables two addons: ```hcl addons_config { http_load_balancing { disabled = true } horizontal_pod_autoscaling { disabled = true } } ``` | none | None | None |

### cluster_autoscaling Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | for autopilot clusters. Resource limits for `cpu` and `memory` must be defined to enable node auto-provisioning for GKE Standard. | none | None | None |
| `resource_limits` | cluster. Configuring the `cpu` and `memory` types is required if node auto-provisioning is enabled. These limits will apply to node pool autoscaling in addition to node auto-provisioning. Structure is [documented below](#nested_resource_limits). | none | None | None |
| `auto_provisioning_defaults` | GKE Autopilot clusters. Structure is [documented below](#nested_auto_provisioning_defaults). | none | None | None |
| `auto_provisioning_locations` | [zones](https://cloud.google.com/compute/docs/zones#available) in which the NodePool's nodes can be created by NAP. | none | None | None |
| `autoscaling_profile` | options for the [Autoscaling profile](https://cloud.google.com/kubernetes-engine/docs/concepts/cluster-autoscaler#autoscaling_profiles) feature, which lets you choose whether the cluster autoscaler should optimize for resource utilization or resource availability when deciding to remove nodes from a cluster. Can be `BALANCED` or `OPTIMIZE_UTILIZATION`. Defaults to `BALANCED`. | none | None | None |

### binary_authorization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` |  | none | None | None |
| `evaluation_mode` | and `PROJECT_SINGLETON_POLICY_ENFORCE`. | none | None | None |

### service_external_ips_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` |  | none | None | None |

### mesh_certificates Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_certificates` |  | none | None | None |

### database_encryption Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `state` |  | none | None | None |
| `key_name` |  | none | None | None |

### enable_k8s_beta_apis Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled_apis` |  | none | None | None |

### ip_allocation_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster_secondary_range_name` | range in the cluster's subnetwork to use for pod IP addresses. Alternatively, `cluster_ipv4_cidr_block` can be used to automatically create a GKE-managed one. | none | None | None |
| `services_secondary_range_name` | secondary range in the cluster's subnetwork to use for service `ClusterIP`s. Alternatively, `services_ipv4_cidr_block` can be used to automatically create a GKE-managed one. | none | None | None |
| `cluster_ipv4_cidr_block` | Set to blank to have a range chosen with the default size. Set to /netmask (e.g. /14) to have a range chosen with a specific netmask. Set to a CIDR notation (e.g. 10.96.0.0/14) from the RFC-1918 private networks (e.g. 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16) to pick a specific range to use. | none | None | None |
| `services_ipv4_cidr_block` | Set to blank to have a range chosen with the default size. Set to /netmask (e.g. /14) to have a range chosen with a specific netmask. Set to a CIDR notation (e.g. 10.96.0.0/14) from the RFC-1918 private networks (e.g. 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16) to pick a specific range to use. | none | None | None |
| `stack_type` | Default value is `IPV4`. Possible values are `IPV4` and `IPV4_IPV6`. | none | None | None |
| `additional_pod_ranges_config` | the cluster level. Used for Autopilot clusters and Standard clusters with which control of the secondary Pod IP address assignment to node pools isn't needed. Structure is [documented below](#nested_additional_pod_ranges_config). | none | None | None |
| `additional_ip_ranges_config` | Structure is [documented below](#nested_additional_ip_ranges_config). | none | None | None |

### logging_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_components` | `SYSTEM_COMPONENTS`, `APISERVER`, `CONTROLLER_MANAGER`, `SCHEDULER`, and `WORKLOADS`. | none | None | None |

### maintenance_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `daily_maintenance_window` | Specify `start_time` in [RFC3339](https://www.ietf.org/rfc/rfc3339.txt) format "HH:MM”, where HH : \[00-23\] and MM : \[00-59\] GMT. For example: Examples: ```hcl maintenance_policy { daily_maintenance_window { start_time = "03:00" } } ``` | none | None | None |
| `recurring_window` | Specify `start_time` and `end_time` in [RFC3339](https://www.ietf.org/rfc/rfc3339.txt) "Zulu" date format.  The start time's date is the initial date that the window starts, and the end time is used for calculating duration.  Specify `recurrence` in [RFC5545](https://tools.ietf.org/html/rfc5545#section-3.8.5.3) RRULE format, to specify when this recurs. Note that GKE may accept other formats, but will return values in UTC, causing a permanent diff. Examples: ``` maintenance_policy { recurring_window { start_time = "2019-08-01T02:00:00Z" end_time = "2019-08-01T06:00:00Z" recurrence = "FREQ=DAILY" } } ``` ``` maintenance_policy { recurring_window { start_time = "2019-01-01T09:00:00Z" end_time = "2019-01-01T17:00:00Z" recurrence = "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR" } } ``` | none | None | None |
| `maintenance_exclusion` |  | none | None | None |

### master_auth Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `client_certificate_config` | ```hcl master_auth { client_certificate_config { issue_client_certificate = false } } ``` This block also contains several computed attributes, documented below. | none | None | None |

### master_authorized_networks_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cidr_blocks` | Kubernetes cluster master through HTTPS. | none | None | None |
| `gcp_public_cidrs_access_enabled` | accessible via Google Compute Engine Public IPs. | none | None | None |
| `private_endpoint_enforcement_enabled` |  | none | None | None |

### monitoring_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_components` |  | none | None | None |
| `managed_prometheus` |  | none | None | None |
| `advanced_datapath_observability_config` |  | none | None | None |

### network_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `provider` |  | none | None | None |
| `enabled` |  | none | None | None |

### node_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `boot_disk` |  | none | None | None |
| `confidential_nodes` |  | none | None | None |
| `disk_size_gb` | in GB. The smallest allowed disk size is 10GB. Defaults to 100GB. This is being migrated to `boot_disk.size_gb`, and must match if specified in both places. Prefer configuring `boot_disk`. | none | None | None |
| `disk_type` | (e.g. 'pd-standard', 'pd-balanced' or 'pd-ssd'). If unspecified, the default disk type is 'pd-balanced' This is being migrated to `boot_disk.disk_type`, and must match if specified in both places. Prefer configuring `boot_disk`. | none | None | None |
| `enable_confidential_storage` |  | none | None | None |
| `local_ssd_encryption_mode` | Accepted values are: * `STANDARD_ENCRYPTION`: The given node will be encrypted using keys managed by Google infrastructure and the keys wll be deleted when the node is deleted. * `EPHEMERAL_KEY_ENCRYPTION`: The given node will opt-in for using ephemeral key for encrypting Local SSDs. The Local SSDs will not be able to recover data in case of node crash. | none | None | None |
| `ephemeral_storage_config` | ```hcl ephemeral_storage_config { local_ssd_count = 2 } ``` | none | None | None |
| `ephemeral_storage_local_ssd_config` | ```hcl ephemeral_storage_local_ssd_config { local_ssd_count = 2 } ``` | none | None | None |
| `fast_socket` | Node Pool must enable gvnic. GKE version 1.25.2-gke.1700 or later. Structure is [documented below](#nested_fast_socket). | none | None | None |
| `local_nvme_ssd_block_config` | * `logging_variant` (Optional) Parameter for specifying the type of logging agent used in a node pool. This will override any [cluster-wide default value](#nested_node_pool_defaults). Valid values include DEFAULT and MAX_THROUGHPUT. See [Increasing logging agent throughput](https://cloud.google.com/stackdriver/docs/solutions/gke/managing-logs#throughput) for more information. | none | None | None |
| `secondary_boot_disks` |  | none | None | None |
| `gcfs_config` | If unspecified, GCFS will not be enabled on the node pool. When enabling this feature you must specify `image_type = "COS_CONTAINERD"` and `node_version` from GKE versions 1.19 or later to use it. For GKE versions 1.19, 1.20, and 1.21, the recommended minimum `node_version` would be 1.19.15-gke.1300, 1.20.11-gke.1300, and 1.21.5-gke.1300 respectively. A `machine_type` that has more than 16 GiB of memory is also recommended. GCFS must be enabled in order to use [image streaming](https://cloud.google.com/kubernetes-engine/docs/how-to/image-streaming). Structure is [documented below](#nested_gcfs_config). ```hcl gcfs_config { enabled = true } ``` | none | None | None |
| `gvnic` | Installing the gVNIC driver allows for more efficient traffic transmission across the Google network infrastructure. gVNIC is an alternative to the virtIO-based ethernet driver. GKE nodes must use a Container-Optimized OS node image. GKE node version 1.15.11-gke.15 or later Structure is [documented below](#nested_gvnic). ```hcl gvnic { enabled = true } ``` | none | None | None |
| `guest_accelerator` | Structure [documented below](#nested_guest_accelerator). **Note**: As of 6.0.0, [argument syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration#arguments) is no longer supported for this field in favor of [block syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration#blocks). To dynamically set a list of guest accelerators, use [dynamic blocks](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks). To set an empty list, use a single `guest_accelerator` block with `count = 0`. | none | None | None |
| `image_type` | will delete and recreate all nodes in the node pool. | none | None | None |
| `labels` | reserved by Kubernetes Core components and cannot be specified. | none | None | None |
| `resource_labels` | for how these labels are applied to clusters, node pools and nodes. | none | None | None |
| `max_run_duration` |  | none | None | None |
| `flex_start` |  | none | None | None |
| `local_ssd_count` | attached to each cluster node. Defaults to 0. | none | None | None |
| `network_performance_config` |  | none | None | None |
| `machine_type` | Defaults to `e2-medium`. To create a custom machine type, value should be set as specified [here](https://cloud.google.com/compute/docs/reference/latest/instances#machineType). | none | None | None |
| `metadata` | the cluster. From GKE `1.12` onwards, `disable-legacy-endpoints` is set to `true` by the API; if `metadata` is set but that default value is not included, Terraform will attempt to unset the value. To avoid this, set the value in your config. | none | None | None |
| `min_cpu_platform` | The instance may be scheduled on the specified or newer CPU platform. Applicable values are the friendly names of CPU platforms, such as `Intel Haswell`. See the [official documentation](https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform) for more information. | none | None | None |
| `oauth_scopes` | on all of the node VMs under the "default" service account. Use the "https://www.googleapis.com/auth/cloud-platform" scope to grant access to all APIs. It is recommended that you set `service_account` to a non-default service account and grant IAM roles to that service account for only the resources that it needs. See the [official documentation](https://cloud.google.com/kubernetes-engine/docs/how-to/access-scopes) for information on migrating off of legacy access scopes. | none | None | None |
| `preemptible` | are preemptible. See the [official documentation](https://cloud.google.com/container-engine/docs/preemptible-vm) for more information. Defaults to false. * `reservation_affinity` (Optional) The configuration of the desired reservation which instances could take capacity from. Structure is [documented below](#nested_reservation_affinity). | none | None | None |
| `spot` | See the [official documentation](https://cloud.google.com/kubernetes-engine/docs/concepts/spot-vms) for more information. Defaults to false. | none | None | None |
| `sandbox_config` | Structure is [documented below](#nested_sandbox_config). | none | None | None |
| `boot_disk_kms_key` |  | none | None | None |
| `service_account` | If not specified, the "default" service account is used. | none | None | None |
| `shielded_instance_config` |  | none | None | None |
| `storage_pools` |  | none | None | None |
| `tags` | valid sources or targets for network firewalls. | none | None | None |
| `resource_manager_tags` |  | none | None | None |
| `taint` | [Kubernetes taints](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) to apply to nodes. This field will only report drift on taint keys that are already managed with Terraform, use `effective_taints` to view the list of GKE-managed taints on the node pool from all sources. Importing this resource will not record any taints as being Terraform-managed, and will cause drift with any configured taints. Structure is [documented below](#nested_taint). | none | None | None |
| `workload_metadata_config` | Structure is [documented below](#nested_workload_metadata_config). | none | None | None |
| `kubelet_config` | Kubelet configuration, currently supported attributes can be found [here](https://cloud.google.com/sdk/gcloud/reference/beta/container/node-pools/create#--system-config-from-file). Structure is [documented below](#nested_kubelet_config). ``` kubelet_config { cpu_manager_policy   = "static" cpu_cfs_quota        = true cpu_cfs_quota_period = "100us" pod_pids_limit       = 1024 } ``` | none | None | None |
| `linux_node_config` |  | none | None | None |
| `windows_node_config` | Windows node configuration, currently supporting OSVersion [attribute](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1/NodeConfig#osversion). The value must be one of [OS_VERSION_UNSPECIFIED, OS_VERSION_LTSC2019, OS_VERSION_LTSC2022]. For example: ```hcl windows_node_config { osversion = "OS_VERSION_LTSC2019" } ``` | none | None | None |
| `containerd_config` |  | none | None | None |
| `node_group` | * `sole_tenant_config` (Optional)  Allows specifying multiple [node affinities](https://cloud.google.com/compute/docs/nodes/sole-tenant-nodes#node_affinity_and_anti-affinity) useful for running workloads on [sole tenant nodes](https://cloud.google.com/kubernetes-engine/docs/how-to/sole-tenancy). `node_affinity` structure is [documented below](#nested_node_affinity). ```hcl sole_tenant_config { node_affinity { key = "compute.googleapis.com/node-group-name" operator = "IN" values = ["node-group-name"] } } ``` | none | None | None |
| `advanced_machine_features` | advanced machine features. Structure is [documented below](#nested_advanced_machine_features). | none | None | None |

### node_pool_auto_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_kubelet_config` | Structure is [documented below](#nested_node_kubelet_config). | none | None | None |
| `resource_manager_tags` | * `network_tags` (Optional) - The network tag config for the cluster's automatically provisioned node pools. Structure is [documented below](#nested_network_tags). * `linux_node_config` (Optional) -  Linux system configuration for the cluster's automatically provisioned node pools. Only `cgroup_mode` field is supported in `node_pool_auto_config`. Structure is [documented below](#nested_linux_node_config). | none | None | None |

### authenticator_groups_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `security_group` |  | none | None | None |

### user_managed_keys_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster_ca` |  | none | None | None |
| `etcd_api_ca` |  | none | None | None |
| `etcd_peer_ca` |  | none | None | None |
| `aggregation_ca` |  | none | None | None |
| `service_account_signing_keys` |  | none | None | None |
| `service_account_verification_keys` |  | none | None | None |
| `control_plane_disk_encryption_key` |  | none | None | None |
| `gkeops_etcd_backup_encryption_key` |  | none | None | None |

### control_plane_endpoints_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dns_endpoint_config` |  | none | None | None |
| `ip_endpoints_config` |  | none | None | None |

### private_cluster_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `private_endpoint_subnetwork` | * `master_global_access_config` (Optional) - Controls cluster master global access settings. If unset, Terraform will no longer manage this field and will not modify the previously-set value. Structure is [documented below](#nested_master_global_access_config). In addition, the `private_cluster_config` allows access to the following read-only fields: | none | None | None |
| `peering_name` |  | none | None | None |
| `private_endpoint` |  | none | None | None |
| `public_endpoint` | !> The Google provider is unable to validate certain configurations of `private_cluster_config` when `enable_private_nodes` is `false`. It's recommended that you omit the block entirely if the field is not set to `true`. | none | None | None |

### release_channel Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `channel` | Accepted values are: * UNSPECIFIED: Not set. * RAPID: Weekly upgrade cadence; Early testers and developers who requires new features. * REGULAR: Multiple per month upgrade cadence; Production users who need features not yet offered in the Stable channel. * STABLE: Every few months upgrade cadence; Production users who need stability above all else, and for whom frequent upgrades are too risky. * EXTENDED: GKE provides extended support for Kubernetes minor versions through the Extended channel. With this channel, you can stay on a minor version for up to 24 months. | none | None | None |

### gke_auto_upgrade_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `patch_mode` | Accepted values are: * ACCELERATED: Upgrades to the latest available patch version in a given minor and release channel. | none | None | None |

### identity_service_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` |  | none | None | None |

### dns_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `additive_vpc_scope_dns_domain` |  | none | None | None |
| `cluster_dns` |  | none | None | None |
| `cluster_dns_scope` |  | none | None | None |
| `cluster_dns_domain` |  | none | None | None |

### gateway_api_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `channel` |  | none | None | None |

### protect_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `workload_config` |  | none | None | None |
| `workload_vulnerability_mode` |  | none | None | None |

### security_posture_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mode` |  | none | None | None |
| `vulnerability_mode` |  | none | None | None |

### fleet Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project` |  | none | None | None |

### workload_alts_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_alts` |  | none | None | None |

### enterprise_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `desired_tier` |  | none | None | None |

### anonymous_authentication_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mode` |  | none | None | None |

### rbac_binding_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_insecure_binding_system_unauthenticated` |  | none | None | None |
| `enable_insecure_binding_system_authenticated` |  | none | None | None |

### cloudrun_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disabled` |  | none | None | None |
| `load_balancer_type` | Set `load_balancer_type=LOAD_BALANCER_TYPE_INTERNAL` to configure it as internal load balancer. | none | None | None |

### istio_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disabled` | cluster. It is disabled by default. Set `disabled = false` to enable. | none | None | None |
| `auth` |  | none | None | None |

### resource_limits Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource_type` | `memory`.  See the [guide to using Node Auto-Provisioning](https://cloud.google.com/kubernetes-engine/docs/how-to/node-auto-provisioning) for a list of types. | none | None | None |
| `minimum` |  | none | None | None |
| `maximum` |  | none | None | None |

### auto_provisioning_defaults Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `min_cpu_platform` | Minimum CPU platform to be used for NAP created node pools. The instance may be scheduled on the specified or newer CPU platform. Applicable values are the friendly names of CPU platforms, such as "Intel Haswell" or "Intel Sandy Bridge". | none | None | None |
| `oauth_scopes` | -> `monitoring.write` is always enabled regardless of user input.  `monitoring` and `logging.write` may also be enabled depending on the values for `monitoring_service` and `logging_service`. | none | None | None |
| `service_account` |  | none | None | None |
| `boot_disk_kms_key` |  | none | None | None |
| `disk_size` |  | none | None | None |
| `disk_type` |  | none | None | None |
| `image_type` |  | none | None | None |
| `shielded_instance_config` |  | none | None | None |
| `management` |  | none | None | None |

### management Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auto_upgrade` |  | none | None | None |
| `auto_repair` | This block also contains several computed attributes, documented below. | none | None | None |
| `upgrade_settings` |  | none | None | None |

### upgrade_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `strategy` |  | none | None | None |
| `max_surge` |  | none | None | None |
| `max_unavailable` |  | none | None | None |
| `blue_green_settings` |  | none | None | None |

### blue_green_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_pool_soak_duration` | * `standard_rollout_policy`: (Optional) Standard policy for the blue-green upgrade. To be specified when strategy is set to BLUE_GREEN. Structure is [documented below](#nested_standard_rollout_policy). | none | None | None |

### standard_rollout_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `batch_node_count` |  | none | None | None |
| `batch_soak_duration` |  | none | None | None |

### managed_prometheus Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` |  | none | None | None |
| `auto_monitoring_config` |  | none | None | None |

### auto_monitoring_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `scope` |  | none | None | None |

### advanced_datapath_observability_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_metrics` |  | none | None | None |
| `enable_relay` |  | none | None | None |

### maintenance_exclusion Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `exclusion_options` |  | none | None | None |

### exclusion_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `scope` | Specify `start_time` and `end_time` in [RFC3339](https://www.ietf.org/rfc/rfc3339.txt) "Zulu" date format.  The start time's date is the initial date that the window starts, and the end time is used for calculating duration.Specify `recurrence` in [RFC5545](https://tools.ietf.org/html/rfc5545#section-3.8.5.3) RRULE format, to specify when this recurs. Note that GKE may accept other formats, but will return values in UTC, causing a permanent diff. Examples: ``` maintenance_policy { recurring_window { start_time = "2019-01-01T00:00:00Z" end_time = "2019-01-02T00:00:00Z" recurrence = "FREQ=DAILY" } maintenance_exclusion{ exclusion_name = "batch job" start_time = "2019-01-01T00:00:00Z" end_time = "2019-01-02T00:00:00Z" exclusion_options { scope = "NO_UPGRADES" } } maintenance_exclusion{ exclusion_name = "holiday data load" start_time = "2019-05-01T00:00:00Z" end_time = "2019-05-02T00:00:00Z" exclusion_options { scope = "NO_MINOR_UPGRADES" } } } ``` | none | None | None |

### additional_pod_ranges_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pod_range_names` |  | none | None | None |

### additional_ip_ranges_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `subnetwork` | * `pod_ipv4_range_names`- (Required) List of secondary ranges names within this subnetwork that can be used for pod IPs. | none | None | None |

### master_authorized_networks_config.cidr_blocks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cidr_block` | Must be specified in CIDR notation. | none | None | None |
| `display_name` |  | none | None | None |

### boot_disk Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `size_gb` | in GB. The smallest allowed disk size is 10GB. Defaults to 100GB. This is being migrated from `node_config.disk_size_gb`, and must match if specified in both places. Prefer using this field. | none | None | None |
| `disk_type` | (e.g. 'pd-standard', 'pd-balanced', 'pd-ssd', 'hyperdisk-balanced'). If unspecified, the default disk type is 'pd-balanced' This is being migrated from `node_config.disk_type`, and must match if specified in both places. Prefer using this field. | none | None | None |
| `provisioned_iops` |  | none | None | None |
| `provisioned_throughput` |  | none | None | None |

### advanced_machine_features Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `threads_per_core` | * `enable_nested_virtualization`- (Optional) Defines whether the instance should have nested virtualization enabled. Defaults to false. | none | None | None |
| `performance_monitoring_unit` |  | none | None | None |

### node_kubelet_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `insecure_kubelet_readonly_port_enabled` |  | none | None | None |

### control_plane_endpoints_config.dns_endpoint_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `endpoint` |  | none | None | None |
| `allow_external_traffic` |  | none | None | None |

### control_plane_endpoints_config.ip_endpoints_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` |  | none | None | None |

### kubelet_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cpu_manager_policy` | [K8S CPU Management Policies](https://kubernetes.io/docs/tasks/administer-cluster/cpu-management-policies/). One of `"none"` or `"static"`. If unset (or set to the empty string `""`), the API will treat the field as if set to "none". Prior to the 6.4.0 this field was marked as required. The workaround for the required field is setting the empty string `""`, which will function identically to not setting this field. | none | None | None |
| `cpu_cfs_quota` | containers that specify CPU limits. | none | None | None |
| `cpu_cfs_quota_period` | as a sequence of decimal numbers, each with optional fraction and a unit suffix, such as `"300ms"`. Valid time units are "ns", "us" (or "µs"), "ms", "s", "m", "h". The value must be a positive duration. | none | None | None |
| `insecure_kubelet_readonly_port_enabled` |  | none | None | None |
| `pod_pids_limit` |  | none | None | None |
| `container_log_max_size` | container log file before it is rotated. Specified as a positive number and a unit suffix, such as `"100Ki"`, `"10Mi"`. Valid units are "Ki", "Mi", "Gi". The value must be between `"10Mi"` and `"500Mi"`, inclusive. And the total container log size (`container_log_max_size` * `container_log_max_files`) cannot exceed 1% of the total storage of the node. | none | None | None |
| `container_log_max_files` |  | none | None | None |
| `image_gc_low_threshold_percent` |  | none | None | None |
| `image_gc_high_threshold_percent` |  | none | None | None |
| `image_minimum_gc_age` |  | none | None | None |
| `image_maximum_gc_age` |  | none | None | None |
| `allowed_unsafe_sysctls` |  | none | None | None |
| `single_process_oom_kill` |  | none | None | None |

### linux_node_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `sysctls` | and all pods running on the nodes. Specified as a map from the key, such as `net.core.wmem_max`, to a string value. Currently supported attributes can be found [here](https://cloud.google.com/sdk/gcloud/reference/beta/container/node-pools/create#--system-config-from-file). Note that validations happen all server side. All attributes are optional. ```hcl linux_node_config { sysctls = { "net.core.netdev_max_backlog" = "10000" "net.core.rmem_max"           = "10000" } } ``` | none | None | None |
| `cgroup_mode` | Accepted values are: * `CGROUP_MODE_UNSPECIFIED`: CGROUP_MODE_UNSPECIFIED is when unspecified cgroup configuration is used. The default for the GKE node OS image will be used. * `CGROUP_MODE_V1`: CGROUP_MODE_V1 specifies to use cgroupv1 for the cgroup configuration on the node image. * `CGROUP_MODE_V2`: CGROUP_MODE_V2 specifies to use cgroupv2 for the cgroup configuration on the node image. | none | None | None |
| `hugepages_config` |  | none | None | None |

### hugepages_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hugepage_size_2m` |  | none | None | None |
| `hugepage_size_1g` |  | none | None | None |

### protect_config.workload_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `audit_mode` |  | none | None | None |
