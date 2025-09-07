## 🛡️ Policy Deployment Engine: `compute_region_resize_request`

This section provides a concise policy evaluation for the `compute_region_resize_request` resource in GCP.

Reference: [Terraform Registry – compute_region_resize_request](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_resize_request)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of this resize request. The name must be 1-63 characters long, and comply with RFC1035.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resize_by`
- Description: (Required) The number of instances to be created by this resize request. The group's target size will be increased by this number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_group_manager`
- Description: (Required) The reference of the regional instance group manager this ResizeRequest is a part of.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resize-request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `requested_run_duration`
- Description: (Optional) Requested run duration for instances that will be created by this request. At the end of the run duration instances will be deleted. Structure is [documented below](#nested_requested_run_duration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The reference of the compute region scoping this request. If it is not provided, the provider region is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_requested_run_duration"></a>The `requested_run_duration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 600 to 604800 inclusive. Note: minimum and maximum allowed range for requestedRunDuration is 10 minutes (600 seconds) and 7 days(604800 seconds) correspondingly.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
