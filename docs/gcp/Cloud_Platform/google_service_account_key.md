## 🛡️ Policy Deployment Engine: `google_service_account_key`

This section provides a concise policy evaluation for the `google_service_account_key` resource in GCP.

Reference: [Terraform Registry – google_service_account_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_key)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_account_id` | The service account ID for the key. Can be in the form {ACCOUNT} or projects/{PROJECT_ID}/serviceAccounts/{ACCOUNT}. | true | false | This only identifies which service account the key belongs to. It does not affect the security of the key itself. | None | None |
| `key_algorithm` |  The algorithm used to generate the key. KEY_ALG_RSA_2048 is the default algorithm. Valid values are listed at ServiceAccountPrivateKeyType (only used on create) | false | true | Weak algorithms (like RSA_1024) reduce cryptographic strength. RSA_2048 is the minimum secure standard. | key_algorithm = "KEY_ALG_RSA_2048" | key_algorithm = "KEY_ALG_RSA_1024" |
| `public_key_type` | The format of the public key. Defaults to TYPE_X509_PEM_FILE. | false | false | Output format only. Does not affect the strength or safety of the key. | public_key_type = "TYPE_X509_PEM_FILE" | None |
| `private_key_type` | The format of the private key. Defaults to TYPE_GOOGLE_CREDENTIALS_FILE. | false | true | Exporting private keys in files increases risk of leaks. Safer to avoid or use workload identity. | private_key_type = null | private_key_type = "TYPE_GOOGLE_CREDENTIALS_FILE" |
| `public_key_data` | Public key data to create a service account key for given service account. The expected format for this field is a base64 encoded X509_PEM and it conflicts with public_key_type and private_key_type | false | false | Provides only the public key, which is not sensitive. No security risk. | public_key_data set with base64 public key | None |
| `keepers` | Arbitrary map of values that, when changed, will trigger a new key to be generated. | false | true | Without rotation, old keys might remain active too long, increasing risk of vulnerability. | keepers = { rotation_time = time_rotating.mykey_rotation.rotation_rfc3339 } | keepers = null |
