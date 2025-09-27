## 🛡️ Policy Deployment Engine: `google_firebase_android_app`

This section provides a concise policy evaluation for the `google_firebase_android_app` resource in GCP.

Reference: [Terraform Registry – google_firebase_android_app](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_firebase_android_app)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `sha1_hashes` | Firebase Android App should have at least one SHA-1 or SHA-256 certificate hash defined for security. | false | true | SHA hashes are used to verify the authenticity of your app, preventing unauthorized clients from accessing your Firebase resources. At least one of `sha1_hashes` or `sha256_hashes` must be configured. | ["...] | [] |
| `sha256_hashes` | Firebase Android App should have at least one SHA-1 or SHA-256 certificate hash defined for security. | false | true | SHA hashes are used to verify the authenticity of your app, preventing unauthorized clients from accessing your Firebase resources. At least one of `sha1_hashes` or `sha256_hashes` must be configured. | ["A1:B2:C3:D4:E5:F6:A1:B2:C3:D4:E5:F6:A1:B2:C3:D4:E5:F6:A1:B2"] | [] |
