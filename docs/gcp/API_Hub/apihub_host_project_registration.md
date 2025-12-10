## 🛡️ Policy Deployment Engine: `apihub_host_project_registration`

This section provides a concise policy evaluation for the `apihub_host_project_registration` resource in GCP.

Reference: [Terraform Registry – apihub_host_project_registration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apihub_host_project_registration)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `gcp_project` | Required. Immutable. Google cloud project name in the format: "projects/abc" or "projects/123". As input, project name with either project id or number are accepted. As output, this field will contain project number. | true | false | None | None | None |
| `location` | Part of `parent`. See documentation of `projectsId`. | true | true | Location controls regional compliance and data residency. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1', 'europe-west1'] |
| `host_project_registration_id` | Required. The ID to use for the Host Project Registration, which will become the final component of the host project registration's resource name. The ID must be the same as the Google cloud project specified in the host_project_registration.gcp_project field. | true | false | Identifier only. | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | Required for PDE to operate properly with terraform file gen | ['PDE'] | ['Anything else'] |
