## 🛡️ Policy Deployment Engine: `container_node_pool`

This section provides a concise policy evaluation for the `container_node_pool` resource in GCP.

Reference: [Terraform Registry – container_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster` | - - - | none | None | None |
| `location` | - - - | none | None | None |
| `autoscaling` | the size of the node pool to the current cluster usage. Structure is [documented below](#nested_autoscaling). | none | None | None |
| `initial_node_count` | regional or multi-zonal clusters, this is the number of nodes per zone. Changing this will force recreation of the resource. WARNING: Resizing your node pool manually may change this value in your existing cluster, which will trigger destruction and recreation on the next Terraform run (to rectify the discrepancy).  If you don't need this value, don't set it.  If you do need it, you can [use a lifecycle block to ignore subsequent changes to this field](https://github.com/hashicorp/terraform-provider-google/issues/6901#issuecomment-667369691). | none | None | None |
| `max_pods_per_node` | Note that this does not work on node pools which are "route-based" - that is, node pools belonging to clusters that do not have IP Aliasing enabled. See the [official documentation](https://cloud.google.com/kubernetes-engine/docs/how-to/flexible-pod-cidr) for more information. | none | None | None |
| `node_locations` | The list of zones in which the node pool's nodes should be located. Nodes must be in the region of their regional cluster or in the same region as their cluster's zone for zonal clusters. If unspecified, the cluster-level `node_locations` will be used. -> Note: `node_locations` will not revert to the cluster's default set of zones upon being unset. You must manually reconcile the list of zones with your cluster. | none | None | None |
| `name` | auto-generate a unique name. | none | None | None |
| `name_prefix` | with the specified prefix. Conflicts with `name`. | none | None | None |
| `node_config` | [google_container_cluster](container_cluster.html#nested_node_config) for schema. | none | None | None |
| `node_count` | update the number of nodes per instance group but should not be used alongside `autoscaling`. | none | None | None |
| `project` | the provider-configured project will be used. * `upgrade_settings` (Optional) Specify node upgrade settings to change how GKE upgrades nodes. The maximum number of nodes upgraded simultaneously is limited to 20. Structure is [documented below](#nested_upgrade_settings). | none | None | None |
| `version` | and `auto_upgrade` are both specified, they will fight each other for what the node version should be, so setting both is highly discouraged. While a fuzzy version can be specified, it's recommended that you specify explicit versions as Terraform will see spurious diffs when fuzzy versions are used. See the `google_container_engine_versions` data source's `version_prefix` field to approximate fuzzy versions in a Terraform-compatible way. | none | None | None |
| `queued_provisioning` | Structure is [documented below](#nested_queued_provisioning). The `autoscaling` block supports (either total or per zone limits are required): | none | None | None |
| `min_node_count` | Must be >=0 and <= `max_node_count`. Cannot be used with total limits. | none | None | None |
| `max_node_count` | Must be >= min_node_count. Cannot be used with total limits. | none | None | None |
| `total_min_node_count` | Must be >=0 and <= `total_max_node_count`. Cannot be used with per zone limits. Total size limits are supported only in 1.24.1+ clusters. | none | None | None |
| `total_max_node_count` | Must be >= total_min_node_count. Cannot be used with per zone limits. Total size limits are supported only in 1.24.1+ clusters. | none | None | None |
| `location_policy` | scaling-up the node pool. Location policy is supported only in 1.24.1+ clusters. * "BALANCED" - Is a best effort policy that aims to balance the sizes of available zones. * "ANY" - Instructs the cluster autoscaler to prioritize utilization of unused reservations, and reduce preemption risk for Spot VMs. | none | None | None |
| `network_performance_config` |  | none | None | None |
| `pod_cidr_overprovision_config` |  | none | None | None |
| `reservation_affinity` |  | none | None | None |

### management Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auto_repair` |  | none | None | None |
| `auto_upgrade` |  | none | None | None |

### network_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `create_pod_range` |  | none | None | None |
| `enable_private_nodes` |  | none | None | None |
| `pod_ipv4_cidr_block` |  | none | None | None |
| `pod_range` |  | none | None | None |
| `additional_node_network_configs` | Structure is [documented below](#nested_additional_node_network_configs) | none | None | None |
| `additional_pod_network_configs` | Structure is [documented below](#nested_additional_pod_network_configs) | none | None | None |
| `pod_cidr_overprovision_config` |  | none | None | None |
| `network_performance_config` |  | none | None | None |
| `subnetwork` |  | none | None | None |

### placement_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Specifying COMPACT placement policy type places node pool's nodes in a closer physical proximity in order to reduce network latency between nodes. | none | None | None |
| `policy_name` | The resource policy must be in the same project and region as the node pool. If not found, InvalidArgument error is returned. | none | None | None |
| `tpu_topology` |  | none | None | None |

### additional_node_network_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` |  | none | None | None |
| `subnetwork` |  | none | None | None |

### additional_pod_network_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `subnetwork` |  | none | None | None |
| `secondary_pod_range` |  | none | None | None |
| `max_pods_per_node` |  | none | None | None |

### upgrade_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_surge` | an upgrade. Increasing `max_surge` raises the number of nodes that can be upgraded simultaneously. Can be set to 0 or greater. | none | None | None |
| `max_unavailable` | an upgrade. Increasing `max_unavailable` raises the number of nodes that can be upgraded in parallel. Can be set to 0 or greater. `max_surge` and `max_unavailable` must not be negative and at least one of them must be greater than zero. | none | None | None |
| `strategy` |  | none | None | None |
| `blue_green_settings` | Structure is [documented below](#nested_blue_green_settings) | none | None | None |

### blue_green_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `standard_rollout_policy` |  | none | None | None |
| `batch_percentage` |  | none | None | None |
| `batch_node_count` |  | none | None | None |
| `batch_soak_duration` |  | none | None | None |
| `local_ssd_encryption_mode` | Accepted values are: * `STANDARD_ENCRYPTION`: The given node will be encrypted using keys managed by Google infrastructure and the keys wll be deleted when the node is deleted. * `EPHEMERAL_KEY_ENCRYPTION`: The given node will opt-in for using ephemeral key for encrypting Local SSDs. The Local SSDs will not be able to recover data in case of node crash. | none | None | None |
| `node_pool_soak_duration` | After this period, the blue pool will be cleaned up. | none | None | None |
