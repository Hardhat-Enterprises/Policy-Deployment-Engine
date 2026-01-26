## 🛡️ Policy Deployment Engine: `bigquery_reservation_assignment`

This section provides a concise policy evaluation for the `bigquery_reservation_assignment` resource in GCP.

Reference: [Terraform Registry – bigquery_reservation_assignment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_reservation_assignment)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `assignee` | The resource that will use the reservation (for example: projects/myproject, folders/123, organizations/456). | true | false | This only defines what resource is linked to the reservation. It does not change permissions or access control by itself. | projects/pde-dummy-project | None |
| `job_type` | The type of job that is allowed to use this reservation. | true | true | Job type must be restricted to approved values so the reservation is only used for allowed workloads. | QUERY | CONTINUOUS |
| `reservation` | The reservation that the assignee will be linked to. | true | false | This is just the link to the reservation name and does not change security settings like IAM or encryption. | projects/pde-dummy-project/locations/us-central1/reservations/example-reservation | None |
| `location` | The location/region for the reservation assignment. | false | true | Location must be set to an approved region to meet compliance and data residency requirements. | us-central1 | us-west2 |
| `project` | If not provided, the provider project is used. | false | false | This only tells Terraform what project to use and does not automatically affect security settings on its own. | pde-dummy-project | None |
