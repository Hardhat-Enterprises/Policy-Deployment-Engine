## 🛡️ Policy Deployment Engine: `secret_manager_secret_version`

This section provides a concise policy evaluation for the `secret_manager_secret_version` resource in GCP.

Reference: [Terraform Registry – secret_manager_secret_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret` | Secret Manager secret resource | true | None | None |
| `enabled` | The current state of the SecretVersion. | false | None | None |
| `secret_data` | The secret data. Must be no larger than 64KiB. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `secret_data_wo_version` | Triggers update of secret data write-only. For more info see [updating write-only attributes](/docs/providers/google/guides/using_write_only_attributes.html#updating-write-only-attributes) | false | None | None |
| `deletion_policy` | to be abandoned rather than deleted. Setting `DISABLE` allows the resource to be disabled rather than deleted. Default is `DELETE`. Possible values are: * DELETE * DISABLE * ABANDON | none | None | None |
| `is_secret_data_base64` | ## Ephemeral Attributes Reference The following write-only attributes are supported: | none | None | None |
| `secret_data_wo` | The secret data. Must be no larger than 64KiB. For more info see [updating write-only attributes](/docs/providers/google/guides/using_write_only_attributes.html#updating-write-only-attributes) **Note**: This property is write-only and will not be read from the API. | false | None | None |

### payload Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_data_wo` | The secret data. Must be no larger than 64KiB. For more info see [updating write-only attributes](/docs/providers/google/guides/using_write_only_attributes.html#updating-write-only-attributes) **Note**: This property is write-only and will not be read from the API. | false | None | None |
