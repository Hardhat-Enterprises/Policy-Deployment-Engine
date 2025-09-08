## 🛡️ Policy Deployment Engine: `network_connectivity_group`

This section provides a concise policy evaluation for the `network_connectivity_group` resource in GCP.

Reference: [Terraform Registry – network_connectivity_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the group. Group names must be unique. Possible values are: `default`, `center`, `edge`. | true | None | None |
| `hub` | The name of the hub. Hub names must be unique. They use the following form: projects/{projectNumber}/locations/global/hubs/{hubId} | true | None | None |
| `labels` | Optional labels in key:value format. For more information about labels, see [Requirements for labels](https://cloud.google.com/resource-manager/docs/creating-managing-labels#requirements). **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | An optional description of the group. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### auto_accept Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auto_accept_projects` | A list of project ids or project numbers for which you want to enable auto-accept. The auto-accept setting is applied to spokes being created or updated in these projects. | true | None | None |
