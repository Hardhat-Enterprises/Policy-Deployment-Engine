## 🛡️ Policy Deployment Engine: `compute_snapshot_settings`

This section provides a concise policy evaluation for the `compute_snapshot_settings` resource in GCP.

Reference: [Terraform Registry – compute_snapshot_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_snapshot_settings)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project` | If it is not provided, the provider project is used. | none | None | None |

### storage_location Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `policy` | The chosen location policy Possible values are: `NEAREST_MULTI_REGION`, `LOCAL_REGION`, `SPECIFIC_LOCATIONS`. | true | None | None |
| `locations` | When the policy is SPECIFIC_LOCATIONS, snapshots will be stored in the locations listed in this field. Keys are Cloud Storage bucket locations. Only one location can be specified. Structure is [documented below](#nested_storage_location_locations). | false | None | None |

### locations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` |  | none | None | None |
| `name` | Name of the location. It should be one of the Cloud Storage buckets. Only one location can be specified. (should match location) | true | None | None |
