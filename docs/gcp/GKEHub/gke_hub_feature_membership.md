## 🛡️ Policy Deployment Engine: `gke_hub_feature_membership`

This section provides a concise policy evaluation for the `gke_hub_feature_membership` resource in GCP.

Reference: [Terraform Registry – gke_hub_feature_membership](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_feature_membership)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `feature` | The name of the feature | false | None | None |
| `location` | The location of the feature | false | None | None |
| `membership` | The name of the membership | false | None | None |
| `membership_location` | The location of the membership, for example, "us-central1". Default is "global". | false | None | None |
| `project` | The project of the feature | false | None | None |
| `monitoring` |  | none | None | None |
| `template_library` |  | none | None | None |

### configmanagement Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `config_sync` | Config Sync configuration for the cluster. Structure is [documented below](#nested_config_sync). | false | None | None |
| `management` | Set this field to MANAGEMENT_AUTOMATIC to enable [Config Sync auto-upgrades](http://cloud/kubernetes-engine/enterprise/config-sync/docs/how-to/upgrade-config-sync#auto-upgrade-config), and set this field to MANAGEMENT_MANUAL or MANAGEMENT_UNSPECIFIED to disable Config Sync auto-upgrades. This field was introduced in Terraform version [5.41.0](https://github.com/hashicorp/terraform-provider-google/releases/tag/v5.41.0). | false | None | None |
| `version` | Version of Config Sync installed. | false | None | None |
| `binauthz` | , Deprecated) Binauthz configuration for the cluster. Structure is [documented below](#nested_binauthz). This field will be ignored and should not be set. | false | None | None |
| `hierarchy_controller` | Hierarchy Controller configuration for the cluster. Structure is [documented below](#nested_hierarchy_controller). Configuring Hierarchy Controller through the configmanagement feature is no longer recommended. Use open source Kubernetes [Hierarchical Namespace Controller (HNC)](https://github.com/kubernetes-sigs/hierarchical-namespaces) instead. Follow the [instructions](https://cloud.google.com/kubernetes-engine/enterprise/config-sync/docs/how-to/migrate-hierarchy-controller) to migrate from Hierarchy Controller to HNC. | false | None | None |
| `policy_controller` | Policy Controller configuration for the cluster. Structure is [documented below](#nested_policy_controller). Configuring Policy Controller through the configmanagement feature is no longer recommended. Use the policycontroller feature instead. | false | None | None |

### mesh Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `management` | Whether to automatically manage Service Mesh. Can either be `MANAGEMENT_AUTOMATIC` or `MANAGEMENT_MANUAL`. | false | None | None |

### policycontroller Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `version` | Version of Policy Controller to install. Defaults to the latest version. | false | None | None |
| `policy_controller_hub_config` | Policy Controller configuration for the cluster. Structure is [documented below](#nested_policy_controller_hub_config). | none | None | None |

### binauthz Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether binauthz is enabled in this cluster. | false | None | None |

### config_sync Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether Config Sync is enabled in the cluster. This field was introduced in Terraform version [5.41.0](https://github.com/hashicorp/terraform-provider-google/releases/tag/v5.41.0), and needs to be set to `true` explicitly to install Config Sync. | false | None | None |
| `git` | Structure is [documented below](#nested_git). | false | None | None |
| `oci` | Supported from Config Sync versions 1.12.0 onwards. Structure is [documented below](#nested_oci). Use either `git` or `oci` config option. | false | None | None |
| `prevent_drift` | Supported from Config Sync versions 1.10.0 onwards. Set to `true` to enable the Config Sync admission webhook to prevent drifts. If set to `false`, disables the Config Sync admission webhook and does not prevent drifts. | false | None | None |
| `source_format` | Specifies whether the Config Sync Repo is in "hierarchical" or "unstructured" mode. | false | None | None |
| `stop_syncing` | Set to `true` to stop syncing configurations for a single cluster. This field is only available on clusters using Config Sync [auto-upgrades](http://cloud/kubernetes-engine/enterprise/config-sync/docs/how-to/upgrade-config-sync#auto-upgrade-config) or on Config Sync version 1.20.0 or later. Defaults: `false`. | false | None | None |
| `deployment_overrides` | The override configurations for the Config Sync Deployments. Structure is [documented below](#nested_deployment_overrides). The field is only available on Config Sync version 1.20.1 or later. | false | None | None |

### git Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `gcp_service_account_email` | The GCP Service Account Email used for auth when secretType is gcpServiceAccount. | false | None | None |
| `https_proxy` | URL for the HTTPS proxy to be used when communicating with the Git repo. | false | None | None |
| `policy_dir` | The path within the Git repository that represents the top level of the repo to sync. Default: the root directory of the repository. | false | None | None |
| `secret_type` | Type of secret configured for access to the Git repo. | false | None | None |
| `sync_branch` | The branch of the repository to sync from. Default: master. | false | None | None |
| `sync_repo` | The URL of the Git repository to use as the source of truth. | false | None | None |
| `sync_rev` | Git revision (tag or hash) to check out. Default HEAD. | false | None | None |
| `sync_wait_secs` | Period in seconds between consecutive syncs. Default: 15. | false | None | None |

### deployment_overrides Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `deployment_name` | The name of the Deployment. | false | None | None |
| `deployment_namespace` | The namespace of the Deployment. | false | None | None |
| `containers` | The override configurations for the containers in the Deployment. Structure is [documented below](#nested_deployment_overrides_containers). | false | None | None |

### containers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `container_name` | The name of the container. | false | None | None |
| `cpu_request` | The CPU request of the container. | false | None | None |
| `memory_request` | The memory request of the container. | false | None | None |
| `cpu_limit` | The CPU limit of the container. | false | None | None |
| `memory_limit` | The memory limit of the container. | false | None | None |

### oci Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `gcp_service_account_email` | The GCP Service Account Email used for auth when secret_type is gcpserviceaccount. | false | None | None |
| `policy_dir` | The absolute path of the directory that contains the local resources. Default: the root directory of the image. | false | None | None |
| `secret_type` | Type of secret configured for access to the OCI Image. Must be one of gcenode, gcpserviceaccount or none. | false | None | None |
| `sync_repo` | The OCI image repository URL for the package to sync from. e.g. LOCATION-docker.pkg.dev/PROJECT_ID/REPOSITORY_NAME/PACKAGE_NAME. | false | None | None |
| `sync_wait_secs` | Period in seconds(int64 format) between consecutive syncs. Default: 15. | false | None | None |

### hierarchy_controller Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_hierarchical_resource_quota` | Whether hierarchical resource quota is enabled in this cluster. | false | None | None |
| `enable_pod_tree_labels` | Whether pod tree labels are enabled in this cluster. | false | None | None |
| `enabled` | Whether Hierarchy Controller is enabled in this cluster. | false | None | None |

### policy_controller Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `audit_interval_seconds` | Sets the interval for Policy Controller Audit Scans (in seconds). When set to 0, this disables audit functionality altogether. | false | None | None |
| `enabled` | Enables the installation of Policy Controller. If false, the rest of PolicyController fields take no effect. | false | None | None |
| `exemptable_namespaces` | The set of namespaces that are excluded from Policy Controller checks. Namespaces do not need to currently exist on the cluster. | false | None | None |
| `log_denies_enabled` | Logs all denies and dry run failures. | false | None | None |
| `referential_rules_enabled` | Enables the ability to use Constraint Templates that reference to objects other than the object currently being evaluated. | false | None | None |
| `template_library_installed` | Installs the default template library along with Policy Controller. | false | None | None |
| `mutation_enabled` | Enables mutation in policy controller. If true, mutation CRDs, webhook, and controller deployment will be deployed to the cluster. | false | None | None |
| `monitoring` | Specifies the backends Policy Controller should export metrics to. For example, to specify metrics should be exported to Cloud Monitoring and Prometheus, specify backends: ["cloudmonitoring", "prometheus"]. Default: ["cloudmonitoring", "prometheus"] | false | None | None |

### policy_controller_hub_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `install_spec` | Configures the mode of the Policy Controller installation. Must be one of `INSTALL_SPEC_NOT_INSTALLED`, `INSTALL_SPEC_ENABLED`, `INSTALL_SPEC_SUSPENDED` or `INSTALL_SPEC_DETACHED`. | false | None | None |
| `exemptable_namespaces` | The set of namespaces that are excluded from Policy Controller checks. Namespaces do not need to currently exist on the cluster. | false | None | None |
| `referential_rules_enabled` | Enables the ability to use Constraint Templates that reference to objects other than the object currently being evaluated. | false | None | None |
| `log_denies_enabled` | Logs all denies and dry run failures. | false | None | None |
| `mutation_enabled` | Enables mutation in policy controller. If true, mutation CRDs, webhook, and controller deployment will be deployed to the cluster. | false | None | None |
| `monitoring` | Specifies the backends Policy Controller should export metrics to. Structure is [documented below](#nested_monitoring). | false | None | None |
| `audit_interval_seconds` | Sets the interval for Policy Controller Audit Scans (in seconds). When set to 0, this disables audit functionality altogether. | false | None | None |
| `constraint_violation_limit` | The maximum number of audit violations to be stored in a constraint. If not set, the  default of 20 will be used. | false | None | None |
| `deployment_configs` | Map of deployment configs to deployments ("admission", "audit", "mutation"). | false | None | None |
| `policy_content` | Specifies the desired policy content on the cluster. Structure is [documented below](#nested_policy_content). | false | None | None |

### deployment_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `component_name` | The name of the component. One of `admission` `audit` or `mutation` | true | None | None |
| `container_resources` | Container resource requirements. | false | None | None |
| `pod_affinity` | Pod affinity configuration. Possible values: AFFINITY_UNSPECIFIED, NO_AFFINITY, ANTI_AFFINITY | false | None | None |
| `pod_tolerations` | Pod tolerations of node taints. | false | None | None |
| `replica_count` | Pod replica count. | false | None | None |

### container_resources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `limits` | Limits describes the maximum amount of compute resources allowed for use by the running container. | false | None | None |
| `requests` | Requests describes the amount of compute resources reserved for the container by the kube-scheduler. | false | None | None |

### limits Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cpu` | CPU requirement expressed in Kubernetes resource units. | false | None | None |
| `memory` | Memory requirement expressed in Kubernetes resource units. | false | None | None |

### requests Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cpu` | CPU requirement expressed in Kubernetes resource units. | false | None | None |
| `memory` | Memory requirement expressed in Kubernetes resource units. | false | None | None |

### pod_tolerations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `effect` | Matches a taint effect. | false | None | None |
| `key` | Matches a taint key (not necessarily unique). | false | None | None |
| `operator` | Matches a taint operator. | false | None | None |
| `value` | Matches a taint value. | false | None | None |

### policy_content Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bundles` | map of bundle name to BundleInstallSpec. The bundle name maps to the `bundleName` key in the `policycontroller.gke.io/constraintData` annotation on a constraint. * `template_library` (Optional) Configures the installation of the Template Library. Structure is [documented below](#nested_template_library). | false | None | None |

### bundles Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bundle_name` | The name of the bundle. | true | None | None |
| `exempted_namespaces` | The set of namespaces to be exempted from the bundle. | false | None | None |
