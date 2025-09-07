## 🛡️ Policy Deployment Engine: `bigquery_bi_reservation`

This section provides a concise policy evaluation for the `bigquery_bi_reservation` resource in GCP.

Reference: [Terraform Registry – bigquery_bi_reservation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_bi_reservation)

---

## 1. Argument Reference

### `location`
- Description: (Required) LOCATION_DESCRIPTION
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `size`
- Description: (Optional) Size of a reservation, in bytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preferred_tables`
- Description: (Optional) Preferred tables to use BI capacity for. Structure is [documented below](#nested_preferred_tables).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_preferred_tables"></a>The `preferred_tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) The assigned project ID of the project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Optional) The ID of the dataset in the above project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Optional) The ID of the table in the above dataset.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
