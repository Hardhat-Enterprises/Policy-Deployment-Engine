## 🛡️ Policy Deployment Engine: `netapp_storage_pool`

This section provides a concise policy evaluation for the `netapp_storage_pool` resource in GCP.

Reference: [Terraform Registry – netapp_storage_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_storage_pool)

---

## 1. Argument Reference

### `service_level`
- Description: (Required) Service level of the storage pool. Possible values are: `PREMIUM`, `EXTREME`, `STANDARD`, `FLEX`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `capacity_gib`
- Description: (Required) Capacity of the storage pool (in GiB).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) VPC network name with format: `projects/{{project}}/global/networks/{{network}}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Name of the location. For zonal Flex pools specify a zone name, in all other cases a region name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The resource name of the storage pool. Needs to be unique per location/region.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `active_directory`
- Description: (Optional) Specifies the Active Directory policy to be used. Format: `projects/{{project}}/locations/{{location}}/activeDirectories/{{name}}`. The policy needs to be in the same location as the storage pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_config`
- Description: (Optional) Specifies the CMEK policy to be used for volume encryption. Format: `projects/{{project}}/locations/{{location}}/kmsConfigs/{{name}}`. The policy needs to be in the same location as the storage pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ldap_enabled`
- Description: (Optional) When enabled, the volumes uses Active Directory as LDAP name service for UID/GID lookups. Required to enable extended group support for NFSv3, using security identifiers for NFSv4.1 or principal names for kerberized NFSv4.1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) Specifies the active zone for regional Flex pools. `zone` and `replica_zone` values can be swapped to initiate a [zone switch](https://cloud.google.com/netapp/volumes/docs/configure-and-use/storage-pools/edit-or-delete-storage-pool#switch_active_and_replica_zones). If you want to create a zonal Flex pool, specify a zone name for `location` and omit `zone`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replica_zone`
- Description: (Optional) Specifies the replica zone for regional Flex pools. `zone` and `replica_zone` values can be swapped to initiate a [zone switch](https://cloud.google.com/netapp/volumes/docs/configure-and-use/storage-pools/edit-or-delete-storage-pool#switch_active_and_replica_zones).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_auto_tiering`
- Description: (Optional) Optional. True if the storage pool supports Auto Tiering enabled volumes. Default is false. Auto-tiering can be enabled after storage pool creation but it can't be disabled once enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_performance_enabled`
- Description: (Optional) Optional. True if using Independent Scaling of capacity and performance (Hyperdisk). Default is false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `total_throughput_mibps`
- Description: (Optional) Optional. Custom Performance Total Throughput of the pool (in MiB/s).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `total_iops`
- Description: (Optional) Optional. Custom Performance Total IOPS of the pool If not provided, it will be calculated based on the totalThroughputMibps
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hot_tier_size_gib`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Total hot tier capacity for the Storage Pool. It is applicable only to Flex service level. It should be less than the minimum storage pool size and cannot be more than the current storage pool size. It cannot be decreased once set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_hot_tier_auto_resize`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Flag indicating that the hot-tier threshold will be auto-increased by 10% of the hot-tier when it hits 100%. Default is true. The increment will kick in only if the new size after increment is still less than or equal to storage pool size.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
