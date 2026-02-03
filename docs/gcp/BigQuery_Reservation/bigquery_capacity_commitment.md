## 🛡️ Policy Deployment Engine: `bigquery_capacity_commitment`

This section provides a concise policy evaluation for the `bigquery_capacity_commitment` resource in GCP.

Reference: [Terraform Registry – bigquery_capacity_commitment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_capacity_commitment)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `slot_count` | Number of slots in this commitment. | true | false | This mainly controls performance/capacity and does not change access control, permissions, or encryption settings. | 100 | 0 |
| `plan` | Capacity commitment plan. | true | false | This decides the commitment plan type but it does not directly affect security settings like IAM or data protection. | FLEX_FLAT_RATE | INVALID_PLAN |
| `renewal_plan` | The plan this capacity commitment is converted to after the commitment end time passes. | false | false | This is only related to billing/plan rollover and does not change access permissions or security controls. | FLEX_FLAT_RATE | None |
| `edition` | The edition type. Valid values are STANDARD, ENTERPRISE, ENTERPRISE_PLUS. | false | false | This controls the product edition level but does not directly change security settings such as encryption or access. | ENTERPRISE | STANDARD |
| `capacity_commitment_id` | Optional capacity commitment ID. If not set, the name will be generated automatically. | false | false | This is just a naming/identifier field and does not impact security or access to the resource. | c-commitment | -bad-id- |
| `location` | The geographic location where the capacity commitment should reside (for example: US, EU, asia-northeast1). | false | true | Location must be restricted to approved regions to support data residency and compliance requirements. | US | us-west2 |
| `enforce_single_admin_project_per_org` | If true, fail the request if another project in the organization has a capacity commitment. | false | false | This is more of an organisation/admin control to avoid conflicts, but it does not directly change access control or security settings. | true | false |
| `project` | If it is not provided, the provider project is used. | false | false | This only tells Terraform what project to use and does not automatically change security settings by itself. | pde-dummy-project | None |
