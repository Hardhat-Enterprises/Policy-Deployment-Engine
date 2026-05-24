## 🛡️ Policy Deployment Engine: `iam_workforce_pool_provider_key - WILL NOT BE COMPLETED IN ONE TRIMESTER`

This section provides a concise policy evaluation for the `iam_workforce_pool_provider_key - WILL NOT BE COMPLETED IN ONE TRIMESTER` resource in GCP.

Reference: [Terraform Registry – iam_workforce_pool_provider_key - WILL NOT BE COMPLETED IN ONE TRIMESTER](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workforce_pool_provider_key - WILL NOT BE COMPLETED IN ONE TRIMESTER)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key_data` | Immutable. Public half of the asymmetric key. Structure is [documented below](#nested_key_data). | true | false | None | None | None |
| `use` | The purpose of the key. Possible values are: `ENCRYPTION`. | true | false | None | None | None |
| `location` | The location for the resource. | true | false | None | None | None |
| `workforce_pool_id` | The ID of the workforce pool. | true | false | None | None | None |
| `provider_id` | The ID of the provider. | true | false | None | None | None |
| `key_id` | The ID to use for the key, which becomes the final component of the resource name. This value must be 4-32 characters, and may contain the characters [a-z0-9-]. | true | false | None | None | None |

### key_data Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `format` | (Output) The format of the key. | false | false | None | None | None |
| `not_before_time` | (Output) Earliest timestamp when this key is valid. Attempts to use this key before this time will fail. Only present if the key data represents a X.509 certificate. Uses RFC 3339, where generated output will always be Z-normalized and uses 0, 3, 6 or 9 fractional digits. Offsets other than "Z" are also accepted. Examples: "2014-10-02T15:01:23Z", "2014-10-02T15:01:23.045123456Z" or "2014-10-02T15:01:23+05:30". | false | false | None | None | None |
| `not_after_time` | (Output) Latest timestamp when this key is valid. Attempts to use this key after this time will fail. Only present if the key data represents a X.509 certificate. Uses RFC 3339, where generated output will always be Z-normalized and uses 0, 3, 6 or 9 fractional digits. Offsets other than "Z" are also accepted. Examples: "2014-10-02T15:01:23Z", "2014-10-02T15:01:23.045123456Z" or "2014-10-02T15:01:23+05:30". | false | false | None | None | None |
| `key` | (Output) The key data. The format of the key is represented by the format field. | false | false | None | None | None |
| `key_spec` | The specifications for the key. Possible values are: `RSA_2048`, `RSA_3072`, `RSA_4096`. | true | false | None | None | None |
