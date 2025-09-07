## 🛡️ Policy Deployment Engine: `gke_hub_feature_membership`

This section provides a concise policy evaluation for the `gke_hub_feature_membership` resource in GCP.

Reference: [Terraform Registry – gke_hub_feature_membership](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_feature_membership)

---

## 1. Argument Reference

### `configmanagement`
- Description: (Optional) Config Management-specific spec. Structure is [documented below](#nested_configmanagement).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mesh`
- Description: (Optional) Service mesh specific spec. Structure is [documented below](#nested_mesh).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policycontroller`
- Description: (Optional) Policy Controller-specific spec. Structure is [documented below](#nested_policycontroller).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `feature`
- Description: (Optional) The name of the feature
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location of the feature
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `membership`
- Description: (Optional) The name of the membership
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `membership_location`
- Description: (Optional) The location of the membership, for example, "us-central1". Default is "global".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project of the feature <a name="nested_configmanagement"></a>The `configmanagement` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config_sync`
- Description: (Optional) Config Sync configuration for the cluster. Structure is [documented below](#nested_config_sync).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `management`
- Description: (Optional) Set this field to MANAGEMENT_AUTOMATIC to enable [Config Sync auto-upgrades](http://cloud/kubernetes-engine/enterprise/config-sync/docs/how-to/upgrade-config-sync#auto-upgrade-config), and set this field to MANAGEMENT_MANUAL or MANAGEMENT_UNSPECIFIED to disable Config Sync auto-upgrades. This field was introduced in Terraform version [5.41.0](https://github.com/hashicorp/terraform-provider-google/releases/tag/v5.41.0).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Version of Config Sync installed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `binauthz`
- Description: (Optional, Deprecated) Binauthz configuration for the cluster. Structure is [documented below](#nested_binauthz). This field will be ignored and should not be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hierarchy_controller`
- Description: (Optional) Hierarchy Controller configuration for the cluster. Structure is [documented below](#nested_hierarchy_controller). Configuring Hierarchy Controller through the configmanagement feature is no longer recommended. Use open source Kubernetes [Hierarchical Namespace Controller (HNC)](https://github.com/kubernetes-sigs/hierarchical-namespaces) instead. Follow the [instructions](https://cloud.google.com/kubernetes-engine/enterprise/config-sync/docs/how-to/migrate-hierarchy-controller) to migrate from Hierarchy Controller to HNC.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_controller`
- Description: (Optional) Policy Controller configuration for the cluster. Structure is [documented below](#nested_policy_controller). Configuring Policy Controller through the configmanagement feature is no longer recommended. Use the policycontroller feature instead. <a name="nested_binauthz"></a>The `binauthz` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Whether binauthz is enabled in this cluster. <a name="nested_config_sync"></a>The `config_sync` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Whether Config Sync is enabled in the cluster. This field was introduced in Terraform version [5.41.0](https://github.com/hashicorp/terraform-provider-google/releases/tag/v5.41.0), and needs to be set to `true` explicitly to install Config Sync.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `git`
- Description: (Optional) Structure is [documented below](#nested_git).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oci`
- Description: (Optional) Supported from Config Sync versions 1.12.0 onwards. Structure is [documented below](#nested_oci). Use either `git` or `oci` config option.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prevent_drift`
- Description: (Optional) Supported from Config Sync versions 1.10.0 onwards. Set to `true` to enable the Config Sync admission webhook to prevent drifts. If set to `false`, disables the Config Sync admission webhook and does not prevent drifts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_format`
- Description: (Optional) Specifies whether the Config Sync Repo is in "hierarchical" or "unstructured" mode.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stop_syncing`
- Description: (Optional) Set to `true` to stop syncing configurations for a single cluster. This field is only available on clusters using Config Sync [auto-upgrades](http://cloud/kubernetes-engine/enterprise/config-sync/docs/how-to/upgrade-config-sync#auto-upgrade-config) or on Config Sync version 1.20.0 or later. Defaults: `false`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deployment_overrides`
- Description: (Optional) The override configurations for the Config Sync Deployments. Structure is [documented below](#nested_deployment_overrides). The field is only available on Config Sync version 1.20.1 or later. <a name="nested_git"></a>The `git` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcp_service_account_email`
- Description: (Optional) The GCP Service Account Email used for auth when secretType is gcpServiceAccount.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `https_proxy`
- Description: (Optional) URL for the HTTPS proxy to be used when communicating with the Git repo.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_dir`
- Description: (Optional) The path within the Git repository that represents the top level of the repo to sync. Default: the root directory of the repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_type`
- Description: (Optional) Type of secret configured for access to the Git repo.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sync_branch`
- Description: (Optional) The branch of the repository to sync from. Default: master.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sync_repo`
- Description: (Optional) The URL of the Git repository to use as the source of truth.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sync_rev`
- Description: (Optional) Git revision (tag or hash) to check out. Default HEAD.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sync_wait_secs`
- Description: (Optional) Period in seconds between consecutive syncs. Default: 15. <a name="nested_deployment_overrides"></a>The `deployment_overrides` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deployment_name`
- Description: (Optional) The name of the Deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deployment_namespace`
- Description: (Optional) The namespace of the Deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `containers`
- Description: (Optional) The override configurations for the containers in the Deployment. Structure is [documented below](#nested_deployment_overrides_containers). <a name="nested_deployment_overrides_containers"></a>The `containers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_name`
- Description: (Optional) The name of the container.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_request`
- Description: (Optional) The CPU request of the container.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory_request`
- Description: (Optional) The memory request of the container.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_limit`
- Description: (Optional) The CPU limit of the container.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory_limit`
- Description: (Optional) The memory limit of the container. <a name="nested_oci"></a>The `oci` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcp_service_account_email`
- Description: (Optional) The GCP Service Account Email used for auth when secret_type is gcpserviceaccount.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_dir`
- Description: (Optional) The absolute path of the directory that contains the local resources. Default: the root directory of the image.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_type`
- Description: (Optional) Type of secret configured for access to the OCI Image. Must be one of gcenode, gcpserviceaccount or none.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sync_repo`
- Description: (Optional) The OCI image repository URL for the package to sync from. e.g. LOCATION-docker.pkg.dev/PROJECT_ID/REPOSITORY_NAME/PACKAGE_NAME.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sync_wait_secs`
- Description: (Optional) Period in seconds(int64 format) between consecutive syncs. Default: 15. <a name="nested_hierarchy_controller"></a>The `hierarchy_controller` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_hierarchical_resource_quota`
- Description: (Optional) Whether hierarchical resource quota is enabled in this cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_pod_tree_labels`
- Description: (Optional) Whether pod tree labels are enabled in this cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Whether Hierarchy Controller is enabled in this cluster. <a name="nested_policy_controller"></a>The `policy_controller` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audit_interval_seconds`
- Description: (Optional) Sets the interval for Policy Controller Audit Scans (in seconds). When set to 0, this disables audit functionality altogether.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Enables the installation of Policy Controller. If false, the rest of PolicyController fields take no effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exemptable_namespaces`
- Description: (Optional) The set of namespaces that are excluded from Policy Controller checks. Namespaces do not need to currently exist on the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_denies_enabled`
- Description: (Optional) Logs all denies and dry run failures.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `referential_rules_enabled`
- Description: (Optional) Enables the ability to use Constraint Templates that reference to objects other than the object currently being evaluated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `template_library_installed`
- Description: (Optional) Installs the default template library along with Policy Controller.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mutation_enabled`
- Description: (Optional) Enables mutation in policy controller. If true, mutation CRDs, webhook, and controller deployment will be deployed to the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monitoring`
- Description: (Optional) Specifies the backends Policy Controller should export metrics to. For example, to specify metrics should be exported to Cloud Monitoring and Prometheus, specify backends: ["cloudmonitoring", "prometheus"]. Default: ["cloudmonitoring", "prometheus"] <a name="nested_mesh"></a>The `mesh` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `management`
- Description: (Optional) Whether to automatically manage Service Mesh. Can either be `MANAGEMENT_AUTOMATIC` or `MANAGEMENT_MANUAL`. <a name="nested_policycontroller"></a>The `policycontroller` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Version of Policy Controller to install. Defaults to the latest version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_controller_hub_config`
- Description: Policy Controller configuration for the cluster. Structure is [documented below](#nested_policy_controller_hub_config). <a name="nested_policy_controller_hub_config"></a>The `policy_controller_hub_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `install_spec`
- Description: (Optional) Configures the mode of the Policy Controller installation. Must be one of `INSTALL_SPEC_NOT_INSTALLED`, `INSTALL_SPEC_ENABLED`, `INSTALL_SPEC_SUSPENDED` or `INSTALL_SPEC_DETACHED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exemptable_namespaces`
- Description: (Optional) The set of namespaces that are excluded from Policy Controller checks. Namespaces do not need to currently exist on the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `referential_rules_enabled`
- Description: (Optional) Enables the ability to use Constraint Templates that reference to objects other than the object currently being evaluated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_denies_enabled`
- Description: (Optional) Logs all denies and dry run failures.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mutation_enabled`
- Description: (Optional) Enables mutation in policy controller. If true, mutation CRDs, webhook, and controller deployment will be deployed to the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monitoring`
- Description: (Optional) Specifies the backends Policy Controller should export metrics to. Structure is [documented below](#nested_monitoring).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audit_interval_seconds`
- Description: (Optional) Sets the interval for Policy Controller Audit Scans (in seconds). When set to 0, this disables audit functionality altogether.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `constraint_violation_limit`
- Description: (Optional) The maximum number of audit violations to be stored in a constraint. If not set, the  default of 20 will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deployment_configs`
- Description: (Optional) Map of deployment configs to deployments ("admission", "audit", "mutation").
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_content`
- Description: (Optional) Specifies the desired policy content on the cluster. Structure is [documented below](#nested_policy_content). <a name="nested_monitoring"></a>The `monitoring` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `component_name`
- Description: (Required) The name of the component. One of `admission` `audit` or `mutation`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_resources`
- Description: (Optional) Container resource requirements.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_affinity`
- Description: (Optional) Pod affinity configuration. Possible values: AFFINITY_UNSPECIFIED, NO_AFFINITY, ANTI_AFFINITY
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_tolerations`
- Description: (Optional) Pod tolerations of node taints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replica_count`
- Description: (Optional) Pod replica count. <a name="nested_container_resources"></a>The `container_resources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `limits`
- Description: (Optional) Limits describes the maximum amount of compute resources allowed for use by the running container.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `requests`
- Description: (Optional) Requests describes the amount of compute resources reserved for the container by the kube-scheduler. <a name="nested_limits"></a>The `limits` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu`
- Description: (Optional) CPU requirement expressed in Kubernetes resource units.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory`
- Description: (Optional) Memory requirement expressed in Kubernetes resource units. <a name="nested_requests"></a>The `requests` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu`
- Description: (Optional) CPU requirement expressed in Kubernetes resource units.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory`
- Description: (Optional) Memory requirement expressed in Kubernetes resource units. <a name="nested_pod_tolerations"></a>The `pod_tolerations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effect`
- Description: (Optional) Matches a taint effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) Matches a taint key (not necessarily unique).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operator`
- Description: (Optional) Matches a taint operator.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Matches a taint value. <a name="nested_policy_content"></a>The `policy_content` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bundles`
- Description: (Optional) map of bundle name to BundleInstallSpec. The bundle name maps to the `bundleName` key in the `policycontroller.gke.io/constraintData` annotation on a constraint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bundle_name`
- Description: (Required) The name of the bundle.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exempted_namespaces`
- Description: (Optional) The set of namespaces to be exempted from the bundle. <a name="nested_template_library"></a>The `template_library` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
