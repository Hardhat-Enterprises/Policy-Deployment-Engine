## 🛡️ Policy Deployment Engine: `google_project_service`

This section provides a concise policy evaluation for the `google_project_service` resource in GCP.

Reference: [Terraform Registry – google_project_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service)

---

## 1. Argument Reference

### `service`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_on_destroy`
- Description: Terraform resource is destroyed. If `false`, the service will be left enabled when the Terraform resource is destroyed. Defaults to `true`. Most configurations should set this to `false`; it should generally only be `true` or unset in configurations that manage the `google_project` resource itself.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_dependent_services`
- Description: and which depend on this service should also be disabled when this service is destroyed. If `false` or unset, an error will be returned if any enabled services depend on this service when attempting to destroy it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `check_if_service_has_usage_on_destroy`
- Description: [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html) If `true`, the usage of the service to be disabled will be checked and an error will be returned if the service to be disabled has usage in last 30 days. Defaults to `false`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
