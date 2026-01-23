## 🛡️ Policy Deployment Engine: `bigquery_reservation_assignment`

This section provides a concise policy evaluation for the `bigquery_reservation_assignment` resource in GCP.

Reference: [Terraform Registry – bigquery_reservation_assignment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_reservation_assignment)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `assignee` | The resource which will use the reservation (e.g. projects/myproject, folders/123, organizations/456). | true | false | None | None | None |
| `job_type` | Types of job which can be specified when using the reservation. Policy restricts this to approved values. | true | true | Restricting job_type to approved values helps enforce consistent reservation usage for controlled workloads. | QUERY | CONTINUOUS |
| `reservation` | The reservation that the resource is assigned to. | true | false | None | None | None |
| `location` | The geographic location of the reservation assignment. Policy restricts this to approved locations. | false | true | Location must be restricted to approved regions to support data residency and compliance requirements. | us-central1 | us-west2 |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
