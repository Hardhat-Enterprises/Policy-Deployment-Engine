## 🛡️ Policy Deployment Engine: `kms_secret_ciphertext`

This section provides a concise policy evaluation for the `kms_secret_ciphertext` resource in GCP.

Reference: [Terraform Registry – kms_secret_ciphertext](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_secret_ciphertext)

---

## 1. Argument Reference

### `plaintext`
- Description: (Required) The plaintext to be encrypted. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `crypto_key`
- Description: (Required) The full name of the CryptoKey that will be used to encrypt the provided plaintext. Format: `'projects/{{project}}/locations/{{location}}/keyRings/{{keyRing}}/cryptoKeys/{{cryptoKey}}'`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_authenticated_data`
- Description: (Optional) The additional authenticated data used for integrity checks during encryption and decryption. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
