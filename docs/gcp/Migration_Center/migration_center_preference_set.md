## 🛡️ Policy Deployment Engine: `migration_center_preference_set`

This section provides a concise policy evaluation for the `migration_center_preference_set` resource in GCP.

Reference: [Terraform Registry – migration_center_preference_set](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/migration_center_preference_set)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Part of `parent`. See documentation of `projectsId`. | true | None | None |
| `preference_set_id` | Required. User specified ID for the preference set. It will become the last component of the preference set name. The ID must be unique within the project, must conform with RFC-1034, is restricted to lower-cased letters, and has a maximum length of 63 characters. The ID must match the regular expression `[a-z]([a-z0-9-]{0,61}[a-z0-9])?`. | true | None | None |
| `display_name` | User-friendly display name. Maximum length is 63 characters. | false | None | None |
| `description` | A description of the preference set. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### virtual_machine_preferences Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target_product` | Target product for assets using this preference set. Specify either target product or business goal, but not both. Possible values: `COMPUTE_MIGRATION_TARGET_PRODUCT_UNSPECIFIED`, `COMPUTE_MIGRATION_TARGET_PRODUCT_COMPUTE_ENGINE`, `COMPUTE_MIGRATION_TARGET_PRODUCT_VMWARE_ENGINE`, `COMPUTE_MIGRATION_TARGET_PRODUCT_SOLE_TENANCY` | false | None | None |
| `region_preferences` | The user preferences relating to target regions. Structure is [documented below](#nested_virtual_machine_preferences_region_preferences). | false | None | None |
| `commitment_plan` | Commitment plan to consider when calculating costs for virtual machine insights and recommendations. If you are unsure which value to set, a 3 year commitment plan is often a good value to start with. Possible values: `COMMITMENT_PLAN_UNSPECIFIED`, `COMMITMENT_PLAN_NONE`, `COMMITMENT_PLAN_ONE_YEAR`, `COMMITMENT_PLAN_THREE_YEARS` | false | None | None |
| `sizing_optimization_strategy` | Sizing optimization strategy specifies the preferred strategy used when extrapolating usage data to calculate insights and recommendations for a virtual machine. If you are unsure which value to set, a moderate sizing optimization strategy is often a good value to start with. Possible values: `SIZING_OPTIMIZATION_STRATEGY_UNSPECIFIED`, `SIZING_OPTIMIZATION_STRATEGY_SAME_AS_SOURCE`, `SIZING_OPTIMIZATION_STRATEGY_MODERATE`, `SIZING_OPTIMIZATION_STRATEGY_AGGRESSIVE` | false | None | None |
| `compute_engine_preferences` | The user preferences relating to Compute Engine target platform. Structure is [documented below](#nested_virtual_machine_preferences_compute_engine_preferences). | false | None | None |
| `vmware_engine_preferences` | The user preferences relating to Google Cloud VMware Engine target platform. Structure is [documented below](#nested_virtual_machine_preferences_vmware_engine_preferences). | false | None | None |
| `sole_tenancy_preferences` | Preferences concerning Sole Tenancy nodes and VMs. Structure is [documented below](#nested_virtual_machine_preferences_sole_tenancy_preferences). | false | None | None |

### region_preferences Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `preferred_regions` | A list of preferred regions, ordered by the most preferred region first. Set only valid Google Cloud region names. See https://cloud.google.com/compute/docs/regions-zones for available regions. | false | None | None |

### compute_engine_preferences Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `machine_preferences` | The type of machines to consider when calculating virtual machine migration insights and recommendations. Not all machine types are available in all zones and regions. Structure is [documented below](#nested_virtual_machine_preferences_compute_engine_preferences_machine_preferences). | false | None | None |
| `license_type` | License type to consider when calculating costs for virtual machine insights and recommendations. If unspecified, costs are calculated based on the default licensing plan. Possible values: `LICENSE_TYPE_UNSPECIFIED`, `LICENSE_TYPE_DEFAULT`, `LICENSE_TYPE_BRING_YOUR_OWN_LICENSE` | false | None | None |

### machine_preferences Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_machine_series` | Compute Engine machine series to consider for insights and recommendations. If empty, no restriction is applied on the machine series. Structure is [documented below](#nested_virtual_machine_preferences_compute_engine_preferences_machine_preferences_allowed_machine_series). | false | None | None |

### allowed_machine_series Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `code` | Code to identify a Compute Engine machine series. Consult https://cloud.google.com/compute/docs/machine-resource#machine_type_comparison for more details on the available series. | false | None | None |

### vmware_engine_preferences Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cpu_overcommit_ratio` | CPU overcommit ratio. Acceptable values are between 1.0 and 8.0, with 0.1 increment. | false | None | None |
| `memory_overcommit_ratio` | Memory overcommit ratio. Acceptable values are 1.0, 1.25, 1.5, 1.75 and 2.0. | false | None | None |
| `storage_deduplication_compression_ratio` | The Deduplication and Compression ratio is based on the logical (Used Before) space required to store data before applying deduplication and compression, in relation to the physical (Used After) space required after applying deduplication and compression. Specifically, the ratio is the Used Before space divided by the Used After space. For example, if the Used Before space is 3 GB, but the physical Used After space is 1 GB, the deduplication and compression ratio is 3x. Acceptable values are between 1.0 and 4.0. | false | None | None |
| `commitment_plan` | Commitment plan to consider when calculating costs for virtual machine insights and recommendations. If you are unsure which value to set, a 3 year commitment plan is often a good value to start with. Possible values: `COMMITMENT_PLAN_UNSPECIFIED`, `ON_DEMAND`, `COMMITMENT_1_YEAR_MONTHLY_PAYMENTS`, `COMMITMENT_3_YEAR_MONTHLY_PAYMENTS`, `COMMITMENT_1_YEAR_UPFRONT_PAYMENT`, `COMMITMENT_3_YEAR_UPFRONT_PAYMENT`, | false | None | None |

### sole_tenancy_preferences Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cpu_overcommit_ratio` | CPU overcommit ratio. Acceptable values are between 1.0 and 2.0 inclusive. | false | None | None |
| `host_maintenance_policy` | Sole Tenancy nodes maintenance policy. Possible values: `HOST_MAINTENANCE_POLICY_UNSPECIFIED`, `HOST_MAINTENANCE_POLICY_DEFAULT`, `HOST_MAINTENANCE_POLICY_RESTART_IN_PLACE`, `HOST_MAINTENANCE_POLICY_MIGRATE_WITHIN_NODE_GROUP` | false | None | None |
| `commitment_plan` | Commitment plan to consider when calculating costs for virtual machine insights and recommendations. If you are unsure which value to set, a 3 year commitment plan is often a good value to start with. Possible values: `COMMITMENT_PLAN_UNSPECIFIED`, `ON_DEMAND`, `COMMITMENT_1_YEAR`, `COMMITMENT_3_YEAR` | false | None | None |
| `node_types` | A list of sole tenant node types. An empty list means that all possible node types will be considered. Structure is [documented below](#nested_virtual_machine_preferences_sole_tenancy_preferences_node_types). | false | None | None |

### node_types Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_name` | Name of the Sole Tenant node. Consult https://cloud.google.com/compute/docs/nodes/sole-tenant-nodes | false | None | None |
