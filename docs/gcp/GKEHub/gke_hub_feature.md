## 🛡️ Policy Deployment Engine: `gke_hub_feature`

This section provides a concise policy evaluation for the `gke_hub_feature` resource in GCP.

Reference: [Terraform Registry – gke_hub_feature](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_feature)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The full, unique name of this Feature resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) GCP labels for this Feature. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spec`
- Description: (Optional) Optional. Hub-wide Feature configuration. If this Feature does not support any Hub-wide configuration, this field may be unused. Structure is [documented below](#nested_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fleet_default_member_config`
- Description: (Optional) Optional. Fleet Default Membership Configuration. Structure is [documented below](#nested_fleet_default_member_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_spec"></a>The `spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `multiclusteringress`
- Description: (Optional) Multicluster Ingress-specific spec. Structure is [documented below](#nested_spec_multiclusteringress).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fleetobservability`
- Description: (Optional) Fleet Observability feature spec. Structure is [documented below](#nested_spec_fleetobservability).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `clusterupgrade`
- Description: (Optional) Clusterupgrade feature spec. Structure is [documented below](#nested_spec_clusterupgrade).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rbacrolebindingactuation`
- Description: (Optional) RBACRolebinding Actuation feature spec. Structure is [documented below](#nested_spec_rbacrolebindingactuation). <a name="nested_spec_multiclusteringress"></a>The `multiclusteringress` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config_membership`
- Description: (Required) Fully-qualified Membership name which hosts the MultiClusterIngress CRD. Example: `projects/foo-proj/locations/global/memberships/bar` <a name="nested_spec_fleetobservability"></a>The `fleetobservability` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: (Optional) Specified if fleet logging feature is enabled for the entire fleet. If UNSPECIFIED, fleet logging feature is disabled for the entire fleet. Structure is [documented below](#nested_spec_fleetobservability_logging_config). <a name="nested_spec_fleetobservability_logging_config"></a>The `logging_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_config`
- Description: (Optional) Specified if applying the default routing config to logs not specified in other configs. Structure is [documented below](#nested_spec_fleetobservability_logging_config_default_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fleet_scope_logs_config`
- Description: (Optional) Specified if applying the routing config to all logs for all fleet scopes. Structure is [documented below](#nested_spec_fleetobservability_logging_config_fleet_scope_logs_config). <a name="nested_spec_fleetobservability_logging_config_default_config"></a>The `default_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) Specified if fleet logging feature is enabled. Possible values are: `MODE_UNSPECIFIED`, `COPY`, `MOVE`. <a name="nested_spec_fleetobservability_logging_config_fleet_scope_logs_config"></a>The `fleet_scope_logs_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) Specified if fleet logging feature is enabled. Possible values are: `MODE_UNSPECIFIED`, `COPY`, `MOVE`. <a name="nested_spec_clusterupgrade"></a>The `clusterupgrade` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `upstream_fleets`
- Description: (Required) Specified if other fleet should be considered as a source of upgrades. Currently, at most one upstream fleet is allowed. The fleet name should be either fleet project number or id.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `post_conditions`
- Description: (Required) Post conditions to override for the specified upgrade. Structure is [documented below](#nested_spec_clusterupgrade_post_conditions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gke_upgrade_overrides`
- Description: (Optional) Configuration overrides for individual upgrades. Structure is [documented below](#nested_spec_clusterupgrade_gke_upgrade_overrides). <a name="nested_spec_clusterupgrade_post_conditions"></a>The `post_conditions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `soaking`
- Description: (Required) Amount of time to "soak" after a rollout has been finished before marking it COMPLETE. Cannot exceed 30 days. <a name="nested_spec_clusterupgrade_gke_upgrade_overrides"></a>The `gke_upgrade_overrides` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `upgrade`
- Description: (Required) Which upgrade to override. Structure is [documented below](#nested_spec_clusterupgrade_gke_upgrade_overrides_gke_upgrade_overrides_upgrade).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `post_conditions`
- Description: (Required) Post conditions to override for the specified upgrade. Structure is [documented below](#nested_spec_clusterupgrade_gke_upgrade_overrides_gke_upgrade_overrides_post_conditions). <a name="nested_spec_clusterupgrade_gke_upgrade_overrides_gke_upgrade_overrides_upgrade"></a>The `upgrade` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the upgrade, e.g., "k8s_control_plane". It should be a valid upgrade name. It must not exceet 99 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Required) Version of the upgrade, e.g., "1.22.1-gke.100". It should be a valid version. It must not exceet 99 characters. <a name="nested_spec_clusterupgrade_gke_upgrade_overrides_gke_upgrade_overrides_post_conditions"></a>The `post_conditions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `soaking`
- Description: (Required) Amount of time to "soak" after a rollout has been finished before marking it COMPLETE. Cannot exceed 30 days. <a name="nested_spec_rbacrolebindingactuation"></a>The `rbacrolebindingactuation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_custom_roles`
- Description: (Optional) The list of allowed custom roles (ClusterRoles). If a custom role is not part of this list, it cannot be used in a fleet scope RBACRoleBinding. If a custom role in this list is in use, it cannot be removed from the list until the scope RBACRolebindings using it are deleted. <a name="nested_fleet_default_member_config"></a>The `fleet_default_member_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mesh`
- Description: (Optional) Service Mesh spec Structure is [documented below](#nested_fleet_default_member_config_mesh).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `configmanagement`
- Description: (Optional) Config Management spec Structure is [documented below](#nested_fleet_default_member_config_configmanagement).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policycontroller`
- Description: (Optional) Policy Controller spec Structure is [documented below](#nested_fleet_default_member_config_policycontroller). <a name="nested_fleet_default_member_config_mesh"></a>The `mesh` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `management`
- Description: (Required) Whether to automatically manage Service Mesh Possible values are: `MANAGEMENT_UNSPECIFIED`, `MANAGEMENT_AUTOMATIC`, `MANAGEMENT_MANUAL`. <a name="nested_fleet_default_member_config_configmanagement"></a>The `configmanagement` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Version of Config Sync installed
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `management`
- Description: (Optional) Set this field to MANAGEMENT_AUTOMATIC to enable Config Sync auto-upgrades, and set this field to MANAGEMENT_MANUAL or MANAGEMENT_UNSPECIFIED to disable Config Sync auto-upgrades. Possible values are: `MANAGEMENT_UNSPECIFIED`, `MANAGEMENT_AUTOMATIC`, `MANAGEMENT_MANUAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config_sync`
- Description: (Optional) ConfigSync configuration for the cluster Structure is [documented below](#nested_fleet_default_member_config_configmanagement_config_sync). <a name="nested_fleet_default_member_config_configmanagement_config_sync"></a>The `config_sync` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_format`
- Description: (Optional) Specifies whether the Config Sync Repo is in hierarchical or unstructured mode
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Enables the installation of ConfigSync. If set to true, ConfigSync resources will be created and the other ConfigSync fields will be applied if exist. If set to false, all other ConfigSync fields will be ignored, ConfigSync resources will be deleted. If omitted, ConfigSync resources will be managed depends on the presence of the git or oci field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prevent_drift`
- Description: (Optional) Set to true to enable the Config Sync admission webhook to prevent drifts. If set to `false`, disables the Config Sync admission webhook and does not prevent drifts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metrics_gcp_service_account_email`
- Description: (Optional) The Email of the Google Cloud Service Account (GSA) used for exporting Config Sync metrics to Cloud Monitoring. The GSA should have the Monitoring Metric Writer(roles/monitoring.metricWriter) IAM role. The Kubernetes ServiceAccount `default` in the namespace `config-management-monitoring` should be bound to the GSA.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `git`
- Description: (Optional) Git repo configuration for the cluster Structure is [documented below](#nested_fleet_default_member_config_configmanagement_config_sync_git).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oci`
- Description: (Optional) OCI repo configuration for the cluster Structure is [documented below](#nested_fleet_default_member_config_configmanagement_config_sync_oci). <a name="nested_fleet_default_member_config_configmanagement_config_sync_git"></a>The `git` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sync_repo`
- Description: (Optional) The URL of the Git repository to use as the source of truth
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sync_branch`
- Description: (Optional) The branch of the repository to sync from. Default: master
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_dir`
- Description: (Optional) The path within the Git repository that represents the top level of the repo to sync
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sync_rev`
- Description: (Optional) Git revision (tag or hash) to check out. Default HEAD
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_type`
- Description: (Required) Type of secret configured for access to the Git repo
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `https_proxy`
- Description: (Optional) URL for the HTTPS Proxy to be used when communicating with the Git repo
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcp_service_account_email`
- Description: (Optional) The Google Cloud Service Account Email used for auth when secretType is gcpServiceAccount
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sync_wait_secs`
- Description: (Optional) Period in seconds between consecutive syncs. Default: 15 <a name="nested_fleet_default_member_config_configmanagement_config_sync_oci"></a>The `oci` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sync_repo`
- Description: (Optional) The OCI image repository URL for the package to sync from
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_dir`
- Description: (Optional) The absolute path of the directory that contains the local resources. Default: the root directory of the image
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_type`
- Description: (Required) Type of secret configured for access to the Git repo
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcp_service_account_email`
- Description: (Optional) The Google Cloud Service Account Email used for auth when secretType is gcpServiceAccount
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sync_wait_secs`
- Description: (Optional) Period in seconds between consecutive syncs. Default: 15
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional, Deprecated) Version of Config Sync installed ~> **Warning:** The `configmanagement.config_sync.oci.version` field is deprecated and will be removed in a future major release. Please use `configmanagement.version` field to specify the version of Config Sync installed instead. <a name="nested_fleet_default_member_config_policycontroller"></a>The `policycontroller` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Configures the version of Policy Controller
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_controller_hub_config`
- Description: (Required) Configuration of Policy Controller Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config). <a name="nested_fleet_default_member_config_policycontroller_policy_controller_hub_config"></a>The `policy_controller_hub_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `install_spec`
- Description: (Required) Configures the mode of the Policy Controller installation Possible values are: `INSTALL_SPEC_UNSPECIFIED`, `INSTALL_SPEC_NOT_INSTALLED`, `INSTALL_SPEC_ENABLED`, `INSTALL_SPEC_SUSPENDED`, `INSTALL_SPEC_DETACHED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audit_interval_seconds`
- Description: (Optional) Interval for Policy Controller Audit scans (in seconds). When set to 0, this disables audit functionality altogether.
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

### `mutation_enabled`
- Description: (Optional) Enables the ability to mutate resources using Policy Controller.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `referential_rules_enabled`
- Description: (Optional) Enables the ability to use Constraint Templates that reference to objects other than the object currently being evaluated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monitoring`
- Description: (Optional) Monitoring specifies the configuration of monitoring Policy Controller. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_monitoring).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `constraint_violation_limit`
- Description: (Optional) The maximum number of audit violations to be stored in a constraint. If not set, the internal default of 20 will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deployment_configs`
- Description: (Optional) Map of deployment configs to deployments ("admission", "audit", "mutation"). Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_content`
- Description: (Optional) Specifies the desired policy content on the cluster. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_policy_content). <a name="nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_monitoring"></a>The `monitoring` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backends`
- Description: (Optional) Specifies the list of backends Policy Controller will export to. An empty list would effectively disable metrics export. Each value may be one of: `MONITORING_BACKEND_UNSPECIFIED`, `PROMETHEUS`, `CLOUD_MONITORING`. <a name="nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs"></a>The `deployment_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `component`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replica_count`
- Description: (Optional) Pod replica count.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_resources`
- Description: (Optional) Container resource requirements. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs_deployment_config_container_resources).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_affinity`
- Description: (Optional) Pod affinity configuration. Possible values are: `AFFINITY_UNSPECIFIED`, `NO_AFFINITY`, `ANTI_AFFINITY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_toleration`
- Description: (Optional) Pod tolerations of node taints. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs_deployment_config_pod_toleration). <a name="nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs_deployment_config_container_resources"></a>The `container_resources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `limits`
- Description: (Optional) Limits describes the maximum amount of compute resources allowed for use by the running container. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs_deployment_config_container_resources_limits).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `requests`
- Description: (Optional) Requests describes the amount of compute resources reserved for the container by the kube-scheduler. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs_deployment_config_container_resources_requests). <a name="nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs_deployment_config_container_resources_limits"></a>The `limits` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory`
- Description: (Optional) Memory requirement expressed in Kubernetes resource units.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu`
- Description: (Optional) CPU requirement expressed in Kubernetes resource units. <a name="nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs_deployment_config_container_resources_requests"></a>The `requests` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory`
- Description: (Optional) Memory requirement expressed in Kubernetes resource units.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu`
- Description: (Optional) CPU requirement expressed in Kubernetes resource units. <a name="nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs_deployment_config_pod_toleration"></a>The `pod_toleration` block supports:
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
- Description: (Optional) Matches a taint value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effect`
- Description: (Optional) Matches a taint effect. <a name="nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_policy_content"></a>The `policy_content` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `template_library`
- Description: (Optional) Configures the installation of the Template Library. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_policy_content_template_library).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bundles`
- Description: (Optional) Configures which bundles to install and their corresponding install specs. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_policy_content_bundles). <a name="nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_policy_content_template_library"></a>The `template_library` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `installation`
- Description: (Optional) Configures the manner in which the template library is installed on the cluster. Possible values are: `INSTALLATION_UNSPECIFIED`, `NOT_INSTALLED`, `ALL`. <a name="nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_policy_content_bundles"></a>The `bundles` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bundle`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exempted_namespaces`
- Description: (Optional) The set of namespaces to be exempted from the bundle.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
