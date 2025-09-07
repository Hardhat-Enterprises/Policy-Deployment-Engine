## 🛡️ Policy Deployment Engine: `iap_brand`

This section provides a concise policy evaluation for the `iap_brand` resource in GCP.

Reference: [Terraform Registry – iap_brand](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_brand)

---

## 1. Argument Reference

### `support_email`
- Description: (Required) Support email displayed on the OAuth consent screen. Can be either a user or group email. When a user email is specified, the caller must be the user with the associated email address. When a group email is specified, the caller can be either a user or a service account which is an owner of the specified group in Cloud Identity.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `application_title`
- Description: (Required) Application name displayed on OAuth consent screen.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
