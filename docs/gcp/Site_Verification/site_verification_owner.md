## 🛡️ Policy Deployment Engine: `site_verification_owner`

This section provides a concise policy evaluation for the `site_verification_owner` resource in GCP.

Reference: [Terraform Registry – site_verification_owner](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/site_verification_owner)

---

## 1. Argument Reference

### `web_resource_id`
- Description: (Required) The id of of the web resource to which the owner will be added, in the form `webResource/<resource_id>`, such as `webResource/https://www.example.com/`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Required) The email of the user to be added as an owner. - - - ## Timeouts This resource provides the following [Timeouts](https://developer.hashicorp.com/terraform/plugin/sdkv2/resources/retries-and-customizable-timeouts) configuration options: - `create` - Default is 20 minutes. - `delete` - Default is 20 minutes. ## Import Owner can be imported using this format:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
