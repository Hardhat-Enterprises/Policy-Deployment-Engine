## 🛡️ Policy Deployment Engine: `billing_project_info`

This section provides a concise policy evaluation for the `billing_project_info` resource in GCP.

Reference: [Terraform Registry – billing_project_info](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_project_info)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `billing_account` | The ID of the billing account associated with the project, if any. Set to empty string to disable billing for the project. For example, `"012345-567890-ABCDEF"` or `""`. | true | true | Determines which billing account is linked to the project. This has security and governance impact because leaving empty or removing the billing account can affect project operation, resource availability, and administrative control over billing. | 000000-0000000-0000000-000000 | Empty or null |
| `project` |  The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | false | false | Identifies the project to which the billing information applies. This is used for correct resource targeting and does not itself enforce security controls. | None | None |
