## 🛡️ Policy Deployment Engine: `apigee_keystores_aliases_pkcs12`

This section provides a concise policy evaluation for the `apigee_keystores_aliases_pkcs12` resource in GCP.

Reference: [Terraform Registry – apigee_keystores_aliases_pkcs12](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_keystores_aliases_pkcs12)

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

### `file`
- Description: (Required) PKCS12 file content - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) Password for the PKCS12 file if it's encrypted
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
