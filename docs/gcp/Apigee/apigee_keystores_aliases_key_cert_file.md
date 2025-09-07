## 🛡️ Policy Deployment Engine: `apigee_keystores_aliases_key_cert_file`

This section provides a concise policy evaluation for the `apigee_keystores_aliases_key_cert_file` resource in GCP.

Reference: [Terraform Registry – apigee_keystores_aliases_key_cert_file](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_keystores_aliases_key_cert_file)

---

## 1. Argument Reference

### `org_id`
- Description: (Required) Organization ID associated with the alias, without organization/ prefix
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environment`
- Description: (Required) Environment associated with the alias
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `keystore`
- Description: (Required) Keystore Name
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `alias`
- Description: (Required) Alias Name
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cert`
- Description: (Required) Cert content - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) Private Key content, omit if uploading to truststore
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) Password for the Private Key if it's encrypted
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
