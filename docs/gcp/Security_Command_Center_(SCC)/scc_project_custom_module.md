## 🛡️ Policy Deployment Engine: `scc_project_custom_module`

This section provides a concise policy evaluation for the `scc_project_custom_module` resource in GCP.

Reference: [Terraform Registry – scc_project_custom_module](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_project_custom_module)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | The display name of the Security Health Analytics custom module. This display name becomes the finding category for all findings that are returned by this custom module. The display name must be between 1 and 128 characters, start with a lowercase letter, and contain alphanumeric characters or underscores only. | true | false | None | None | None |
| `enablement_state` | The enablement state of the custom module. Possible values are: `ENABLED`, `DISABLED`. | true | false | Project-level custom modules must be enabled to ensure effective monitoring and detection of misconfigurations at the project scope. | Enablement state is set to `ENABLED`. | Enablement state is set to `DISABLED`. |
| `custom_config` | The user specified custom configuration for the module. Structure is [documented below](#nested_custom_config). | true | false | This argument exists in the API but is not supported by current Terraform helpers. | N/A (Terraform unsupported). | N/A (Terraform unsupported). |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `predicate` |  | false | false | None | None | None |
| `custom_output` |  | false | false | None | None | None |
| `properties` |  | false | false | None | None | None |
| `value_expression` |  | false | false | None | None | None |
| `resource_selector` |  | false | false | None | None | None |
