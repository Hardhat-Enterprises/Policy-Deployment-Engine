## 🛡️ Policy Deployment Engine: `firebase_app_hosting_default_domain`

This section provides a concise policy evaluation for the `firebase_app_hosting_default_domain` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_default_domain](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_default_domain)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location of the Backend that this Domain is associated with | true | false | Location inherits from backend configuration and has no independent security policy. | australia-southeast2-a | us-east1 |
| `backend` | The ID of the Backend that this Domain is associated with | true | false | Backend ID is a reference with no direct security implications. | c | nc |
| `domain_id` | Id of the domain. For default domain, it should be {{backend}}--{{project_id}}.{{location}}.hosted.app | true | false | Default domain ID follows a standard format with no specific security policy. | backend--project-id.australia-southeast2-a.hosted.app | invalid-domain-id |
| `disabled` | Whether the domain is disabled. Defaults to false. | false | false | Domain enable/disable flag has no specific security policy. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Project specification uses default provider project when not specified. | None | None |
