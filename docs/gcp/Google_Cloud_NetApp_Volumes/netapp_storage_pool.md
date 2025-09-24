## 🛡️ Policy Deployment Engine: `netapp_storage_pool`

This section provides a concise policy evaluation for the `netapp_storage_pool` resource in GCP.

Reference: [Terraform Registry – netapp_storage_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_storage_pool)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_level` | Service level of the storage pool. Possible values are: `PREMIUM`, `EXTREME`, `STANDARD`, `FLEX`. | true | false | None | None | None |
| `capacity_gib` | Capacity of the storage pool (in GiB). | true | false | None | None | None |
| `network` | VPC self-link the pool attaches to. | true | true | Restricts attachment to approved/non-default VPCs with controlled ingress/egress. | projects/deakin-lab-123/global/networks/nondefault-vpc | projects/deakin-lab-123/global/networks/default |
| `location` | Region of the storage pool. | true | true | Data residency and sovereignty. | australia-southeast2 | us-central1 |
| `name` | The resource name of the storage pool. Needs to be unique per location/region. | true | false | None | None | None |
| `description` | An optional description of this resource. | false | false | None | None | None |
| `labels` | Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `active_directory` | Specifies the Active Directory policy to be used. Format: `projects/{{project}}/locations/{{location}}/activeDirectories/{{name}}`. The policy needs to be in the same location as the storage pool. | false | false | None | None | None |
| `kms_config` | Specifies the CMEK policy to be used for volume encryption. Format: `projects/{{project}}/locations/{{location}}/kmsConfigs/{{name}}`. The policy needs to be in the same location as the storage pool. | false | false | None | None | None |
| `ldap_enabled` | When enabled, the volumes uses Active Directory as LDAP name service for UID/GID lookups. Required to enable extended group support for NFSv3, using security identifiers for NFSv4.1 or principal names for kerberized NFSv4.1. | false | false | None | None | None |
| `zone` | Specifies the active zone for regional Flex pools. `zone` and `replica_zone` values can be swapped to initiate a [zone switch](https://cloud.google.com/netapp/volumes/docs/configure-and-use/storage-pools/edit-or-delete-storage-pool#switch_active_and_replica_zones). If you want to create a zonal Flex pool, specify a zone name for `location` and omit `zone`. | false | false | None | None | None |
| `replica_zone` | Specifies the replica zone for regional Flex pools. `zone` and `replica_zone` values can be swapped to initiate a [zone switch](https://cloud.google.com/netapp/volumes/docs/configure-and-use/storage-pools/edit-or-delete-storage-pool#switch_active_and_replica_zones). | false | false | None | None | None |
| `allow_auto_tiering` | Optional. True if the storage pool supports Auto Tiering enabled volumes. Default is false. Auto-tiering can be enabled after storage pool creation but it can't be disabled once enabled. | false | false | None | None | None |
| `custom_performance_enabled` | Optional. True if using Independent Scaling of capacity and performance (Hyperdisk). Default is false. | false | false | None | None | None |
| `total_throughput_mibps` | Optional. Custom Performance Total Throughput of the pool (in MiB/s). | false | false | None | None | None |
| `total_iops` | Optional. Custom Performance Total IOPS of the pool If not provided, it will be calculated based on the totalThroughputMibps | false | false | None | None | None |
| `hot_tier_size_gib` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Total hot tier capacity for the Storage Pool. It is applicable only to Flex service level. It should be less than the minimum storage pool size and cannot be more than the current storage pool size. It cannot be decreased once set. | false | false | None | None | None |
| `enable_hot_tier_auto_resize` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Flag indicating that the hot-tier threshold will be auto-increased by 10% of the hot-tier when it hits 100%. Default is true. The increment will kick in only if the new size after increment is still less than or equal to storage pool size. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
