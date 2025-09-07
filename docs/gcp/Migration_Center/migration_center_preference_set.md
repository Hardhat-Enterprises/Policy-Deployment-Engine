## 🛡️ Policy Deployment Engine: `migration_center_preference_set`

This section provides a concise policy evaluation for the `migration_center_preference_set` resource in GCP.

Reference: [Terraform Registry – migration_center_preference_set](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/migration_center_preference_set)

---

## 1. Argument Reference

### `location`
- Description: (Required) Part of `parent`. See documentation of `projectsId`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preference_set_id`
- Description: (Required) Required. User specified ID for the preference set. It will become the last component of the preference set name. The ID must be unique within the project, must conform with RFC-1034, is restricted to lower-cased letters, and has a maximum length of 63 characters. The ID must match the regular expression `[a-z]([a-z0-9-]{0,61}[a-z0-9])?`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User-friendly display name. Maximum length is 63 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the preference set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `virtual_machine_preferences`
- Description: (Optional) VirtualMachinePreferences enables you to create sets of assumptions, for example, a geographical location and pricing track, for your migrated virtual machines. The set of preferences influence recommendations for migrating virtual machine assets. Structure is [documented below](#nested_virtual_machine_preferences).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_virtual_machine_preferences"></a>The `virtual_machine_preferences` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_product`
- Description: (Optional) Target product for assets using this preference set. Specify either target product or business goal, but not both. Possible values: `COMPUTE_MIGRATION_TARGET_PRODUCT_UNSPECIFIED`, `COMPUTE_MIGRATION_TARGET_PRODUCT_COMPUTE_ENGINE`, `COMPUTE_MIGRATION_TARGET_PRODUCT_VMWARE_ENGINE`, `COMPUTE_MIGRATION_TARGET_PRODUCT_SOLE_TENANCY`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region_preferences`
- Description: (Optional) The user preferences relating to target regions. Structure is [documented below](#nested_virtual_machine_preferences_region_preferences).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `commitment_plan`
- Description: (Optional) Commitment plan to consider when calculating costs for virtual machine insights and recommendations. If you are unsure which value to set, a 3 year commitment plan is often a good value to start with. Possible values: `COMMITMENT_PLAN_UNSPECIFIED`, `COMMITMENT_PLAN_NONE`, `COMMITMENT_PLAN_ONE_YEAR`, `COMMITMENT_PLAN_THREE_YEARS`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sizing_optimization_strategy`
- Description: (Optional) Sizing optimization strategy specifies the preferred strategy used when extrapolating usage data to calculate insights and recommendations for a virtual machine. If you are unsure which value to set, a moderate sizing optimization strategy is often a good value to start with. Possible values: `SIZING_OPTIMIZATION_STRATEGY_UNSPECIFIED`, `SIZING_OPTIMIZATION_STRATEGY_SAME_AS_SOURCE`, `SIZING_OPTIMIZATION_STRATEGY_MODERATE`, `SIZING_OPTIMIZATION_STRATEGY_AGGRESSIVE`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `compute_engine_preferences`
- Description: (Optional) The user preferences relating to Compute Engine target platform. Structure is [documented below](#nested_virtual_machine_preferences_compute_engine_preferences).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vmware_engine_preferences`
- Description: (Optional) The user preferences relating to Google Cloud VMware Engine target platform. Structure is [documented below](#nested_virtual_machine_preferences_vmware_engine_preferences).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sole_tenancy_preferences`
- Description: (Optional) Preferences concerning Sole Tenancy nodes and VMs. Structure is [documented below](#nested_virtual_machine_preferences_sole_tenancy_preferences). <a name="nested_virtual_machine_preferences_region_preferences"></a>The `region_preferences` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preferred_regions`
- Description: (Optional) A list of preferred regions, ordered by the most preferred region first. Set only valid Google Cloud region names. See https://cloud.google.com/compute/docs/regions-zones for available regions. <a name="nested_virtual_machine_preferences_compute_engine_preferences"></a>The `compute_engine_preferences` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_preferences`
- Description: (Optional) The type of machines to consider when calculating virtual machine migration insights and recommendations. Not all machine types are available in all zones and regions. Structure is [documented below](#nested_virtual_machine_preferences_compute_engine_preferences_machine_preferences).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `license_type`
- Description: (Optional) License type to consider when calculating costs for virtual machine insights and recommendations. If unspecified, costs are calculated based on the default licensing plan. Possible values: `LICENSE_TYPE_UNSPECIFIED`, `LICENSE_TYPE_DEFAULT`, `LICENSE_TYPE_BRING_YOUR_OWN_LICENSE` <a name="nested_virtual_machine_preferences_compute_engine_preferences_machine_preferences"></a>The `machine_preferences` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_machine_series`
- Description: (Optional) Compute Engine machine series to consider for insights and recommendations. If empty, no restriction is applied on the machine series. Structure is [documented below](#nested_virtual_machine_preferences_compute_engine_preferences_machine_preferences_allowed_machine_series). <a name="nested_virtual_machine_preferences_compute_engine_preferences_machine_preferences_allowed_machine_series"></a>The `allowed_machine_series` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `code`
- Description: (Optional) Code to identify a Compute Engine machine series. Consult https://cloud.google.com/compute/docs/machine-resource#machine_type_comparison for more details on the available series. <a name="nested_virtual_machine_preferences_vmware_engine_preferences"></a>The `vmware_engine_preferences` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_overcommit_ratio`
- Description: (Optional) CPU overcommit ratio. Acceptable values are between 1.0 and 8.0, with 0.1 increment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory_overcommit_ratio`
- Description: (Optional) Memory overcommit ratio. Acceptable values are 1.0, 1.25, 1.5, 1.75 and 2.0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_deduplication_compression_ratio`
- Description: (Optional) The Deduplication and Compression ratio is based on the logical (Used Before) space required to store data before applying deduplication and compression, in relation to the physical (Used After) space required after applying deduplication and compression. Specifically, the ratio is the Used Before space divided by the Used After space. For example, if the Used Before space is 3 GB, but the physical Used After space is 1 GB, the deduplication and compression ratio is 3x. Acceptable values are between 1.0 and 4.0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `commitment_plan`
- Description: (Optional) Commitment plan to consider when calculating costs for virtual machine insights and recommendations. If you are unsure which value to set, a 3 year commitment plan is often a good value to start with. Possible values: `COMMITMENT_PLAN_UNSPECIFIED`, `ON_DEMAND`, `COMMITMENT_1_YEAR_MONTHLY_PAYMENTS`, `COMMITMENT_3_YEAR_MONTHLY_PAYMENTS`, `COMMITMENT_1_YEAR_UPFRONT_PAYMENT`, `COMMITMENT_3_YEAR_UPFRONT_PAYMENT`, <a name="nested_virtual_machine_preferences_sole_tenancy_preferences"></a>The `sole_tenancy_preferences` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_overcommit_ratio`
- Description: (Optional) CPU overcommit ratio. Acceptable values are between 1.0 and 2.0 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_maintenance_policy`
- Description: (Optional) Sole Tenancy nodes maintenance policy. Possible values: `HOST_MAINTENANCE_POLICY_UNSPECIFIED`, `HOST_MAINTENANCE_POLICY_DEFAULT`, `HOST_MAINTENANCE_POLICY_RESTART_IN_PLACE`, `HOST_MAINTENANCE_POLICY_MIGRATE_WITHIN_NODE_GROUP`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `commitment_plan`
- Description: (Optional) Commitment plan to consider when calculating costs for virtual machine insights and recommendations. If you are unsure which value to set, a 3 year commitment plan is often a good value to start with. Possible values: `COMMITMENT_PLAN_UNSPECIFIED`, `ON_DEMAND`, `COMMITMENT_1_YEAR`, `COMMITMENT_3_YEAR`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_types`
- Description: (Optional) A list of sole tenant node types. An empty list means that all possible node types will be considered. Structure is [documented below](#nested_virtual_machine_preferences_sole_tenancy_preferences_node_types). <a name="nested_virtual_machine_preferences_sole_tenancy_preferences_node_types"></a>The `node_types` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_name`
- Description: (Optional) Name of the Sole Tenant node. Consult https://cloud.google.com/compute/docs/nodes/sole-tenant-nodes
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
