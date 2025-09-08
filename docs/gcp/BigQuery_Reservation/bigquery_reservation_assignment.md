## 🛡️ Policy Deployment Engine: `bigquery_reservation_assignment`

This section provides a concise policy evaluation for the `bigquery_reservation_assignment` resource in GCP.

Reference: [Terraform Registry – bigquery_reservation_assignment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_reservation_assignment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `assignee` | The resource which will use the reservation. E.g. projects/myproject, folders/123, organizations/456. | true | None | None |
| `job_type` | Types of job, which could be specified when using the reservation. Possible values: JOB_TYPE_UNSPECIFIED, PIPELINE, QUERY, CONTINUOUS | true | None | None |
| `reservation` | The reservation for the resource | true | None | None |
| `location` | The location for the resource | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
