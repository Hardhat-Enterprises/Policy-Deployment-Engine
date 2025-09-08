## 🛡️ Policy Deployment Engine: `scc_v2_organization_mute_config`

This section provides a concise policy evaluation for the `scc_v2_organization_mute_config` resource in GCP.

Reference: [Terraform Registry – scc_v2_organization_mute_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_v2_organization_mute_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `filter` | An expression that defines the filter to apply across create/update events of findings. While creating a filter string, be mindful of the scope in which the mute configuration is being created. E.g., If a filter contains project = X but is created under the project = Y scope, it might not match any findings. | true | None | None |
| `type` | The type of the mute config. | true | None | None |
| `organization` | The organization whose Cloud Security Command Center the Mute Config lives in. | true | None | None |
| `mute_config_id` | Unique identifier provided by the client within the parent scope. | true | None | None |
| `description` | A description of the mute config. | false | None | None |
| `location` | location Id is provided by organization. If not provided, Use global as default. | false | None | None |
