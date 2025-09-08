## 🛡️ Policy Deployment Engine: `gke_hub_feature`

This section provides a concise policy evaluation for the `gke_hub_feature` resource in GCP.

Reference: [Terraform Registry – gke_hub_feature](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_feature)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location for the resource | true | None | None |
| `name` | The full, unique name of this Feature resource | false | None | None |
| `labels` | GCP labels for this Feature. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `multiclusteringress` | Multicluster Ingress-specific spec. Structure is [documented below](#nested_spec_multiclusteringress). | false | None | None |
| `fleetobservability` | Fleet Observability feature spec. Structure is [documented below](#nested_spec_fleetobservability). | false | None | None |
| `clusterupgrade` | Clusterupgrade feature spec. Structure is [documented below](#nested_spec_clusterupgrade). | false | None | None |
| `rbacrolebindingactuation` | RBACRolebinding Actuation feature spec. Structure is [documented below](#nested_spec_rbacrolebindingactuation). | false | None | None |

### fleet_default_member_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mesh` | Service Mesh spec Structure is [documented below](#nested_fleet_default_member_config_mesh). | false | None | None |
| `configmanagement` | Config Management spec Structure is [documented below](#nested_fleet_default_member_config_configmanagement). | false | None | None |
| `policycontroller` | Policy Controller spec Structure is [documented below](#nested_fleet_default_member_config_policycontroller). | false | None | None |

### multiclusteringress Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `config_membership` | Fully-qualified Membership name which hosts the MultiClusterIngress CRD. Example: `projects/foo-proj/locations/global/memberships/bar` | true | None | None |

### fleetobservability Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `logging_config` | Specified if fleet logging feature is enabled for the entire fleet. If UNSPECIFIED, fleet logging feature is disabled for the entire fleet. Structure is [documented below](#nested_spec_fleetobservability_logging_config). | false | None | None |

### logging_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `default_config` | Specified if applying the default routing config to logs not specified in other configs. Structure is [documented below](#nested_spec_fleetobservability_logging_config_default_config). | false | None | None |
| `fleet_scope_logs_config` | Specified if applying the routing config to all logs for all fleet scopes. Structure is [documented below](#nested_spec_fleetobservability_logging_config_fleet_scope_logs_config). | false | None | None |

### default_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mode` | Specified if fleet logging feature is enabled. Possible values are: `MODE_UNSPECIFIED`, `COPY`, `MOVE`. | false | None | None |

### fleet_scope_logs_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mode` | Specified if fleet logging feature is enabled. Possible values are: `MODE_UNSPECIFIED`, `COPY`, `MOVE`. | false | None | None |

### clusterupgrade Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `upstream_fleets` | Specified if other fleet should be considered as a source of upgrades. Currently, at most one upstream fleet is allowed. The fleet name should be either fleet project number or id. | true | None | None |
| `post_conditions` | Post conditions to override for the specified upgrade. Structure is [documented below](#nested_spec_clusterupgrade_post_conditions). | true | None | None |
| `gke_upgrade_overrides` | Configuration overrides for individual upgrades. Structure is [documented below](#nested_spec_clusterupgrade_gke_upgrade_overrides). | false | None | None |

### post_conditions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `soaking` | Amount of time to "soak" after a rollout has been finished before marking it COMPLETE. Cannot exceed 30 days. | true | None | None |

### gke_upgrade_overrides Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `upgrade` | Which upgrade to override. Structure is [documented below](#nested_spec_clusterupgrade_gke_upgrade_overrides_gke_upgrade_overrides_upgrade). | true | None | None |
| `post_conditions` | Post conditions to override for the specified upgrade. Structure is [documented below](#nested_spec_clusterupgrade_gke_upgrade_overrides_gke_upgrade_overrides_post_conditions). | true | None | None |

### upgrade Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the upgrade, e.g., "k8s_control_plane". It should be a valid upgrade name. It must not exceet 99 characters. | true | None | None |
| `version` | Version of the upgrade, e.g., "1.22.1-gke.100". It should be a valid version. It must not exceet 99 characters. | true | None | None |

### rbacrolebindingactuation Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_custom_roles` | The list of allowed custom roles (ClusterRoles). If a custom role is not part of this list, it cannot be used in a fleet scope RBACRoleBinding. If a custom role in this list is in use, it cannot be removed from the list until the scope RBACRolebindings using it are deleted. | false | None | None |

### mesh Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `management` | Whether to automatically manage Service Mesh Possible values are: `MANAGEMENT_UNSPECIFIED`, `MANAGEMENT_AUTOMATIC`, `MANAGEMENT_MANUAL`. | true | None | None |

### configmanagement Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `version` | Version of Config Sync installed | false | None | None |
| `management` | Set this field to MANAGEMENT_AUTOMATIC to enable Config Sync auto-upgrades, and set this field to MANAGEMENT_MANUAL or MANAGEMENT_UNSPECIFIED to disable Config Sync auto-upgrades. Possible values are: `MANAGEMENT_UNSPECIFIED`, `MANAGEMENT_AUTOMATIC`, `MANAGEMENT_MANUAL`. | false | None | None |
| `config_sync` | ConfigSync configuration for the cluster Structure is [documented below](#nested_fleet_default_member_config_configmanagement_config_sync). | false | None | None |

### config_sync Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source_format` | Specifies whether the Config Sync Repo is in hierarchical or unstructured mode | false | None | None |
| `enabled` | Enables the installation of ConfigSync. If set to true, ConfigSync resources will be created and the other ConfigSync fields will be applied if exist. If set to false, all other ConfigSync fields will be ignored, ConfigSync resources will be deleted. If omitted, ConfigSync resources will be managed depends on the presence of the git or oci field. | false | None | None |
| `prevent_drift` | Set to true to enable the Config Sync admission webhook to prevent drifts. If set to `false`, disables the Config Sync admission webhook and does not prevent drifts. | false | None | None |
| `metrics_gcp_service_account_email` | The Email of the Google Cloud Service Account (GSA) used for exporting Config Sync metrics to Cloud Monitoring. The GSA should have the Monitoring Metric Writer(roles/monitoring.metricWriter) IAM role. The Kubernetes ServiceAccount `default` in the namespace `config-management-monitoring` should be bound to the GSA. | false | None | None |
| `git` | Git repo configuration for the cluster Structure is [documented below](#nested_fleet_default_member_config_configmanagement_config_sync_git). | false | None | None |
| `oci` | OCI repo configuration for the cluster Structure is [documented below](#nested_fleet_default_member_config_configmanagement_config_sync_oci). | false | None | None |

### git Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `sync_repo` | The URL of the Git repository to use as the source of truth | false | None | None |
| `sync_branch` | The branch of the repository to sync from. Default: master | false | None | None |
| `policy_dir` | The path within the Git repository that represents the top level of the repo to sync | false | None | None |
| `sync_rev` | Git revision (tag or hash) to check out. Default HEAD | false | None | None |
| `secret_type` | Type of secret configured for access to the Git repo | true | None | None |
| `https_proxy` | URL for the HTTPS Proxy to be used when communicating with the Git repo | false | None | None |
| `gcp_service_account_email` | The Google Cloud Service Account Email used for auth when secretType is gcpServiceAccount | false | None | None |
| `sync_wait_secs` | Period in seconds between consecutive syncs. Default: 15 | false | None | None |

### oci Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `sync_repo` | The OCI image repository URL for the package to sync from | false | None | None |
| `policy_dir` | The absolute path of the directory that contains the local resources. Default: the root directory of the image | false | None | None |
| `secret_type` | Type of secret configured for access to the Git repo | true | None | None |
| `gcp_service_account_email` | The Google Cloud Service Account Email used for auth when secretType is gcpServiceAccount | false | None | None |
| `sync_wait_secs` | Period in seconds between consecutive syncs. Default: 15 | false | None | None |
| `version` | , Deprecated) Version of Config Sync installed ~> **Warning:** The `configmanagement.config_sync.oci.version` field is deprecated and will be removed in a future major release. Please use `configmanagement.version` field to specify the version of Config Sync installed instead. | false | None | None |

### policycontroller Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `version` | Configures the version of Policy Controller | false | None | None |
| `policy_controller_hub_config` | Configuration of Policy Controller Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config). | true | None | None |

### policy_controller_hub_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `install_spec` | Configures the mode of the Policy Controller installation Possible values are: `INSTALL_SPEC_UNSPECIFIED`, `INSTALL_SPEC_NOT_INSTALLED`, `INSTALL_SPEC_ENABLED`, `INSTALL_SPEC_SUSPENDED`, `INSTALL_SPEC_DETACHED`. | true | None | None |
| `audit_interval_seconds` | Interval for Policy Controller Audit scans (in seconds). When set to 0, this disables audit functionality altogether. | false | None | None |
| `exemptable_namespaces` | The set of namespaces that are excluded from Policy Controller checks. Namespaces do not need to currently exist on the cluster. | false | None | None |
| `log_denies_enabled` | Logs all denies and dry run failures. | false | None | None |
| `mutation_enabled` | Enables the ability to mutate resources using Policy Controller. | false | None | None |
| `referential_rules_enabled` | Enables the ability to use Constraint Templates that reference to objects other than the object currently being evaluated. | false | None | None |
| `monitoring` | Monitoring specifies the configuration of monitoring Policy Controller. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_monitoring). | false | None | None |
| `constraint_violation_limit` | The maximum number of audit violations to be stored in a constraint. If not set, the internal default of 20 will be used. | false | None | None |
| `deployment_configs` | Map of deployment configs to deployments ("admission", "audit", "mutation"). Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs). | false | None | None |
| `policy_content` | Specifies the desired policy content on the cluster. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_policy_content). | false | None | None |

### monitoring Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `backends` | Specifies the list of backends Policy Controller will export to. An empty list would effectively disable metrics export. Each value may be one of: `MONITORING_BACKEND_UNSPECIFIED`, `PROMETHEUS`, `CLOUD_MONITORING`. | false | None | None |

### deployment_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `component` |  | none | None | None |
| `replica_count` | Pod replica count. | false | None | None |
| `container_resources` | Container resource requirements. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs_deployment_config_container_resources). | false | None | None |
| `pod_affinity` | Pod affinity configuration. Possible values are: `AFFINITY_UNSPECIFIED`, `NO_AFFINITY`, `ANTI_AFFINITY`. | false | None | None |
| `pod_toleration` | Pod tolerations of node taints. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs_deployment_config_pod_toleration). | false | None | None |

### container_resources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `limits` | Limits describes the maximum amount of compute resources allowed for use by the running container. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs_deployment_config_container_resources_limits). | false | None | None |
| `requests` | Requests describes the amount of compute resources reserved for the container by the kube-scheduler. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_deployment_configs_deployment_config_container_resources_requests). | false | None | None |

### limits Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `memory` | Memory requirement expressed in Kubernetes resource units. | false | None | None |
| `cpu` | CPU requirement expressed in Kubernetes resource units. | false | None | None |

### requests Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `memory` | Memory requirement expressed in Kubernetes resource units. | false | None | None |
| `cpu` | CPU requirement expressed in Kubernetes resource units. | false | None | None |

### pod_toleration Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | Matches a taint key (not necessarily unique). | false | None | None |
| `operator` | Matches a taint operator. | false | None | None |
| `value` | Matches a taint value. | false | None | None |
| `effect` | Matches a taint effect. | false | None | None |

### policy_content Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `template_library` | Configures the installation of the Template Library. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_policy_content_template_library). | false | None | None |
| `bundles` | Configures which bundles to install and their corresponding install specs. Structure is [documented below](#nested_fleet_default_member_config_policycontroller_policy_controller_hub_config_policy_content_bundles). | false | None | None |

### template_library Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `installation` | Configures the manner in which the template library is installed on the cluster. Possible values are: `INSTALLATION_UNSPECIFIED`, `NOT_INSTALLED`, `ALL`. | false | None | None |

### bundles Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bundle` |  | none | None | None |
| `exempted_namespaces` | The set of namespaces to be exempted from the bundle. | false | None | None |
