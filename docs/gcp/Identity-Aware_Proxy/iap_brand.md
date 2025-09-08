## 🛡️ Policy Deployment Engine: `iap_brand`

This section provides a concise policy evaluation for the `iap_brand` resource in GCP.

Reference: [Terraform Registry – iap_brand](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_brand)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `support_email` | Support email displayed on the OAuth consent screen. Can be either a user or group email. When a user email is specified, the caller must be the user with the associated email address. When a group email is specified, the caller can be either a user or a service account which is an owner of the specified group in Cloud Identity. | true | None | None |
| `application_title` | Application name displayed on OAuth consent screen. | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
