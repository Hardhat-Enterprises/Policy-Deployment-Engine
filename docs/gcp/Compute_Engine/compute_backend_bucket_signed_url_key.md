## 🛡️ Policy Deployment Engine: `compute_backend_bucket_signed_url_key`

This section provides a concise policy evaluation for the `compute_backend_bucket_signed_url_key` resource in GCP.

Reference: [Terraform Registry – compute_backend_bucket_signed_url_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_bucket_signed_url_key)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the signed URL key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_value`
- Description: (Required) 128-bit key value used for signing the URL. The key value must be a valid RFC 4648 Section 5 base64url encoded string. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend_bucket`
- Description: (Required) The backend bucket this signed URL key belongs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
