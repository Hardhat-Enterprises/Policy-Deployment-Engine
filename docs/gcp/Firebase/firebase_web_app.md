## 🛡️ Policy Deployment Engine: `firebase_web_app`

This section provides a concise policy evaluation for the `firebase_web_app` resource in GCP.

Reference: [Terraform Registry – firebase_web_app](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_web_app)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The user-assigned display name of the App. | true | None | None |
| `api_key_id` | The globally unique, Google-assigned identifier (UID) for the Firebase API key associated with the WebApp. If apiKeyId is not set during creation, then Firebase automatically associates an apiKeyId with the WebApp. This auto-associated key may be an existing valid key or, if no valid key exists, a new one will be provisioned. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_policy` | rather than deleted upon `terraform destroy`. This is useful becaue the WebApp may be serving traffic. Set to `DELETE` to delete the WebApp. Default to `DELETE` | none | None | None |
