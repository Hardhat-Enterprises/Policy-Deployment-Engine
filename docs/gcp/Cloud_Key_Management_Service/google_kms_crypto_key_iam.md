## 🛡️ Policy Deployment Engine: `google_kms_crypto_key_iam`

This section provides a concise policy evaluation for the `google_kms_crypto_key_iam` resource in GCP.

Reference: [Terraform Registry – google_kms_crypto_key_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_kms_crypto_key_iam)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `crypto_key_id` | `{project_id}/{location_name}/{key_ring_name}/{crypto_key_name}` or `{location_name}/{key_ring_name}/{crypto_key_name}`. In the second form, the provider's project setting will be used as a fallback. | none | None | None |
| `member/members` | Each entry can have one of the following values: * **allUsers**: A special identifier that represents anyone who is on the internet; with or without a Google account. * **allAuthenticatedUsers**: A special identifier that represents anyone who is authenticated with a Google account or a service account. * **user:{emailid}**: An email address that represents a specific Google account. For example, jane@example.com or joe@example.com. * **serviceAccount:{emailid}**: An email address that represents a service account. For example, my-other-app@appspot.gserviceaccount.com. * **group:{emailid}**: An email address that represents a Google group. For example, admins@example.com. * **domain:{domain}**: A G Suite domain (primary, instead of alias) name that represents all the users of that domain. For example, google.com or example.com. | none | None | None |
| `role` | `[projects|organizations]/{parent-name}/roles/{role-name}`. | none | None | None |
| `policy_data` | a `google_iam_policy` data source. | none | None | None |

### condition Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expression` |  | none | None | None |
| `title` |  | none | None | None |
| `description` | ~> **Warning:** Terraform considers the `role` and condition contents (`title`+`description`+`expression`) as the identifier for the binding. This means that if any part of the condition is changed out-of-band, Terraform will consider it to be an entirely different resource and will treat it as such. | none | None | None |
