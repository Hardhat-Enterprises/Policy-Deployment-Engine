## 🛡️ Policy Deployment Engine: `compute_instance_settings`

This section provides a concise policy evaluation for the `compute_instance_settings` resource in GCP.

Reference: [Terraform Registry – compute_instance_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_settings)

---

## 1. Argument Reference

### `zone`
- Description: (Required) A reference to the zone where the machine resides.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) The metadata key/value pairs assigned to all the instances in the corresponding scope. Structure is [documented below](#nested_metadata).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_metadata"></a>The `metadata` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `items`
- Description: (Optional) A metadata key/value items map. The total size of all keys and values must be less than 512KB
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
