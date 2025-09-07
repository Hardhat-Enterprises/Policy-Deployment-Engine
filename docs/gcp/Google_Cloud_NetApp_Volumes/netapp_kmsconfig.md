## 🛡️ Policy Deployment Engine: `netapp_kmsconfig`

This section provides a concise policy evaluation for the `netapp_kmsconfig` resource in GCP.

Reference: [Terraform Registry – netapp_kmsconfig](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_kmsconfig)

---

## 1. Argument Reference

### `crypto_key_name`
- Description: (Required) Resource name of the KMS key to use. Only regional keys are supported. Format: `projects/{{project}}/locations/{{location}}/keyRings/{{key_ring}}/cryptoKeys/{{key}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Name of the policy location. CMEK policies apply to the whole region.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the CMEK policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description for the CMEK policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
