## 🛡️ Policy Deployment Engine: `firebase_app_hosting_default_domain`

This section provides a concise policy evaluation for the `firebase_app_hosting_default_domain` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_default_domain](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_default_domain)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location of the Backend that this Domain is associated with | true | false | None | None | None |
| `backend` | The ID of the Backend that this Domain is associated with | true | false | None | None | None |
| `domain_id` | Id of the domain. For default domain, it should be {{backend}}--{{project_id}}.{{location}}.hosted.app | true | false | None | None | None |
| `disabled` | Whether the domain is disabled. Defaults to false. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
