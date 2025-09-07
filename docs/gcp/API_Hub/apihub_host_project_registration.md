## 🛡️ Policy Deployment Engine: `apihub_host_project_registration`

This section provides a concise policy evaluation for the `apihub_host_project_registration` resource in GCP.

Reference: [Terraform Registry – apihub_host_project_registration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apihub_host_project_registration)

---

## 1. Argument Reference

### `gcp_project`
- Description: (Required) Required. Immutable. Google cloud project name in the format: "projects/abc" or "projects/123". As input, project name with either project id or number are accepted. As output, this field will contain project number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Part of `parent`. See documentation of `projectsId`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_project_registration_id`
- Description: (Required) Required. The ID to use for the Host Project Registration, which will become the final component of the host project registration's resource name. The ID must be the same as the Google cloud project specified in the host_project_registration.gcp_project field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
