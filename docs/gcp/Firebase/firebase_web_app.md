## 🛡️ Policy Deployment Engine: `firebase_web_app`

This section provides a concise policy evaluation for the `firebase_web_app` resource in GCP.

Reference: [Terraform Registry – firebase_web_app](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_web_app)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | The user-assigned display name of the App. | true | false | The display name is only a user-friendly label to help identify the web application. It does not affect authentication, access control, or security posture. | None | None |
| `api_key_id` | The globally unique, Google-assigned identifier (UID) for the Firebase API key associated with the WebApp. If apiKeyId is not set during creation, then Firebase automatically associates an apiKeyId with the WebApp. This auto-associated key may be an existing valid key or, if no valid key exists, a new one will be provisioned. | false | false | The api_key_id is an identifier referencing the API key, not the secret key itself. Since no sensitive values are exposed, it does not directly impact the security of the application. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | The 'project' field links the web app to a specific Firebase/Google Cloud project. Security is managed through project-level IAM policies, not this attribute, so it has no direct security impact. | None | None |
| `deletion_policy` | rather than deleted upon `terraform destroy`. This is useful becaue the WebApp may be serving traffic. Set to `DELETE` to delete the WebApp. Default to `DELETE` | false | true | If 'deletion_policy' is set to 'ABANDON', the WebApp and its associated metadata may persist even after infrastructure teardown. This can lead to orphaned resources, residual data exposure, or compliance violations. To enforce proper lifecycle management, 'deletion_policy' should be set to 'DELETE'. | DELETE | ABANDON |
