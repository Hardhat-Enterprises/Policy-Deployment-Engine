## 🛡️ Policy Deployment Engine: `bigquery_capacity_commitment`

This section provides a concise policy evaluation for the `bigquery_capacity_commitment` resource in GCP.

Reference: [Terraform Registry – bigquery_capacity_commitment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_capacity_commitment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `slot_count` | Number of slots in this commitment. | true | None | None |
| `plan` | Capacity commitment plan. Valid values are at https://cloud.google.com/bigquery/docs/reference/reservations/rpc/google.cloud.bigquery.reservation.v1#commitmentplan | true | None | None |
| `renewal_plan` | The plan this capacity commitment is converted to after commitmentEndTime passes. Once the plan is changed, committed period is extended according to commitment plan. Only applicable for some commitment plans. | false | None | None |
| `edition` | The edition type. Valid values are STANDARD, ENTERPRISE, ENTERPRISE_PLUS | false | None | None |
| `capacity_commitment_id` | The optional capacity commitment ID. Capacity commitment name will be generated automatically if this field is empty. This field must only contain lower case alphanumeric characters or dashes. The first and last character cannot be a dash. Max length is 64 characters. NOTE: this ID won't be kept if the capacity commitment is split or merged. | false | None | None |
| `location` | The geographic location where the transfer config should reside. Examples: US, EU, asia-northeast1. The default value is US. | false | None | None |
| `enforce_single_admin_project_per_org` | If true, fail the request if another project in the organization has a capacity commitment. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
