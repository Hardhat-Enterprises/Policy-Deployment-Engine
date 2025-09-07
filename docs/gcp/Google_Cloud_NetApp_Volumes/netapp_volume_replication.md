## 🛡️ Policy Deployment Engine: `netapp_volume_replication`

This section provides a concise policy evaluation for the `netapp_volume_replication` resource in GCP.

Reference: [Terraform Registry – netapp_volume_replication](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_volume_replication)

---

## 1. Argument Reference

### `replication_schedule`
- Description: (Required) Specifies the replication interval. Possible values are: `EVERY_10_MINUTES`, `HOURLY`, `DAILY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Name of region for this resource. The resource needs to be created in the region of the destination volume.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volume_name`
- Description: (Required) The name of the existing source volume.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the replication. Needs to be unique per location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }` **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_volume_parameters`
- Description: (Optional) Destination volume parameters. Structure is [documented below](#nested_destination_volume_parameters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_destination_volume`
- Description: under Terraform management unless you import it manually. If you delete the replication, this volume will remain. Setting this parameter to true will delete the *current* destination volume when destroying the replication. If you reversed the replication direction, this will be your former source volume! For production use, it is recommended to keep this parameter false to avoid accidental volume deletion. Handle with care. Default is false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replication_enabled`
- Description: and act independently from the source volume. Set to true to enable/resume the mirror. WARNING: Resuming a mirror overwrites any changes done to the destination volume with the content of the source volume.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_stopping`
- Description: currently receives an update and stopping the update might be undesirable. Set this parameter to true to stop anyway. All data transferred to the destination will be discarded and content of destination volume will remain at the state of the last successful update. Default is false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `wait_for_mirror`
- Description: for mirror_state to reach MIRRORED. If you want Terraform to wait for the mirror to finish on create/stop/resume operations, set this parameter to true. Default is false. <a name="nested_destination_volume_parameters"></a>The `destination_volume_parameters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_pool`
- Description: (Required) Name of an existing storage pool for the destination volume with format: `projects/{{project}}/locations/{{location}}/storagePools/{{poolId}}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volume_id`
- Description: (Optional) Name for the destination volume to be created. If not specified, the name of the source volume will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `share_name`
- Description: (Optional) Share name for destination volume. If not specified, name of source volume's share name will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description for the destination volume.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tiering_policy`
- Description: (Optional) Tiering policy for the volume. Structure is [documented below](#nested_destination_volume_parameters_tiering_policy). <a name="nested_destination_volume_parameters_tiering_policy"></a>The `tiering_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cooling_threshold_days`
- Description: (Optional) Optional. Time in days to mark the volume's data block as cold and make it eligible for tiering, can be range from 2-183. Default is 31.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tier_action`
- Description: (Optional) Optional. Flag indicating if the volume has tiering policy enable/pause. Default is PAUSED. Default value is `PAUSED`. Possible values are: `ENABLED`, `PAUSED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
