## 🛡️ Policy Deployment Engine: `google_project_service`

This section provides a concise policy evaluation for the `google_project_service` resource in GCP.

Reference: [Terraform Registry – google_project_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service` | The service to enable. | true | true | Enabling some APIs, like IAM, is necessary for safely managing access and credentials.  Security measures are weakened when essential APIs are missed. | service = "iam.googleapis.com" | service = "storage.googleapis.com" # IAM missing |
| `project` | The project ID. If not provided, the provider project is used. | false | false | Identifier only and does not directly affect security | None | None |
| `disable_on_destroy` | If true, disable the service when the Terraform resource is destroyed. If false or unset, the service will be left enabled when the Terraform resource is destroyed. It should generally only be true or unset in configurations that manage the google_project resource itself. | false | false | Only decides if the API is switched off when you delete the setup. It doesn't affect safety or access. | None | None |
| `disable_dependent_services` | If true, services that are enabled and which depend on this service should also be disabled when this service is destroyed. If false or unset, an error will be returned if any enabled services depend on this service when attempting to destroy it. | false | false | Only decides if other connected APIs also get switched off. It's about turning things off, not about security. | None | None |
| `check_if_service_has_usage_on_destroy` | [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html) If `true`, the usage of the service to be disabled will be checked and an error will be returned if the service to be disabled has usage in last 30 days. Defaults to `false`. | false | false | Optional safety check. Does not affect identity or permission security directly | None | None |
