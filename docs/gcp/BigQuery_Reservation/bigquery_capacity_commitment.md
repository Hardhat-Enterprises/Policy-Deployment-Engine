## 🛡️ Policy Deployment Engine: `bigquery_capacity_commitment`

This section provides a concise policy evaluation for the `bigquery_capacity_commitment` resource in GCP.

Reference: [Terraform Registry – bigquery_capacity_commitment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_capacity_commitment)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `slot_count` | Number of slots in this commitment. | true | false | None | None | None |
| `plan` | Capacity commitment plan. | true | false | None | None | None |
| `renewal_plan` | The plan this capacity commitment is converted to after the commitment end time passes. | false | false | None | None | None |
| `edition` | The edition type. Valid values are STANDARD, ENTERPRISE, ENTERPRISE_PLUS. | false | false | None | None | None |
| `capacity_commitment_id` | Optional capacity commitment ID. If not set, the name will be generated automatically. | false | false | None | None | None |
| `location` | The geographic location where the capacity commitment should reside (for example: US, EU, asia-northeast1). | false | true | Location must be restricted to approved regions to support data residency and compliance requirements. | US | us-west2 |
| `enforce_single_admin_project_per_org` | If true, fail the request if another project in the organization has a capacity commitment. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
