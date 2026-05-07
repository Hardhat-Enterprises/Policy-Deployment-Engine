## 🛡️ Policy Deployment Engine: `gke_backup_restore_plan`

This section provides a concise policy evaluation for the `gke_backup_restore_plan` resource in GCP.

Reference: [Terraform Registry – gke_backup_restore_plan](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_backup_restore_plan)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The full name of the BackupPlan Resource. | true | false | None | None | None |
| `backup_plan` | A reference to the BackupPlan from which Backups may be used as the source for Restores created via this RestorePlan. | true | false | None | None | None |
| `cluster` | The source cluster from which Restores will be created via this RestorePlan. | true | true | Restores must target a designated DR cluster in the approved region. | projects/*/locations/australia-southeast1/clusters/*-dr | projects/*/locations/us-central1/clusters/*-dr |
| `restore_config` | Defines the configuration of Restores created via this RestorePlan. Structure is [documented below](#nested_restore_config). | true | false | None | None | None |
| `location` | The region of the Restore Plan. | true | true | Restore plans must be created in the approved region (australia-southeast1). | australia-southeast1 | us-central1 |
| `description` | User specified descriptive string for this RestorePlan. | false | false | None | None | None |
| `labels` | Description: A set of custom labels supplied by the user. A list of key->value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `excluded_namespaces` |  | false | false | None | None | None |
| `selected_namespaces` |  | false | false | None | None | None |
| `selected_applications` |  | false | false | None | None | None |
| `namespaced_names` |  | false | false | None | None | None |
| `cluster_resource_restore_scope` |  | false | false | None | None | None |
| `excluded_group_kinds` |  | false | false | None | None | None |
| `selected_group_kinds` |  | false | false | None | None | None |
| `transformation_rules` |  | false | false | None | None | None |
| `resource_filter` |  | false | false | None | None | None |
| `group_kinds` |  | false | false | None | None | None |
| `field_actions` |  | false | false | None | None | None |
| `volume_data_restore_policy_bindings` |  | false | false | None | None | None |
| `restore_order` |  | false | false | None | None | None |
| `group_kind_dependencies` |  | false | false | None | None | None |
| `satisfying` |  | false | false | None | None | None |
| `requiring` |  | false | false | None | None | None |

### restore_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `all_namespaces` | If True, restore all namespaced resources in the Backup. Setting this field to False will result in an error. | false | false | None | None | None |
| `excluded_namespaces` | A list of selected namespaces excluded from restoration. All namespaces except those in this list will be restored. Structure is [documented below](#nested_restore_config_excluded_namespaces). | false | false | None | None | None |
| `selected_namespaces` | A list of selected namespaces to restore from the Backup. The listed Namespaces and all resources contained in them will be restored. Structure is [documented below](#nested_restore_config_selected_namespaces). | false | false | None | None | None |
| `selected_applications` | A list of selected ProtectedApplications to restore. The listed ProtectedApplications and all the resources to which they refer will be restored. Structure is [documented below](#nested_restore_config_selected_applications). | false | false | None | None | None |
| `no_namespaces` | Do not restore any namespaced resources if set to "True". Specifying this field to "False" is not allowed. | false | false | None | None | None |
| `namespaced_resource_restore_mode` | Defines the behavior for handling the situation where sets of namespaced resources being restored already exist in the target cluster. This MUST be set to a value other than `NAMESPACED_RESOURCE_RESTORE_MODE_UNSPECIFIED` if the `namespacedResourceRestoreScope` is anything other than `noNamespaces`. See https://cloud.google.com/kubernetes-engine/docs/add-on/backup-for-gke/reference/rest/v1/RestoreConfig#namespacedresourcerestoremode for more information on each mode. Possible values are: `DELETE_AND_RESTORE`, `FAIL_ON_CONFLICT`, `MERGE_SKIP_ON_CONFLICT`, `MERGE_REPLACE_VOLUME_ON_CONFLICT`, `MERGE_REPLACE_ON_CONFLICT`. | false | false | None | None | None |
| `volume_data_restore_policy` | Specifies the mechanism to be used to restore volume data. This should be set to a value other than `NAMESPACED_RESOURCE_RESTORE_MODE_UNSPECIFIED` if the `namespacedResourceRestoreScope` is anything other than `noNamespaces`. If not specified, it will be treated as `NO_VOLUME_DATA_RESTORATION`. See https://cloud.google.com/kubernetes-engine/docs/add-on/backup-for-gke/reference/rest/v1/RestoreConfig#VolumeDataRestorePolicy for more information on each policy option. Possible values are: `RESTORE_VOLUME_DATA_FROM_BACKUP`, `REUSE_VOLUME_HANDLE_FROM_BACKUP`, `NO_VOLUME_DATA_RESTORATION`. | false | false | None | None | None |
| `cluster_resource_restore_scope` | Identifies the cluster-scoped resources to restore from the Backup. Structure is [documented below](#nested_restore_config_cluster_resource_restore_scope). | false | false | None | None | None |
| `cluster_resource_conflict_policy` | Defines the behavior for handling the situation where cluster-scoped resources being restored already exist in the target cluster. This MUST be set to a value other than `CLUSTER_RESOURCE_CONFLICT_POLICY_UNSPECIFIED` if `clusterResourceRestoreScope` is anyting other than `noGroupKinds`. See https://cloud.google.com/kubernetes-engine/docs/add-on/backup-for-gke/reference/rest/v1/RestoreConfig#clusterresourceconflictpolicy for more information on each policy option. Possible values are: `USE_EXISTING_VERSION`, `USE_BACKUP_VERSION`. | false | true | Conflict policy should default to using existing versions to preserve state stability. | USE_EXISTING_VERSION | USE_BACKUP_VERSION |
| `transformation_rules` | A list of transformation rules to be applied against Kubernetes resources as they are selected for restoration from a Backup. Rules are executed in order defined - this order matters, as changes made by a rule may impact the filtering logic of subsequent rules. An empty list means no transformation will occur. Structure is [documented below](#nested_restore_config_transformation_rules). | false | false | None | None | None |
| `volume_data_restore_policy_bindings` | A table that binds volumes by their scope to a restore policy. Bindings must have a unique scope. Any volumes not scoped in the bindings are subject to the policy defined in volume_data_restore_policy. Structure is [documented below](#nested_restore_config_volume_data_restore_policy_bindings). | false | false | None | None | None |
| `restore_order` | It contains custom ordering to use on a Restore. Structure is [documented below](#nested_restore_config_restore_order). | false | false | None | None | None |

### excluded_namespaces Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `namespaces` | A list of Kubernetes Namespaces. | true | false | None | None | None |

### selected_namespaces Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `namespaces` | A list of Kubernetes Namespaces. | true | false | None | None | None |

### selected_applications Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `namespaced_names` | A list of namespaced Kubernetes resources. Structure is [documented below](#nested_restore_config_selected_applications_namespaced_names). | true | false | None | None | None |

### namespaced_names Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `namespace` | The namespace of a Kubernetes Resource. | true | false | None | None | None |
| `name` | The name of a Kubernetes Resource. | true | false | None | None | None |

### cluster_resource_restore_scope Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `all_group_kinds` | If True, all valid cluster-scoped resources will be restored. Mutually exclusive to any other field in `clusterResourceRestoreScope`. | false | true | Avoid full cluster restores to prevent overwriting critical existing resources unless explicitly intended. | selected_group_kinds | all_group_kinds=true |
| `excluded_group_kinds` | A list of cluster-scoped resource group kinds to NOT restore from the backup. If specified, all valid cluster-scoped resources will be restored except for those specified in the list. Mutually exclusive to any other field in `clusterResourceRestoreScope`. Structure is [documented below](#nested_restore_config_cluster_resource_restore_scope_excluded_group_kinds). | false | false | None | None | None |
| `selected_group_kinds` | A list of cluster-scoped resource group kinds to restore from the backup. If specified, only the selected resources will be restored. Mutually exclusive to any other field in the `clusterResourceRestoreScope`. Structure is [documented below](#nested_restore_config_cluster_resource_restore_scope_selected_group_kinds). | false | false | None | None | None |
| `no_group_kinds` | If True, no cluster-scoped resources will be restored. Mutually exclusive to any other field in `clusterResourceRestoreScope`. | false | false | None | None | None |

### excluded_group_kinds Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_group` | API Group string of a Kubernetes resource, e.g. "apiextensions.k8s.io", "storage.k8s.io", etc. Use empty string for core group. | false | false | None | None | None |
| `resource_kind` | Kind of a Kubernetes resource, e.g. "CustomResourceDefinition", "StorageClass", etc. | false | false | None | None | None |

### selected_group_kinds Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_group` | API Group string of a Kubernetes resource, e.g. "apiextensions.k8s.io", "storage.k8s.io", etc. Use empty string for core group. | false | false | None | None | None |
| `resource_kind` | Kind of a Kubernetes resource, e.g. "CustomResourceDefinition", "StorageClass", etc. | false | false | None | None | None |

### transformation_rules Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `description` | The description is a user specified string description of the transformation rule. | false | false | None | None | None |
| `resource_filter` | This field is used to specify a set of fields that should be used to determine which resources in backup should be acted upon by the supplied transformation rule actions, and this will ensure that only specific resources are affected by transformation rule actions. Structure is [documented below](#nested_restore_config_transformation_rules_transformation_rules_resource_filter). | false | false | None | None | None |
| `field_actions` | A list of transformation rule actions to take against candidate resources. Actions are executed in order defined - this order matters, as they could potentially interfere with each other and the first operation could affect the outcome of the second operation. Structure is [documented below](#nested_restore_config_transformation_rules_transformation_rules_field_actions). | true | false | None | None | None |

### resource_filter Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `namespaces` | (Filtering parameter) Any resource subject to transformation must be contained within one of the listed Kubernetes Namespace in the Backup. If this field is not provided, no namespace filtering will be performed (all resources in all Namespaces, including all cluster-scoped resources, will be candidates for transformation). To mix cluster-scoped and namespaced resources in the same rule, use an empty string ("") as one of the target namespaces. | false | false | None | None | None |
| `group_kinds` | (Filtering parameter) Any resource subject to transformation must belong to one of the listed "types". If this field is not provided, no type filtering will be performed (all resources of all types matching previous filtering parameters will be candidates for transformation). Structure is [documented below](#nested_restore_config_transformation_rules_transformation_rules_resource_filter_group_kinds). | false | false | None | None | None |
| `json_path` | This is a JSONPath expression that matches specific fields of candidate resources and it operates as a filtering parameter (resources that are not matched with this expression will not be candidates for transformation). | false | false | None | None | None |

### group_kinds Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_group` | API Group string of a Kubernetes resource, e.g. "apiextensions.k8s.io", "storage.k8s.io", etc. Use empty string for core group. | false | false | None | None | None |
| `resource_kind` | Kind of a Kubernetes resource, e.g. "CustomResourceDefinition", "StorageClass", etc. | false | false | None | None | None |

### field_actions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `op` | Specifies the operation to perform. Possible values are: `REMOVE`, `MOVE`, `COPY`, `ADD`, `TEST`, `REPLACE`. | true | false | None | None | None |
| `from_path` | A string containing a JSON Pointer value that references the location in the target document to move the value from. | false | false | None | None | None |
| `path` | A string containing a JSON-Pointer value that references a location within the target document where the operation is performed. | false | false | None | None | None |
| `value` | A string that specifies the desired value in string format to use for transformation. | false | false | None | None | None |

### volume_data_restore_policy_bindings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `policy` | Specifies the mechanism to be used to restore this volume data. See https://cloud.google.com/kubernetes-engine/docs/add-on/backup-for-gke/reference/rest/v1/RestoreConfig#VolumeDataRestorePolicy for more information on each policy option. Possible values are: `RESTORE_VOLUME_DATA_FROM_BACKUP`, `REUSE_VOLUME_HANDLE_FROM_BACKUP`, `NO_VOLUME_DATA_RESTORATION`. | true | false | None | None | None |
| `volume_type` | The volume type, as determined by the PVC's bound PV, to apply the policy to. Possible values are: `GCE_PERSISTENT_DISK`. | true | false | None | None | None |

### restore_order Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `group_kind_dependencies` | A list of group kind dependency pairs that is used by Backup for GKE to generate a group kind restore order. Structure is [documented below](#nested_restore_config_restore_order_group_kind_dependencies). | true | false | None | None | None |

### group_kind_dependencies Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `satisfying` | The satisfying group kind must be restored first in order to satisfy the dependency. Structure is [documented below](#nested_restore_config_restore_order_group_kind_dependencies_group_kind_dependencies_satisfying). | true | false | None | None | None |
| `requiring` | The requiring group kind requires that the satisfying group kind be restored first. Structure is [documented below](#nested_restore_config_restore_order_group_kind_dependencies_group_kind_dependencies_requiring). | true | false | None | None | None |

### satisfying Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_group` | API Group of a Kubernetes resource, e.g. "apiextensions.k8s.io", "storage.k8s.io", etc. Use empty string for core group. | false | false | None | None | None |
| `resource_kind` | Kind of a Kubernetes resource, e.g. "CustomResourceDefinition", "StorageClass", etc. | false | false | None | None | None |

### requiring Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_group` | API Group of a Kubernetes resource, e.g. "apiextensions.k8s.io", "storage.k8s.io", etc. Use empty string for core group. | false | false | None | None | None |
| `resource_kind` | Kind of a Kubernetes resource, e.g. "CustomResourceDefinition", "StorageClass", etc. | false | false | None | None | None |
