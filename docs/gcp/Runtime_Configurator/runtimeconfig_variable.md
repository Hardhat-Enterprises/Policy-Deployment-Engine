## 🛡️ Policy Deployment Engine: `runtimeconfig_variable`

This section provides a concise policy evaluation for the `runtimeconfig_variable` resource in GCP.

Reference: [Terraform Registry – runtimeconfig_variable](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/runtimeconfig_variable)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | names can be hierarchical using slashes (e.g. "prod-variables/hostname"). | none | None | None |
| `parent` | variable. * `text` or `value` - (Required) The content to associate with the variable. Exactly one of `text` or `variable` must be specified. If `text` is specified, it must be a valid UTF-8 string and less than 4096 bytes in length. If `value` is specified, it must be base64 encoded and less than 4096 bytes in length. - - - | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
