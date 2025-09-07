## 🛡️ Policy Deployment Engine: `firebase_web_app`

This section provides a concise policy evaluation for the `firebase_web_app` resource in GCP.

Reference: [Terraform Registry – firebase_web_app](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_web_app)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The user-assigned display name of the App.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_key_id`
- Description: (Optional) The globally unique, Google-assigned identifier (UID) for the Firebase API key associated with the WebApp. If apiKeyId is not set during creation, then Firebase automatically associates an apiKeyId with the WebApp. This auto-associated key may be an existing valid key or, if no valid key exists, a new one will be provisioned.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: rather than deleted upon `terraform destroy`. This is useful becaue the WebApp may be serving traffic. Set to `DELETE` to delete the WebApp. Default to `DELETE`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
