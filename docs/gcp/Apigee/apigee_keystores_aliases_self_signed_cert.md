## 🛡️ Policy Deployment Engine: `apigee_keystores_aliases_self_signed_cert`

This section provides a concise policy evaluation for the `apigee_keystores_aliases_self_signed_cert` resource in GCP.

Reference: [Terraform Registry – apigee_keystores_aliases_self_signed_cert](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_keystores_aliases_self_signed_cert)

---

## 1. Argument Reference

### `org_id`
- Description: (Required) The Apigee Organization name associated with the Apigee environment
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environment`
- Description: (Required) The Apigee environment name
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `keystore`
- Description: (Required) The Apigee keystore name associated in an Apigee environment
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `alias`
- Description: (Required) Alias for the key/certificate pair. Values must match the regular expression [\w\s-.]{1,255}. This must be provided for all formats except selfsignedcert; self-signed certs may specify the alias in either this parameter or the JSON body.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sig_alg`
- Description: (Required) Signature algorithm to generate private key. Valid values are SHA512withRSA, SHA384withRSA, and SHA256withRSA
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subject`
- Description: (Required) Subject details. Structure is [documented below](#nested_subject).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subject_alternative_dns_names`
- Description: (Optional) List of alternative host names. Maximum length is 255 characters for each value. Structure is [documented below](#nested_subject_alternative_dns_names).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_size`
- Description: (Optional) Key size. Default and maximum value is 2048 bits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cert_validity_in_days`
- Description: (Optional) Validity duration of certificate, in days. Accepts positive non-zero value. Defaults to 365. <a name="nested_subject"></a>The `subject` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `country_code`
- Description: (Optional) Two-letter country code. Example, IN for India, US for United States of America.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Optional) State or district name. Maximum length is 128 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locality`
- Description: (Optional) City or town name. Maximum length is 128 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org`
- Description: (Optional) Organization name. Maximum length is 64 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_unit`
- Description: (Optional) Organization team name. Maximum length is 64 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `common_name`
- Description: (Optional) Common name of the organization. Maximum length is 64 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Optional) Email address. Max 255 characters. <a name="nested_subject_alternative_dns_names"></a>The `subject_alternative_dns_names` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subject_alternative_name`
- Description: (Optional) Subject Alternative Name
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
