## 🛡️ Policy Deployment Engine: `compute_snapshot_settings`

This section provides a concise policy evaluation for the `compute_snapshot_settings` resource in GCP.

Reference: [Terraform Registry – compute_snapshot_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_snapshot_settings)

---

## 1. Argument Reference

### `storage_location`
- Description: (Required) Policy of which storage location is going to be resolved, and additional data that particularizes how the policy is going to be carried out Structure is [documented below](#nested_storage_location).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_storage_location"></a>The `storage_location` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy`
- Description: (Required) The chosen location policy Possible values are: `NEAREST_MULTI_REGION`, `LOCAL_REGION`, `SPECIFIC_LOCATIONS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locations`
- Description: (Optional) When the policy is SPECIFIC_LOCATIONS, snapshots will be stored in the locations listed in this field. Keys are Cloud Storage bucket locations. Only one location can be specified. Structure is [documented below](#nested_storage_location_locations). <a name="nested_storage_location_locations"></a>The `locations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the location. It should be one of the Cloud Storage buckets. Only one location can be specified. (should match location)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
