## 🛡️ Policy Deployment Engine: `kms_key_ring_import_job`

This section provides a concise policy evaluation for the `kms_key_ring_import_job` resource in GCP.

Reference: [Terraform Registry – kms_key_ring_import_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_key_ring_import_job)

---

## 1. Argument Reference

### `import_method`
- Description: (Required) The wrapping method to be used for incoming key material. Possible values are: `RSA_OAEP_3072_SHA1_AES_256`, `RSA_OAEP_4096_SHA1_AES_256`, `RSA_OAEP_3072_SHA256_AES_256`, `RSA_OAEP_4096_SHA256_AES_256`, `RSA_OAEP_3072_SHA256`, `RSA_OAEP_4096_SHA256`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `protection_level`
- Description: (Required) The protection level of the ImportJob. This must match the protectionLevel of the versionTemplate on the CryptoKey you attempt to import into. Possible values are: `SOFTWARE`, `HSM`, `EXTERNAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_ring`
- Description: (Required) The KeyRing that this import job belongs to. Format: `'projects/{{project}}/locations/{{location}}/keyRings/{{keyRing}}'`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `import_job_id`
- Description: (Required) It must be unique within a KeyRing and match the regular expression [a-zA-Z0-9_-]{1,63}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
