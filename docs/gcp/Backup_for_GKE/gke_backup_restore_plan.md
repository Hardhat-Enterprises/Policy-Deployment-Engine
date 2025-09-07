## 🛡️ Policy Deployment Engine: `gke_backup_restore_plan`

This section provides a concise policy evaluation for the `gke_backup_restore_plan` resource in GCP.

Reference: [Terraform Registry – gke_backup_restore_plan](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_backup_restore_plan)

---

## 1. Argument Reference

### `name`
- Description: (Required) The full name of the BackupPlan Resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_plan`
- Description: (Required) A reference to the BackupPlan from which Backups may be used as the source for Restores created via this RestorePlan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Required) The source cluster from which Restores will be created via this RestorePlan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `restore_config`
- Description: (Required) Defines the configuration of Restores created via this RestorePlan. Structure is [documented below](#nested_restore_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The region of the Restore Plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User specified descriptive string for this RestorePlan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Description: A set of custom labels supplied by the user. A list of key->value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_restore_config"></a>The `restore_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `all_namespaces`
- Description: (Optional) If True, restore all namespaced resources in the Backup. Setting this field to False will result in an error.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excluded_namespaces`
- Description: (Optional) A list of selected namespaces excluded from restoration. All namespaces except those in this list will be restored. Structure is [documented below](#nested_restore_config_excluded_namespaces).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `selected_namespaces`
- Description: (Optional) A list of selected namespaces to restore from the Backup. The listed Namespaces and all resources contained in them will be restored. Structure is [documented below](#nested_restore_config_selected_namespaces).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `selected_applications`
- Description: (Optional) A list of selected ProtectedApplications to restore. The listed ProtectedApplications and all the resources to which they refer will be restored. Structure is [documented below](#nested_restore_config_selected_applications).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `no_namespaces`
- Description: (Optional) Do not restore any namespaced resources if set to "True". Specifying this field to "False" is not allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespaced_resource_restore_mode`
- Description: (Optional) Defines the behavior for handling the situation where sets of namespaced resources being restored already exist in the target cluster. This MUST be set to a value other than `NAMESPACED_RESOURCE_RESTORE_MODE_UNSPECIFIED` if the `namespacedResourceRestoreScope` is anything other than `noNamespaces`. See https://cloud.google.com/kubernetes-engine/docs/add-on/backup-for-gke/reference/rest/v1/RestoreConfig#namespacedresourcerestoremode for more information on each mode. Possible values are: `DELETE_AND_RESTORE`, `FAIL_ON_CONFLICT`, `MERGE_SKIP_ON_CONFLICT`, `MERGE_REPLACE_VOLUME_ON_CONFLICT`, `MERGE_REPLACE_ON_CONFLICT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volume_data_restore_policy`
- Description: (Optional) Specifies the mechanism to be used to restore volume data. This should be set to a value other than `NAMESPACED_RESOURCE_RESTORE_MODE_UNSPECIFIED` if the `namespacedResourceRestoreScope` is anything other than `noNamespaces`. If not specified, it will be treated as `NO_VOLUME_DATA_RESTORATION`. See https://cloud.google.com/kubernetes-engine/docs/add-on/backup-for-gke/reference/rest/v1/RestoreConfig#VolumeDataRestorePolicy for more information on each policy option. Possible values are: `RESTORE_VOLUME_DATA_FROM_BACKUP`, `REUSE_VOLUME_HANDLE_FROM_BACKUP`, `NO_VOLUME_DATA_RESTORATION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_resource_restore_scope`
- Description: (Optional) Identifies the cluster-scoped resources to restore from the Backup. Structure is [documented below](#nested_restore_config_cluster_resource_restore_scope).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_resource_conflict_policy`
- Description: (Optional) Defines the behavior for handling the situation where cluster-scoped resources being restored already exist in the target cluster. This MUST be set to a value other than `CLUSTER_RESOURCE_CONFLICT_POLICY_UNSPECIFIED` if `clusterResourceRestoreScope` is anyting other than `noGroupKinds`. See https://cloud.google.com/kubernetes-engine/docs/add-on/backup-for-gke/reference/rest/v1/RestoreConfig#clusterresourceconflictpolicy for more information on each policy option. Possible values are: `USE_EXISTING_VERSION`, `USE_BACKUP_VERSION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transformation_rules`
- Description: (Optional) A list of transformation rules to be applied against Kubernetes resources as they are selected for restoration from a Backup. Rules are executed in order defined - this order matters, as changes made by a rule may impact the filtering logic of subsequent rules. An empty list means no transformation will occur. Structure is [documented below](#nested_restore_config_transformation_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volume_data_restore_policy_bindings`
- Description: (Optional) A table that binds volumes by their scope to a restore policy. Bindings must have a unique scope. Any volumes not scoped in the bindings are subject to the policy defined in volume_data_restore_policy. Structure is [documented below](#nested_restore_config_volume_data_restore_policy_bindings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `restore_order`
- Description: (Optional) It contains custom ordering to use on a Restore. Structure is [documented below](#nested_restore_config_restore_order). <a name="nested_restore_config_excluded_namespaces"></a>The `excluded_namespaces` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespaces`
- Description: (Required) A list of Kubernetes Namespaces. <a name="nested_restore_config_selected_namespaces"></a>The `selected_namespaces` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespaces`
- Description: (Required) A list of Kubernetes Namespaces. <a name="nested_restore_config_selected_applications"></a>The `selected_applications` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespaced_names`
- Description: (Required) A list of namespaced Kubernetes resources. Structure is [documented below](#nested_restore_config_selected_applications_namespaced_names). <a name="nested_restore_config_selected_applications_namespaced_names"></a>The `namespaced_names` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace`
- Description: (Required) The namespace of a Kubernetes Resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of a Kubernetes Resource. <a name="nested_restore_config_cluster_resource_restore_scope"></a>The `cluster_resource_restore_scope` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `all_group_kinds`
- Description: (Optional) If True, all valid cluster-scoped resources will be restored. Mutually exclusive to any other field in `clusterResourceRestoreScope`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excluded_group_kinds`
- Description: (Optional) A list of cluster-scoped resource group kinds to NOT restore from the backup. If specified, all valid cluster-scoped resources will be restored except for those specified in the list. Mutually exclusive to any other field in `clusterResourceRestoreScope`. Structure is [documented below](#nested_restore_config_cluster_resource_restore_scope_excluded_group_kinds).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `selected_group_kinds`
- Description: (Optional) A list of cluster-scoped resource group kinds to restore from the backup. If specified, only the selected resources will be restored. Mutually exclusive to any other field in the `clusterResourceRestoreScope`. Structure is [documented below](#nested_restore_config_cluster_resource_restore_scope_selected_group_kinds).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `no_group_kinds`
- Description: (Optional) If True, no cluster-scoped resources will be restored. Mutually exclusive to any other field in `clusterResourceRestoreScope`. <a name="nested_restore_config_cluster_resource_restore_scope_excluded_group_kinds"></a>The `excluded_group_kinds` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_group`
- Description: (Optional) API Group string of a Kubernetes resource, e.g. "apiextensions.k8s.io", "storage.k8s.io", etc. Use empty string for core group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_kind`
- Description: (Optional) Kind of a Kubernetes resource, e.g. "CustomResourceDefinition", "StorageClass", etc. <a name="nested_restore_config_cluster_resource_restore_scope_selected_group_kinds"></a>The `selected_group_kinds` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_group`
- Description: (Optional) API Group string of a Kubernetes resource, e.g. "apiextensions.k8s.io", "storage.k8s.io", etc. Use empty string for core group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_kind`
- Description: (Optional) Kind of a Kubernetes resource, e.g. "CustomResourceDefinition", "StorageClass", etc. <a name="nested_restore_config_transformation_rules"></a>The `transformation_rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description is a user specified string description of the transformation rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_filter`
- Description: (Optional) This field is used to specify a set of fields that should be used to determine which resources in backup should be acted upon by the supplied transformation rule actions, and this will ensure that only specific resources are affected by transformation rule actions. Structure is [documented below](#nested_restore_config_transformation_rules_transformation_rules_resource_filter).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field_actions`
- Description: (Required) A list of transformation rule actions to take against candidate resources. Actions are executed in order defined - this order matters, as they could potentially interfere with each other and the first operation could affect the outcome of the second operation. Structure is [documented below](#nested_restore_config_transformation_rules_transformation_rules_field_actions). <a name="nested_restore_config_transformation_rules_transformation_rules_resource_filter"></a>The `resource_filter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespaces`
- Description: (Optional) (Filtering parameter) Any resource subject to transformation must be contained within one of the listed Kubernetes Namespace in the Backup. If this field is not provided, no namespace filtering will be performed (all resources in all Namespaces, including all cluster-scoped resources, will be candidates for transformation). To mix cluster-scoped and namespaced resources in the same rule, use an empty string ("") as one of the target namespaces.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_kinds`
- Description: (Optional) (Filtering parameter) Any resource subject to transformation must belong to one of the listed "types". If this field is not provided, no type filtering will be performed (all resources of all types matching previous filtering parameters will be candidates for transformation). Structure is [documented below](#nested_restore_config_transformation_rules_transformation_rules_resource_filter_group_kinds).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `json_path`
- Description: (Optional) This is a JSONPath expression that matches specific fields of candidate resources and it operates as a filtering parameter (resources that are not matched with this expression will not be candidates for transformation). <a name="nested_restore_config_transformation_rules_transformation_rules_resource_filter_group_kinds"></a>The `group_kinds` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_group`
- Description: (Optional) API Group string of a Kubernetes resource, e.g. "apiextensions.k8s.io", "storage.k8s.io", etc. Use empty string for core group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_kind`
- Description: (Optional) Kind of a Kubernetes resource, e.g. "CustomResourceDefinition", "StorageClass", etc. <a name="nested_restore_config_transformation_rules_transformation_rules_field_actions"></a>The `field_actions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `op`
- Description: (Required) Specifies the operation to perform. Possible values are: `REMOVE`, `MOVE`, `COPY`, `ADD`, `TEST`, `REPLACE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `from_path`
- Description: (Optional) A string containing a JSON Pointer value that references the location in the target document to move the value from.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) A string containing a JSON-Pointer value that references a location within the target document where the operation is performed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) A string that specifies the desired value in string format to use for transformation. <a name="nested_restore_config_volume_data_restore_policy_bindings"></a>The `volume_data_restore_policy_bindings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy`
- Description: (Required) Specifies the mechanism to be used to restore this volume data. See https://cloud.google.com/kubernetes-engine/docs/add-on/backup-for-gke/reference/rest/v1/RestoreConfig#VolumeDataRestorePolicy for more information on each policy option. Possible values are: `RESTORE_VOLUME_DATA_FROM_BACKUP`, `REUSE_VOLUME_HANDLE_FROM_BACKUP`, `NO_VOLUME_DATA_RESTORATION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volume_type`
- Description: (Required) The volume type, as determined by the PVC's bound PV, to apply the policy to. Possible values are: `GCE_PERSISTENT_DISK`. <a name="nested_restore_config_restore_order"></a>The `restore_order` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_kind_dependencies`
- Description: (Required) A list of group kind dependency pairs that is used by Backup for GKE to generate a group kind restore order. Structure is [documented below](#nested_restore_config_restore_order_group_kind_dependencies). <a name="nested_restore_config_restore_order_group_kind_dependencies"></a>The `group_kind_dependencies` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `satisfying`
- Description: (Required) The satisfying group kind must be restored first in order to satisfy the dependency. Structure is [documented below](#nested_restore_config_restore_order_group_kind_dependencies_group_kind_dependencies_satisfying).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `requiring`
- Description: (Required) The requiring group kind requires that the satisfying group kind be restored first. Structure is [documented below](#nested_restore_config_restore_order_group_kind_dependencies_group_kind_dependencies_requiring). <a name="nested_restore_config_restore_order_group_kind_dependencies_group_kind_dependencies_satisfying"></a>The `satisfying` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_group`
- Description: (Optional) API Group of a Kubernetes resource, e.g. "apiextensions.k8s.io", "storage.k8s.io", etc. Use empty string for core group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_kind`
- Description: (Optional) Kind of a Kubernetes resource, e.g. "CustomResourceDefinition", "StorageClass", etc. <a name="nested_restore_config_restore_order_group_kind_dependencies_group_kind_dependencies_requiring"></a>The `requiring` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_group`
- Description: (Optional) API Group of a Kubernetes resource, e.g. "apiextensions.k8s.io", "storage.k8s.io", etc. Use empty string for core group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_kind`
- Description: (Optional) Kind of a Kubernetes resource, e.g. "CustomResourceDefinition", "StorageClass", etc.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
