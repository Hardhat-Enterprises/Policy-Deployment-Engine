## 🛡️ Policy Deployment Engine: `kms_key_ring_import_job`

This section provides a concise policy evaluation for the `kms_key_ring_import_job` resource in GCP.

Reference: [Terraform Registry – kms_key_ring_import_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_key_ring_import_job)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `import_method` | The wrapping method to be used for incoming key material. Possible values are: `RSA_OAEP_3072_SHA1_AES_256`, `RSA_OAEP_4096_SHA1_AES_256`, `RSA_OAEP_3072_SHA256_AES_256`, `RSA_OAEP_4096_SHA256_AES_256`, `RSA_OAEP_3072_SHA256`, `RSA_OAEP_4096_SHA256`. | true | None | None |
| `protection_level` | The protection level of the ImportJob. This must match the protectionLevel of the versionTemplate on the CryptoKey you attempt to import into. Possible values are: `SOFTWARE`, `HSM`, `EXTERNAL`. | true | None | None |
| `key_ring` | The KeyRing that this import job belongs to. Format: `'projects/{{project}}/locations/{{location}}/keyRings/{{keyRing}}'`. | true | None | None |
| `import_job_id` | It must be unique within a KeyRing and match the regular expression [a-zA-Z0-9_-]{1,63} | true | None | None |
