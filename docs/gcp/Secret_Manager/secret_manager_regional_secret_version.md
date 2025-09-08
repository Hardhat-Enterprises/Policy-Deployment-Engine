## 🛡️ Policy Deployment Engine: `secret_manager_regional_secret_version`

This section provides a concise policy evaluation for the `secret_manager_regional_secret_version` resource in GCP.

Reference: [Terraform Registry – secret_manager_regional_secret_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_regional_secret_version)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_data` | The secret data. Must be no larger than 64KiB. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |
| `secret` | Secret Manager regional secret resource. | true | None | None |
| `enabled` | The current state of the regional secret version. | false | None | None |
| `deletion_policy` | to be abandoned rather than deleted. Setting `DISABLE` allows the resource to be disabled rather than deleted. Default is `DELETE`. Possible values are: * DELETE * DISABLE * ABANDON | none | None | None |
| `is_secret_data_base64` |  | none | None | None |
