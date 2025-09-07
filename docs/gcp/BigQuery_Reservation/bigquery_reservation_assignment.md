## 🛡️ Policy Deployment Engine: `bigquery_reservation_assignment`

This section provides a concise policy evaluation for the `bigquery_reservation_assignment` resource in GCP.

Reference: [Terraform Registry – bigquery_reservation_assignment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_reservation_assignment)

---

## 1. Argument Reference

### `assignee`
- Description: (Required) The resource which will use the reservation. E.g. projects/myproject, folders/123, organizations/456.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `job_type`
- Description: (Required) Types of job, which could be specified when using the reservation. Possible values: JOB_TYPE_UNSPECIFIED, PIPELINE, QUERY, CONTINUOUS
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reservation`
- Description: (Required) The reservation for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
