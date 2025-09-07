## 🛡️ Policy Deployment Engine: `bigtable_gc_policy`

This section provides a concise policy evaluation for the `bigtable_gc_policy` resource in GCP.

Reference: [Terraform Registry – bigtable_gc_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_gc_policy)

---

## 1. Argument Reference

### `table`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column_family`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_age`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_version`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gc_rules`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: Setting ABANDON allows the resource to be abandoned rather than deleted. This is useful for GC policy as it cannot be deleted in a replicated instance. Possible values are: `ABANDON`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_warnings`
- Description: Setting this to `true` allows relaxing the gc policy for replicated clusters by up to 90 days, but keep in mind this may increase how long clusters are inconsistent. Make sure you understand the risks listed at https://cloud.google.com/bigtable/docs/garbage-collection#increasing before setting this option. ----- `max_age` supports the following arguments:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `days`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `duration`
- Description: ----- `max_version` supports the following arguments:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `number`
- Description: ----- `gc_rules` include 2 fields: - `mode`: optional, either `intersection` or `union`. - `rules`: an array of GC policy rule, can be specified as JSON object: `{"max_age": "16h"}` or `{"max_version": 2}` - If `mode` is not specified, `rules` can only contains one GC policy. If `mode` is specified, `rules` must have at least 2 policies.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
