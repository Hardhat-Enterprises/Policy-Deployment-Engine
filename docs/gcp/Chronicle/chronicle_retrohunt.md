## 🛡️ Policy Deployment Engine: `chronicle_retrohunt`

This section provides a concise policy evaluation for the `chronicle_retrohunt` resource in GCP.

Reference: [Terraform Registry – chronicle_retrohunt](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_retrohunt)

---

## 1. Argument Reference

### `process_interval`
- Description: (Required) Represents a time interval, encoded as a Timestamp start (inclusive) and a Timestamp end (exclusive). The start must be less than or equal to the end. When the start equals the end, the interval is empty (matches no time). When both start and end are unspecified, the interval matches any time. Structure is [documented below](#nested_process_interval).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Required) The unique identifier for the Chronicle instance, which is the same as the customer ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rule`
- Description: (Required) The Rule ID of the rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retrohunt`
- Description: (Optional) The retrohunt ID of the Retrohunt. A retrohunt is an execution of a Rule over a time range in the past.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_process_interval"></a>The `process_interval` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Required) Inclusive start of the interval.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_time`
- Description: (Required) Exclusive end of the interval.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
