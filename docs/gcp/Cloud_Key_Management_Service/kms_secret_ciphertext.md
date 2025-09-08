## 🛡️ Policy Deployment Engine: `kms_secret_ciphertext`

This section provides a concise policy evaluation for the `kms_secret_ciphertext` resource in GCP.

Reference: [Terraform Registry – kms_secret_ciphertext](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_secret_ciphertext)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `plaintext` | The plaintext to be encrypted. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |
| `crypto_key` | The full name of the CryptoKey that will be used to encrypt the provided plaintext. Format: `'projects/{{project}}/locations/{{location}}/keyRings/{{keyRing}}/cryptoKeys/{{cryptoKey}}'` | true | None | None |
| `additional_authenticated_data` | The additional authenticated data used for integrity checks during encryption and decryption. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
