## 🛡️ Policy Deployment Engine: `colab_runtime`

This section provides a concise policy evaluation for the `colab_runtime` resource in GCP.

Reference: [Terraform Registry – colab_runtime](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/colab_runtime)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `runtime_user` | The user email of the NotebookRuntime. | true | None | None |
| `display_name` | Required. The display name of the Runtime. | true | None | None |
| `location` | The location for the resource: https://cloud.google.com/colab/docs/locations | true | None | None |
| `description` | The description of the Runtime. | false | None | None |
| `name` | The resource name of the Runtime | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `desired_state` |  | none | None | None |
| `auto_upgrade` |  | none | None | None |

### notebook_runtime_template_ref Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `notebook_runtime_template` | The resource name of the NotebookRuntimeTemplate based on which a NotebookRuntime will be created. | true | None | None |
