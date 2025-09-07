## 🛡️ Policy Deployment Engine: `container_cluster`

This section provides a concise policy evaluation for the `container_cluster` resource in GCP.

Reference: [Terraform Registry – container_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster)

---

## 1. Argument Reference

### `name`
- Description: location. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: master will be created, as well as the default node location. If you specify a zone (such as `us-central1-a`), the cluster will be a zonal cluster with a single cluster master. If you specify a region (such as `us-west1`), the cluster will be a regional cluster with multiple masters spread across zones in the region, and with default node locations in those zones as well
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_locations`
- Description: are located. Nodes must be in the region of their regional cluster or in the same region as their cluster's zone for zonal clusters. If this is specified for a zonal cluster, omit the cluster's zone. -> A "multi-zonal" cluster is a zonal cluster with at least one additional zone defined; in a multi-zonal cluster, the cluster master is only present in a single zone while nodes are present in each of the primary zone and the node locations. In contrast, in a regional cluster, cluster master nodes are present in multiple zones in the region. For that reason, regional clusters should be preferred.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: destroying the cluster.  Deleting this cluster via `terraform destroy` or `terraform apply` will only succeed if this field is `false` in the Terraform state.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `addons_config`
- Description: Structure is [documented below](#nested_addons_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_net_admin`
- Description: `false`. This field should only be enabled for Autopilot clusters (`enable_autopilot` set to `true`).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_ipv4_cidr`
- Description: in this cluster in CIDR notation (e.g. `10.96.0.0/14`). Leave blank to have one automatically chosen or specify a `/14` block in `10.0.0.0/8`. This field will default a new cluster to routes-based, where `ip_allocation_policy` is not defined.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_autoscaling`
- Description: Per-cluster configuration of Node Auto-Provisioning with Cluster Autoscaler to automatically adjust the size of the cluster and create/delete node pools based on the current needs of the cluster's workload. See the [guide to using Node Auto-Provisioning](https://cloud.google.com/kubernetes-engine/docs/how-to/node-auto-provisioning) for more details. Structure is [documented below](#nested_cluster_autoscaling).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `binary_authorization`
- Description: Authorization feature. Structure is [documented below](#nested_binary_authorization).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_external_ips_config`
- Description: Structure is [documented below](#nested_service_external_ips_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mesh_certificates`
- Description: Structure is [documented below](#nested_mesh_encryption).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_encryption`
- Description: Structure is [documented below](#nested_database_encryption).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_max_pods_per_node`
- Description: per node in this cluster. This doesn't work on "routes-based" clusters, clusters that don't have IP Aliasing enabled. See the [official documentation](https://cloud.google.com/kubernetes-engine/docs/how-to/flexible-pod-cidr) for more information.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_kubernetes_alpha`
- Description: this cluster. Note that when this option is enabled, the cluster cannot be upgraded and will be automatically deleted after 30 days.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_k8s_beta_apis`
- Description: Structure is [documented below](#nested_enable_k8s_beta_apis).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_tpu`
- Description: See the [official documentation](https://cloud.google.com/tpu/docs/kubernetes-engine-setup).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_legacy_abac`
- Description: When enabled, identities in the system, including service accounts, nodes, and controllers, will have statically granted permissions beyond those provided by the RBAC configuration or IAM. Defaults to `false`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_shielded_nodes`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_autopilot`
- Description: Note that when this option is enabled, certain features of Standard GKE are not available. See the [official documentation](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview#comparison) for available features.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initial_node_count`
- Description: cluster's default node pool. In regional or multi-zonal clusters, this is the number of nodes per zone. Must be set if `node_pool` is not set. If you're using `google_container_node_pool` objects with no default node pool, you'll need to set this to a value of at least `1`, alongside setting `remove_default_node_pool` to `true`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_allocation_policy`
- Description: VPC-native clusters. If this block is unset during creation, it will be set by the GKE backend. Structure is [documented below](#nested_ip_allocation_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `networking_mode`
- Description: Options are `VPC_NATIVE` or `ROUTES`. `VPC_NATIVE` enables [IP aliasing](https://cloud.google.com/kubernetes-engine/docs/how-to/ip-aliases). Newly created clusters will default to `VPC_NATIVE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: Structure is [documented below](#nested_logging_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_service`
- Description: write logs to. Available options include `logging.googleapis.com`(Legacy Stackdriver), `logging.googleapis.com/kubernetes`(Stackdriver Kubernetes Engine Logging), and `none`. Defaults to `logging.googleapis.com/kubernetes`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_policy`
- Description: [documented below](#nested_maintenance_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `master_auth`
- Description: Kubernetes master. Some values in this block are only returned by the API if your service account has permission to get credentials for your GKE cluster. If you see an unexpected diff unsetting your client cert, ensure you have the `container.clusters.getCredentials` permission. Structure is [documented below](#nested_master_auth).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `master_authorized_networks_config`
- Description: configuration options for master authorized networks. Omit the nested `cidr_blocks` attribute to disallow external access (except the cluster node IPs, which GKE automatically whitelists). Structure is [documented below](#nested_master_authorized_networks_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_master_version`
- Description: will auto-update the master to new versions, so this does not guarantee the current master version--use the read-only `master_version` field to obtain that. If unset, the cluster's version will be set by GKE to the version of the most recent official release (which is not necessarily the latest version).  Most users will find the `google_container_engine_versions` data source useful - it indicates which versions are available, and can be use to approximate fuzzy versions in a Terraform-compatible way. If you intend to specify versions manually, [the docs](https://cloud.google.com/kubernetes-engine/versioning-and-upgrades#specifying_cluster_version) describe the various acceptable formats for this field. -> If you are using the `google_container_engine_versions` datasource with a regional cluster, ensure that you have provided a `location` to the datasource. A region can have a different set of supported versions than its corresponding zones, and not all zones in a region are guaranteed to support the same version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monitoring_config`
- Description: Structure is [documented below](#nested_monitoring_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monitoring_service`
- Description: should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting Available options include `monitoring.googleapis.com`(Legacy Stackdriver), `monitoring.googleapis.com/kubernetes`(Stackdriver Kubernetes Engine Monitoring), and `none`. Defaults to `monitoring.googleapis.com/kubernetes`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: network to which the cluster is connected. For Shared VPC, set this to the self link of the shared network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_policy`
- Description: [NetworkPolicy](https://kubernetes.io/docs/concepts/services-networking/networkpolicies/) feature. Structure is [documented below](#nested_network_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_config`
- Description: Generally, this field should not be used at the same time as a `google_container_node_pool` or a `node_pool` block; this configuration manages the default node pool, which isn't recommended to be used with Terraform. Structure is [documented below](#nested_node_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_pool`
- Description: See [google_container_node_pool](container_node_pool.html) for schema. **Warning:** node pools defined inside a cluster can't be changed (or added/removed) after cluster creation without deleting and recreating the entire cluster. Unless you absolutely need the ability to say "these are the _only_ node pools associated with this cluster", use the [google_container_node_pool](container_node_pool.html) resource instead of this property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_pool_auto_config`
- Description: [autopilot](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview#comparison) clusters and [node auto-provisioning](https://cloud.google.com/kubernetes-engine/docs/how-to/node-auto-provisioning)-enabled clusters. Structure is [documented below](#nested_node_pool_auto_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_pool_defaults`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_version`
- Description: or set to the same value as `min_master_version` on create. Defaults to the default version set by GKE which is not necessarily the latest version. This only affects nodes in the default node pool. While a fuzzy version can be specified, it's recommended that you specify explicit versions as Terraform will see spurious diffs when fuzzy versions are used. See the `google_container_engine_versions` data source's `version_prefix` field to approximate fuzzy versions in a Terraform-compatible way. To update nodes in other node pools, use the `version` attribute on the node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notification_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `confidential_nodes`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_security_policy_config`
- Description: [PodSecurityPolicy](https://cloud.google.com/kubernetes-engine/docs/how-to/pod-security-policies) feature. Structure is [documented below](#nested_pod_security_policy_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_autoscaling`
- Description: Structure is [documented below](#nested_pod_autoscaling).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_manager_config`
- Description: [SecretManagerConfig](https://cloud.google.com/secret-manager/docs/secret-manager-managed-csi-component) feature. Structure is [documented below](#nested_secret_manager_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authenticator_groups_config`
- Description: [Google Groups for GKE](https://cloud.google.com/kubernetes-engine/docs/how-to/role-based-access-control#groups-setup-gsuite) feature. Structure is [documented below](#nested_authenticator_groups_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_managed_keys_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_endpoints_config`
- Description: Structure is [documented below](#nested_control_plane_endpoints_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_cluster_config`
- Description: clusters with private nodes. Structure is [documented below](#nested_private_cluster_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_telemetry`
- Description: [ClusterTelemetry](https://cloud.google.com/monitoring/kubernetes-engine/installing#controlling_the_collection_of_application_logs) feature, Structure is [documented below](#nested_cluster_telemetry).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `release_channel`
- Description: Configuration options for the [Release channel](https://cloud.google.com/kubernetes-engine/docs/concepts/release-channels) feature, which provide more control over automatic upgrades of your GKE clusters. When updating this field, GKE imposes specific version requirements. See [Selecting a new release channel](https://cloud.google.com/kubernetes-engine/docs/concepts/release-channels#selecting_a_new_release_channel) for more details; the `google_container_engine_versions` datasource can provide the default version for a channel. Note that removing the `release_channel` field from your config will cause Terraform to stop managing your cluster's release channel, but will not unenroll it. Instead, use the `"UNSPECIFIED"` channel. Structure is [documented below](#nested_release_channel).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gke_auto_upgrade_config`
- Description: Configuration options for the auto-upgrade patch type feature, which provide more control over the speed of automatic upgrades of your GKE clusters. Structure is [documented below](#nested_gke_auto_upgrade_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remove_default_node_pool`
- Description: pool upon cluster creation. If you're using `google_container_node_pool` resources with no default node pool, this should be set to `true`, alongside setting `initial_node_count` to at least `1`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_labels`
- Description: **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `terraform_labels`
- Description: The combination of labels configured directly on the resource and default labels configured on the provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effective_labels`
- Description: All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cost_management_config`
- Description: [Cost Allocation](https://cloud.google.com/kubernetes-engine/docs/how-to/cost-allocations) feature. Structure is [documented below](#nested_cost_management_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_usage_export_config`
- Description: [ResourceUsageExportConfig](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-usage-metering) feature. Structure is [documented below](#nested_resource_usage_export_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: subnetwork in which the cluster's instances are launched.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vertical_pod_autoscaling`
- Description: Vertical Pod Autoscaling automatically adjusts the resources of pods controlled by it. Structure is [documented below](#nested_vertical_pod_autoscaling).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workload_identity_config`
- Description: Workload Identity allows Kubernetes service accounts to act as a user-managed [Google IAM Service Account](https://cloud.google.com/iam/docs/service-accounts#user-managed_service_accounts). Structure is [documented below](#nested_workload_identity_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `identity_service_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_intranode_visibility`
- Description: Whether Intra-node visibility is enabled for this cluster. This makes same node pod to pod traffic visible for VPC network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_l4_ilb_subsetting`
- Description: Whether L4ILB Subsetting is enabled for this cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_l4_lb_firewall_reconciliation`
- Description: Disable L4 load balancer VPC firewalls to enable firewall policies.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_multi_networking`
- Description: Whether multi-networking is enabled for this cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_fqdn_network_policy`
- Description: Whether FQDN Network Policy is enabled on this cluster. Users who enable this feature for existing Standard clusters must restart the GKE Dataplane V2 `anetd` DaemonSet after enabling it. See the [Enable FQDN Network Policy in an existing cluster](https://cloud.google.com/kubernetes-engine/docs/how-to/fqdn-network-policies#enable_fqdn_network_policy_in_an_existing_cluster) for more information.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_ipv6_google_access`
- Description: The desired state of IPv6 connectivity to Google Services. By default, no private IPv6 access to or from Google Services (all access will be via IPv4).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `datapath_provider`
- Description: The desired datapath provider for this cluster. This is set to `LEGACY_DATAPATH` by default, which uses the IPTables-based kube-proxy implementation. Set to `ADVANCED_DATAPATH` to enable Dataplane v2.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `in_transit_encryption_config`
- Description: Defines the config of in-transit encryption. Valid values are `IN_TRANSIT_ENCRYPTION_DISABLED` and `IN_TRANSIT_ENCRYPTION_INTER_NODE_TRANSPARENT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_cilium_clusterwide_network_policy`
- Description: Whether CiliumClusterWideNetworkPolicy is enabled on this cluster. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_snat_status`
- Description: [GKE SNAT](https://cloud.google.com/kubernetes-engine/docs/how-to/ip-masquerade-agent#how_ipmasq_works) DefaultSnatStatus contains the desired state of whether default sNAT should be disabled on the cluster, [API doc](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.locations.clusters#networkconfig). Structure is [documented below](#nested_default_snat_status)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_config`
- Description: Configuration for [Using Cloud DNS for GKE](https://cloud.google.com/kubernetes-engine/docs/how-to/cloud-dns). Structure is [documented below](#nested_dns_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gateway_api_config`
- Description: Configuration for [GKE Gateway API controller](https://cloud.google.com/kubernetes-engine/docs/concepts/gateway-api). Structure is [documented below](#nested_gateway_api_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `protect_config`
- Description: Enable/Disable Protect API features for the cluster. Structure is [documented below](#nested_protect_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_posture_config`
- Description: Enable/Disable Security Posture API features for the cluster. Structure is [documented below](#nested_security_posture_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fleet`
- Description: Fleet configuration for the cluster. Structure is [documented below](#nested_fleet).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workload_alts_config`
- Description: Configuration for [direct-path (via ALTS) with workload identity.](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.locations.clusters#workloadaltsconfig). Structure is [documented below](#nested_workload_alts_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enterprise_config`
- Description: Configuration for [Enterprise edition].(https://cloud.google.com/kubernetes-engine/enterprise/docs/concepts/gke-editions). Structure is [documented below](#nested_enterprise_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `anonymous_authentication_config`
- Description: Configuration for [anonymous authentication restrictions](https://cloud.google.com/kubernetes-engine/docs/how-to/hardening-your-cluster#restrict-anon-access). Structure is [documented below](#anonymous_authentication_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rbac_binding_config`
- Description: RBACBindingConfig allows user to restrict ClusterRoleBindings an RoleBindings that can be created. Structure is [documented below](#nested_rbac_binding_config). <a name="nested_default_snat_status"></a>The `default_snat_status` block supports *  `disabled` - (Required) Whether the cluster disables default in-node sNAT rules. In-node sNAT rules will be disabled when defaultSnatStatus is disabled.When disabled is set to false, default IP masquerade rules will be applied to the nodes to prevent sNAT on cluster internal traffic <a name="nested_cluster_telemetry"></a>The `cluster_telemetry` block supports
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: `SYSTEM_ONLY` (Only system components are monitored and logged) is only available in GKE versions 1.15 and later. <a name="nested_addons_config"></a>The `addons_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `horizontal_pod_autoscaling`
- Description: addon, which increases or decreases the number of replica pods a replication controller has based on the resource usage of the existing pods. It is enabled by default; set `disabled = true` to disable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_load_balancing`
- Description: controller addon, which makes it easy to set up HTTP load balancers for services in a cluster. It is enabled by default; set `disabled = true` to disable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_policy_config`
- Description: for the master.  This must be enabled in order to enable network policy for the nodes. To enable this, you must also define a [`network_policy`](#network_policy) block, otherwise nothing will happen. It can only be disabled if the nodes already do not have network policies enabled. Defaults to disabled; set `disabled = false` to enable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcp_filestore_csi_driver_config`
- Description: which allows the usage of filestore instance as volumes. It is disabled by default; set `enabled = true` to enable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_fuse_csi_driver_config`
- Description: which allows the usage of a gcs bucket as volumes. It is disabled by default for Standard clusters; set `enabled = true` to enable. It is enabled by default for Autopilot clusters with version 1.24 or later; set `enabled = true` to enable it explicitly. See [Enable the Cloud Storage FUSE CSI driver](https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/cloud-storage-fuse-csi-driver#enable) for more information.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloudrun_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `istio_config`
- Description: Structure is [documented below](#nested_istio_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_cache_config`
- Description: The status of the NodeLocal DNSCache addon. It is disabled by default. Set `enabled = true` to enable. **Enabling/Disabling NodeLocal DNSCache in an existing cluster is a disruptive operation. All cluster nodes running GKE 1.15 and higher are recreated.**
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gce_persistent_disk_csi_driver_config`
- Description: Whether this cluster should enable the Google Compute Engine Persistent Disk Container Storage Interface (CSI) Driver. Set `enabled = true` to enable. **Note:** The Compute Engine persistent disk CSI Driver is enabled by default on newly created clusters for the following versions: Linux clusters: GKE version 1.18.10-gke.2100 or later, or 1.19.3-gke.2100 or later. *  `gke_backup_agent_config` -  (Optional). The status of the Backup for GKE agent addon. It is disabled by default; Set `enabled = true` to enable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kalm_config`
- Description: Configuration for the KALM addon, which manages the lifecycle of k8s. It is disabled by default; Set `enabled = true` to enable. *  `config_connector_config` -  (Optional). The status of the ConfigConnector addon. It is disabled by default; Set `enabled = true` to enable. *  `stateful_ha_config` - (Optional). The status of the Stateful HA addon, which provides automatic configurable failover for stateful applications. It is disabled by default for Standard clusters. Set `enabled = true` to enable. *  `ray_operator_config` - (Optional). The status of the [Ray Operator addon](https://cloud.google.com/kubernetes-engine/docs/add-on/ray-on-gke/concepts/overview). It is disabled by default. Set `enabled = true` to enable. The minimum cluster version to enable Ray is 1.30.0-gke.1747000. Ray Operator config has optional subfields `ray_cluster_logging_config.enabled` and `ray_cluster_monitoring_config.enabled` which control Ray Cluster logging and monitoring respectively. See [Collect and view logs and metrics for Ray clusters on GKE](https://cloud.google.com/kubernetes-engine/docs/add-on/ray-on-gke/how-to/collect-view-logs-metrics) for more information. *  `parallelstore_csi_driver_config` - (Optional) The status of the Parallelstore CSI driver addon, which allows the usage of a Parallelstore instances as volumes. It is disabled by default for Standard clusters; set `enabled = true` to enable. It is enabled by default for Autopilot clusters with version 1.29 or later; set `enabled = true` to enable it explicitly. See [Enable the Parallelstore CSI driver](https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/parallelstore-csi-new-volume#enable) for more information. *  `lustre_csi_driver_config` - (Optional) The status of the Lustre CSI driver addon, which allows the usage of a Lustre instances as volumes. It is disabled by default for Standard clusters; set `enabled = true` to enable. It is disabled by default for Autopilot clusters; set `enabled = true` to enable. Lustre CSI Driver Config has optional subfield `enable_legacy_lustre_port` which allows the Lustre CSI driver to initialize LNet (the virtual networklayer for Lustre kernel module) using port 6988. This flag is required to workaround a port conflict with the gke-metadata-server on GKE nodes. See [Enable Lustre CSI driver](https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/lustre-csi-driver-new-volume) for more information. This example `addons_config` disables two addons: ```hcl addons_config { http_load_balancing { disabled = true } horizontal_pod_autoscaling { disabled = true } } ``` <a name="nested_binary_authorization"></a>The `binary_authorization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `evaluation_mode`
- Description: and `PROJECT_SINGLETON_POLICY_ENFORCE`. <a name="nested_service_external_ips_config"></a>The `service_external_ips_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: <a name="nested_mesh_certificates"></a>The `mesh_certificates` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_certificates`
- Description: <a name="nested_database_encryption"></a>The `database_encryption` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_name`
- Description: <a name="nested_enable_k8s_beta_apis"></a>The `enable_k8s_beta_apis` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled_apis`
- Description: <a name="nested_cloudrun_config"></a>The `cloudrun_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `load_balancer_type`
- Description: Set `load_balancer_type=LOAD_BALANCER_TYPE_INTERNAL` to configure it as internal load balancer. <a name="nested_identity_service_config"></a>The `identity_service_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: <a name="nested_istio_config"></a>The `istio_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: cluster. It is disabled by default. Set `disabled = false` to enable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth`
- Description: <a name="nested_cluster_autoscaling"></a>The `cluster_autoscaling` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: for autopilot clusters. Resource limits for `cpu` and `memory` must be defined to enable node auto-provisioning for GKE Standard.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_limits`
- Description: cluster. Configuring the `cpu` and `memory` types is required if node auto-provisioning is enabled. These limits will apply to node pool autoscaling in addition to node auto-provisioning. Structure is [documented below](#nested_resource_limits).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_provisioning_defaults`
- Description: GKE Autopilot clusters. Structure is [documented below](#nested_auto_provisioning_defaults).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_provisioning_locations`
- Description: [zones](https://cloud.google.com/compute/docs/zones#available) in which the NodePool's nodes can be created by NAP.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_profile`
- Description: options for the [Autoscaling profile](https://cloud.google.com/kubernetes-engine/docs/concepts/cluster-autoscaler#autoscaling_profiles) feature, which lets you choose whether the cluster autoscaler should optimize for resource utilization or resource availability when deciding to remove nodes from a cluster. Can be `BALANCED` or `OPTIMIZE_UTILIZATION`. Defaults to `BALANCED`. <a name="nested_resource_limits"></a>The `resource_limits` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_type`
- Description: `memory`.  See the [guide to using Node Auto-Provisioning](https://cloud.google.com/kubernetes-engine/docs/how-to/node-auto-provisioning) for a list of types.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minimum`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maximum`
- Description: <a name="nested_auto_provisioning_defaults"></a>The `auto_provisioning_defaults` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_cpu_platform`
- Description: Minimum CPU platform to be used for NAP created node pools. The instance may be scheduled on the specified or newer CPU platform. Applicable values are the friendly names of CPU platforms, such as "Intel Haswell" or "Intel Sandy Bridge".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth_scopes`
- Description: -> `monitoring.write` is always enabled regardless of user input.  `monitoring` and `logging.write` may also be enabled depending on the values for `monitoring_service` and `logging_service`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_kms_key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_size`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shielded_instance_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `management`
- Description: <a name="nested_management"></a>The `management` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_upgrade`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_repair`
- Description: This block also contains several computed attributes, documented below.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `upgrade_settings`
- Description: <a name="nested_upgrade_settings"></a>The `upgrade_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `strategy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_surge`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_unavailable`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `blue_green_settings`
- Description: <a name="nested_blue_green_settings"></a>The `blue_green_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_pool_soak_duration`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `batch_node_count`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `batch_soak_duration`
- Description: <a name="nested_authenticator_groups_config"></a>The `authenticator_groups_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_group`
- Description: <a name="nested_logging_config"></a>The `logging_config` block supports: *  `enable_components` - (Required) The GKE components exposing logs. Supported values include: `SYSTEM_COMPONENTS`, `APISERVER`, `CONTROLLER_MANAGER`, `SCHEDULER`, and `WORKLOADS`. <a name="nested_monitoring_config"></a>The `monitoring_config` block supports: *  `enable_components` - (Optional) The GKE components exposing metrics. Supported values include: `SYSTEM_COMPONENTS`, `APISERVER`, `SCHEDULER`, `CONTROLLER_MANAGER`, `STORAGE`, `HPA`, `POD`, `DAEMONSET`, `DEPLOYMENT`, `STATEFULSET`, `KUBELET`, `CADVISOR`, `DCGM` and `JOBSET`. In beta provider, `WORKLOADS` is supported on top of those 12 values. (`WORKLOADS` is deprecated and removed in GKE 1.24.) `KUBELET` and `CADVISOR` are only supported in GKE 1.29.3-gke.1093000 and above. `JOBSET` is only supported in GKE 1.32.1-gke.1357001 and above. *  `managed_prometheus` - (Optional) Configuration for Managed Service for Prometheus. Structure is [documented below](#nested_managed_prometheus).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advanced_datapath_observability_config`
- Description: <a name="nested_managed_prometheus"></a>The `managed_prometheus` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_monitoring_config`
- Description: <a name="auto_monitoring_config"></a>The `auto_monitoring_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: <a name="nested_advanced_datapath_observability_config"></a>The `advanced_datapath_observability_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_metrics`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_relay`
- Description: <a name="nested_maintenance_policy"></a>The `maintenance_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `daily_maintenance_window`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recurring_window`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_exclusion`
- Description: In beta, one or the other of `recurring_window` and `daily_maintenance_window` is required if a `maintenance_policy` block is supplied.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `daily_maintenance_window`
- Description: Specify `start_time` in [RFC3339](https://www.ietf.org/rfc/rfc3339.txt) format "HH:MM”, where HH : \[00-23\] and MM : \[00-59\] GMT. For example: Examples: ```hcl maintenance_policy { daily_maintenance_window { start_time = "03:00" } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recurring_window`
- Description: Specify `start_time` and `end_time` in [RFC3339](https://www.ietf.org/rfc/rfc3339.txt) "Zulu" date format.  The start time's date is the initial date that the window starts, and the end time is used for calculating duration.  Specify `recurrence` in [RFC5545](https://tools.ietf.org/html/rfc5545#section-3.8.5.3) RRULE format, to specify when this recurs. Note that GKE may accept other formats, but will return values in UTC, causing a permanent diff. Examples: ``` maintenance_policy { recurring_window { start_time = "2019-08-01T02:00:00Z" end_time = "2019-08-01T06:00:00Z" recurrence = "FREQ=DAILY" } } ``` ``` maintenance_policy { recurring_window { start_time = "2019-01-01T09:00:00Z" end_time = "2019-01-01T17:00:00Z" recurrence = "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR" } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_exclusion`
- Description: <a name="nested_maintenance_exclusion"></a>The `maintenance_exclusion` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclusion_options`
- Description: <a name="nested_exclusion_options"></a>The `exclusion_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: Specify `start_time` and `end_time` in [RFC3339](https://www.ietf.org/rfc/rfc3339.txt) "Zulu" date format.  The start time's date is the initial date that the window starts, and the end time is used for calculating duration.Specify `recurrence` in [RFC5545](https://tools.ietf.org/html/rfc5545#section-3.8.5.3) RRULE format, to specify when this recurs. Note that GKE may accept other formats, but will return values in UTC, causing a permanent diff. Examples: ``` maintenance_policy { recurring_window { start_time = "2019-01-01T00:00:00Z" end_time = "2019-01-02T00:00:00Z" recurrence = "FREQ=DAILY" } maintenance_exclusion{ exclusion_name = "batch job" start_time = "2019-01-01T00:00:00Z" end_time = "2019-01-02T00:00:00Z" exclusion_options { scope = "NO_UPGRADES" } } maintenance_exclusion{ exclusion_name = "holiday data load" start_time = "2019-05-01T00:00:00Z" end_time = "2019-05-02T00:00:00Z" exclusion_options { scope = "NO_MINOR_UPGRADES" } } } ``` <a name="nested_ip_allocation_policy"></a>The `ip_allocation_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_secondary_range_name`
- Description: range in the cluster's subnetwork to use for pod IP addresses. Alternatively, `cluster_ipv4_cidr_block` can be used to automatically create a GKE-managed one.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `services_secondary_range_name`
- Description: secondary range in the cluster's subnetwork to use for service `ClusterIP`s. Alternatively, `services_ipv4_cidr_block` can be used to automatically create a GKE-managed one.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_ipv4_cidr_block`
- Description: Set to blank to have a range chosen with the default size. Set to /netmask (e.g. /14) to have a range chosen with a specific netmask. Set to a CIDR notation (e.g. 10.96.0.0/14) from the RFC-1918 private networks (e.g. 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16) to pick a specific range to use.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `services_ipv4_cidr_block`
- Description: Set to blank to have a range chosen with the default size. Set to /netmask (e.g. /14) to have a range chosen with a specific netmask. Set to a CIDR notation (e.g. 10.96.0.0/14) from the RFC-1918 private networks (e.g. 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16) to pick a specific range to use.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stack_type`
- Description: Default value is `IPV4`. Possible values are `IPV4` and `IPV4_IPV6`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_pod_ranges_config`
- Description: the cluster level. Used for Autopilot clusters and Standard clusters with which control of the secondary Pod IP address assignment to node pools isn't needed. Structure is [documented below](#nested_additional_pod_ranges_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_ip_ranges_config`
- Description: Structure is [documented below](#nested_additional_ip_ranges_config). <a name="nested_additional_pod_ranges_config"></a>The `additional_pod_ranges_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_range_names`
- Description: <a name="nested_additional_ip_ranges_config"></a>The `additional_ip_ranges_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_certificate_config`
- Description: ```hcl master_auth { client_certificate_config { issue_client_certificate = false } } ``` This block also contains several computed attributes, documented below. <a name="nested_master_authorized_networks_config"></a>The `master_authorized_networks_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cidr_blocks`
- Description: Kubernetes cluster master through HTTPS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcp_public_cidrs_access_enabled`
- Description: accessible via Google Compute Engine Public IPs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_endpoint_enforcement_enabled`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `master_authorized_networks_config.cidr_blocks` Block

### `cidr_block`
- Description: Must be specified in CIDR notation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: <a name="nested_network_policy"></a>The `network_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provider`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: <a name="nested_node_config"></a>The `node_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `confidential_nodes`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_size_gb`
- Description: in GB. The smallest allowed disk size is 10GB. Defaults to 100GB. This is being migrated to `boot_disk.size_gb`, and must match if specified in both places. Prefer configuring `boot_disk`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_type`
- Description: (e.g. 'pd-standard', 'pd-balanced' or 'pd-ssd'). If unspecified, the default disk type is 'pd-balanced' This is being migrated to `boot_disk.disk_type`, and must match if specified in both places. Prefer configuring `boot_disk`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_confidential_storage`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_ssd_encryption_mode`
- Description: Accepted values are:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ephemeral_storage_config`
- Description: ```hcl ephemeral_storage_config { local_ssd_count = 2 } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ephemeral_storage_local_ssd_config`
- Description: ```hcl ephemeral_storage_local_ssd_config { local_ssd_count = 2 } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fast_socket`
- Description: Node Pool must enable gvnic. GKE version 1.25.2-gke.1700 or later. Structure is [documented below](#nested_fast_socket).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_nvme_ssd_block_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_boot_disks`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcfs_config`
- Description: If unspecified, GCFS will not be enabled on the node pool. When enabling this feature you must specify `image_type = "COS_CONTAINERD"` and `node_version` from GKE versions 1.19 or later to use it. For GKE versions 1.19, 1.20, and 1.21, the recommended minimum `node_version` would be 1.19.15-gke.1300, 1.20.11-gke.1300, and 1.21.5-gke.1300 respectively. A `machine_type` that has more than 16 GiB of memory is also recommended. GCFS must be enabled in order to use [image streaming](https://cloud.google.com/kubernetes-engine/docs/how-to/image-streaming). Structure is [documented below](#nested_gcfs_config). ```hcl gcfs_config { enabled = true } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gvnic`
- Description: Installing the gVNIC driver allows for more efficient traffic transmission across the Google network infrastructure. gVNIC is an alternative to the virtIO-based ethernet driver. GKE nodes must use a Container-Optimized OS node image. GKE node version 1.15.11-gke.15 or later Structure is [documented below](#nested_gvnic). ```hcl gvnic { enabled = true } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `guest_accelerator`
- Description: Structure [documented below](#nested_guest_accelerator). **Note**: As of 6.0.0, [argument syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration#arguments) is no longer supported for this field in favor of [block syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration#blocks). To dynamically set a list of guest accelerators, use [dynamic blocks](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks). To set an empty list, use a single `guest_accelerator` block with `count = 0`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_type`
- Description: will delete and recreate all nodes in the node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: reserved by Kubernetes Core components and cannot be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_labels`
- Description: for how these labels are applied to clusters, node pools and nodes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_run_duration`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `flex_start`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_ssd_count`
- Description: attached to each cluster node. Defaults to 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_performance_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: Defaults to `e2-medium`. To create a custom machine type, value should be set as specified [here](https://cloud.google.com/compute/docs/reference/latest/instances#machineType).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: the cluster. From GKE `1.12` onwards, `disable-legacy-endpoints` is set to `true` by the API; if `metadata` is set but that default value is not included, Terraform will attempt to unset the value. To avoid this, set the value in your config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_cpu_platform`
- Description: The instance may be scheduled on the specified or newer CPU platform. Applicable values are the friendly names of CPU platforms, such as `Intel Haswell`. See the [official documentation](https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform) for more information.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth_scopes`
- Description: on all of the node VMs under the "default" service account. Use the "https://www.googleapis.com/auth/cloud-platform" scope to grant access to all APIs. It is recommended that you set `service_account` to a non-default service account and grant IAM roles to that service account for only the resources that it needs. See the [official documentation](https://cloud.google.com/kubernetes-engine/docs/how-to/access-scopes) for information on migrating off of legacy access scopes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preemptible`
- Description: are preemptible. See the [official documentation](https://cloud.google.com/container-engine/docs/preemptible-vm) for more information. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spot`
- Description: See the [official documentation](https://cloud.google.com/kubernetes-engine/docs/concepts/spot-vms) for more information. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sandbox_config`
- Description: Structure is [documented below](#nested_sandbox_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_kms_key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: If not specified, the "default" service account is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shielded_instance_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_pools`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: valid sources or targets for network firewalls.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_manager_tags`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `taint`
- Description: [Kubernetes taints](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) to apply to nodes. This field will only report drift on taint keys that are already managed with Terraform, use `effective_taints` to view the list of GKE-managed taints on the node pool from all sources. Importing this resource will not record any taints as being Terraform-managed, and will cause drift with any configured taints. Structure is [documented below](#nested_taint).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workload_metadata_config`
- Description: Structure is [documented below](#nested_workload_metadata_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kubelet_config`
- Description: Kubelet configuration, currently supported attributes can be found [here](https://cloud.google.com/sdk/gcloud/reference/beta/container/node-pools/create#--system-config-from-file). Structure is [documented below](#nested_kubelet_config). ``` kubelet_config { cpu_manager_policy   = "static" cpu_cfs_quota        = true cpu_cfs_quota_period = "100us" pod_pids_limit       = 1024 } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `linux_node_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `windows_node_config`
- Description: Windows node configuration, currently supporting OSVersion [attribute](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1/NodeConfig#osversion). The value must be one of [OS_VERSION_UNSPECIFIED, OS_VERSION_LTSC2019, OS_VERSION_LTSC2022]. For example: ```hcl windows_node_config { osversion = "OS_VERSION_LTSC2019" } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `containerd_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_group`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advanced_machine_features`
- Description: advanced machine features. Structure is [documented below](#nested_advanced_machine_features). <a name="nested_boot_disk"></a>The `boot_disk` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `size_gb`
- Description: in GB. The smallest allowed disk size is 10GB. Defaults to 100GB. This is being migrated from `node_config.disk_size_gb`, and must match if specified in both places. Prefer using this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_type`
- Description: (e.g. 'pd-standard', 'pd-balanced', 'pd-ssd', 'hyperdisk-balanced'). If unspecified, the default disk type is 'pd-balanced' This is being migrated from `node_config.disk_type`, and must match if specified in both places. Prefer using this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provisioned_iops`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provisioned_throughput`
- Description: <a name="nested_confidential_nodes"></a> The `confidential_nodes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threads_per_core`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `performance_monitoring_unit`
- Description: <a name="nested_ephemeral_storage_config"></a>The `ephemeral_storage_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_kubelet_config`
- Description: Structure is [documented below](#nested_node_kubelet_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_manager_tags`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `insecure_kubelet_readonly_port_enabled`
- Description: <a name="nested_network_tags"></a>The `network_tags` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `pubsub` Block

### `cluster_ca`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `etcd_api_ca`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `etcd_peer_ca`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aggregation_ca`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_signing_keys`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_verification_keys`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_disk_encryption_key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gkeops_etcd_backup_encryption_key`
- Description: <a name="nested_control_plane_endpoints_config"></a>The `control_plane_endpoints_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_endpoint_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_endpoints_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `control_plane_endpoints_config.dns_endpoint_config` Block

### `endpoint`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_external_traffic`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `control_plane_endpoints_config.ip_endpoints_config` Block

### `enabled`
- Description: <a name="nested_private_cluster_config"></a>The `private_cluster_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_endpoint_subnetwork`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peering_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_endpoint`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_endpoint`
- Description: !> The Google provider is unable to validate certain configurations of `private_cluster_config` when `enable_private_nodes` is `false`. It's recommended that you omit the block entirely if the field is not set to `true`. <a name="nested_master_global_access_config"></a>The `private_cluster_config.master_global_access_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `channel`
- Description: Accepted values are: * UNSPECIFIED: Not set. * RAPID: Weekly upgrade cadence; Early testers and developers who requires new features. * REGULAR: Multiple per month upgrade cadence; Production users who need features not yet offered in the Stable channel. * STABLE: Every few months upgrade cadence; Production users who need stability above all else, and for whom frequent upgrades are too risky. * EXTENDED: GKE provides extended support for Kubernetes minor versions through the Extended channel. With this channel, you can stay on a minor version for up to 24 months. <a name="nested_gke_auto_upgrade_config"></a>The `gke_auto_upgrade_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `patch_mode`
- Description: Accepted values are: * ACCELERATED: Upgrades to the latest available patch version in a given minor and release channel. <a name="nested_cost_management_config"></a>The `cost_management_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_manager_policy`
- Description: [K8S CPU Management Policies](https://kubernetes.io/docs/tasks/administer-cluster/cpu-management-policies/). One of `"none"` or `"static"`. If unset (or set to the empty string `""`), the API will treat the field as if set to "none". Prior to the 6.4.0 this field was marked as required. The workaround for the required field is setting the empty string `""`, which will function identically to not setting this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_cfs_quota`
- Description: containers that specify CPU limits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_cfs_quota_period`
- Description: as a sequence of decimal numbers, each with optional fraction and a unit suffix, such as `"300ms"`. Valid time units are "ns", "us" (or "µs"), "ms", "s", "m", "h". The value must be a positive duration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `insecure_kubelet_readonly_port_enabled`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_pids_limit`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_log_max_size`
- Description: container log file before it is rotated. Specified as a positive number and a unit suffix, such as `"100Ki"`, `"10Mi"`. Valid units are "Ki", "Mi", "Gi". The value must be between `"10Mi"` and `"500Mi"`, inclusive. And the total container log size (`container_log_max_size` * `container_log_max_files`) cannot exceed 1% of the total storage of the node.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_log_max_files`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_gc_low_threshold_percent`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_gc_high_threshold_percent`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_minimum_gc_age`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_maximum_gc_age`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_unsafe_sysctls`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `single_process_oom_kill`
- Description: <a name="nested_linux_node_config"></a>The `linux_node_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sysctls`
- Description: and all pods running on the nodes. Specified as a map from the key, such as `net.core.wmem_max`, to a string value. Currently supported attributes can be found [here](https://cloud.google.com/sdk/gcloud/reference/beta/container/node-pools/create#--system-config-from-file). Note that validations happen all server side. All attributes are optional. ```hcl linux_node_config { sysctls = { "net.core.netdev_max_backlog" = "10000" "net.core.rmem_max"           = "10000" } } ```
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cgroup_mode`
- Description: Accepted values are:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hugepages_config`
- Description: <a name="nested_hugepages_config"></a>The `hugepages_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hugepage_size_2m`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hugepage_size_1g`
- Description: <a name="nested_containerd_config"></a>The `containerd_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additive_vpc_scope_dns_domain`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_dns`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_dns_scope`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_dns_domain`
- Description: <a name="nested_gateway_api_config"></a>The `gateway_api_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `channel`
- Description: <a name="nested_protect_config"></a>The `protect_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workload_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workload_vulnerability_mode`
- Description: <a name="nested_workload_config"></a>The `protect_config.workload_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audit_mode`
- Description: <a name="nested_security_posture_config"></a>The `security_posture_config` block supports: **Note:** `ENTERPRISE` and `VULNERABILITY_ENTERPRISE` are only available for [GKE Enterprise](http://cloud/kubernetes-engine/enterprise/docs/concepts/overview) projects.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vulnerability_mode`
- Description: <a name="nested_fleet"></a>The `fleet` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: <a name="nested_workload_alts_config"></a>The `workload_alts_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_alts`
- Description: <a name="nested_enterprise_config"></a>The `enterprise_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `desired_tier`
- Description: <a name="anonymous_authentication_config"></a>The `anonymous_authentication_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: <a name="nested_rbac_binding_config"></a>The `rbac_binding_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_insecure_binding_system_unauthenticated`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_insecure_binding_system_authenticated`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
