## 🛡️ Policy Deployment Engine: `netapp_volume_replication`

This section provides a concise policy evaluation for the `netapp_volume_replication` resource in GCP.

Reference: [Terraform Registry – netapp_volume_replication](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_volume_replication)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `replication_schedule` | Replication interval. | true | true | Controls RPO to meet policy (e.g., ≥ hourly). | EVERY_10_MINUTES | DAILY |
| `location` | Region of the replication resource (destination volume’s region). | true | true | Keeps replicas within approved regions. | australia-southeast2 | us-central1 |
| `volume_name` | The name of the existing source volume. | true | false | None | None | None |
| `name` | The name of the replication. Needs to be unique per location. | true | false | None | None | None |
| `labels` | Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }` **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `destination_volume_parameters` | Destination volume parameters. Structure is [documented below](#nested_destination_volume_parameters). | false | false | None | None | None |
| `description` | An description of this resource. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `delete_destination_volume` | under Terraform management unless you import it manually. If you delete the replication, this volume will remain. Setting this parameter to true will delete the *current* destination volume when destroying the replication. If you reversed the replication direction, this will be your former source volume! For production use, it is recommended to keep this parameter false to avoid accidental volume deletion. Handle with care. Default is false. | false | false | None | None | None |
| `replication_enabled` | and act independently from the source volume. Set to true to enable/resume the mirror. WARNING: Resuming a mirror overwrites any changes done to the destination volume with the content of the source volume. | false | false | None | None | None |
| `force_stopping` | currently receives an update and stopping the update might be undesirable. Set this parameter to true to stop anyway. All data transferred to the destination will be discarded and content of destination volume will remain at the state of the last successful update. Default is false. | false | false | None | None | None |
| `wait_for_mirror` | for mirror_state to reach MIRRORED. If you want Terraform to wait for the mirror to finish on create/stop/resume operations, set this parameter to true. Default is false. | false | false | None | None | None |
| `tiering_policy` |  | false | false | None | None | None |

### destination_volume_parameters Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `storage_pool` | Name of an existing storage pool for the destination volume with format: `projects/{{project}}/locations/{{location}}/storagePools/{{poolId}}` | true | false | None | None | None |
| `volume_id` | Name for the destination volume to be created. If not specified, the name of the source volume will be used. | false | false | None | None | None |
| `share_name` | Share name for destination volume. If not specified, name of source volume's share name will be used. | false | false | None | None | None |
| `description` | Description for the destination volume. | false | false | None | None | None |
| `tiering_policy` | Tiering policy for the volume. Structure is [documented below](#nested_destination_volume_parameters_tiering_policy). | false | false | None | None | None |

### tiering_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cooling_threshold_days` | Optional. Time in days to mark the volume's data block as cold and make it eligible for tiering, can be range from 2-183. Default is 31. | false | false | None | None | None |
| `tier_action` | Optional. Flag indicating if the volume has tiering policy enable/pause. Default is PAUSED. Default value is `PAUSED`. Possible values are: `ENABLED`, `PAUSED`. | false | false | None | None | None |
