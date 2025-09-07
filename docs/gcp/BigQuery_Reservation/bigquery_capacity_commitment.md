## 🛡️ Policy Deployment Engine: `bigquery_capacity_commitment`

This section provides a concise policy evaluation for the `bigquery_capacity_commitment` resource in GCP.

Reference: [Terraform Registry – bigquery_capacity_commitment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_capacity_commitment)

---

## 1. Argument Reference

### `slot_count`
- Description: (Required) Number of slots in this commitment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `plan`
- Description: (Required) Capacity commitment plan. Valid values are at https://cloud.google.com/bigquery/docs/reference/reservations/rpc/google.cloud.bigquery.reservation.v1#commitmentplan
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `renewal_plan`
- Description: (Optional) The plan this capacity commitment is converted to after commitmentEndTime passes. Once the plan is changed, committed period is extended according to commitment plan. Only applicable for some commitment plans.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `edition`
- Description: (Optional) The edition type. Valid values are STANDARD, ENTERPRISE, ENTERPRISE_PLUS
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `capacity_commitment_id`
- Description: (Optional) The optional capacity commitment ID. Capacity commitment name will be generated automatically if this field is empty. This field must only contain lower case alphanumeric characters or dashes. The first and last character cannot be a dash. Max length is 64 characters. NOTE: this ID won't be kept if the capacity commitment is split or merged.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The geographic location where the transfer config should reside. Examples: US, EU, asia-northeast1. The default value is US.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforce_single_admin_project_per_org`
- Description: (Optional) If true, fail the request if another project in the organization has a capacity commitment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
