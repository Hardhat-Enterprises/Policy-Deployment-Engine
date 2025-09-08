## 🛡️ Policy Deployment Engine: `notebooks_environment`

This section provides a concise policy evaluation for the `notebooks_environment` resource in GCP.

Reference: [Terraform Registry – notebooks_environment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/notebooks_environment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name specified for the Environment instance. Format: projects/{project_id}/locations/{location}/environments/{environmentId} | true | None | None |
| `location` | A reference to the zone where the machine resides. | true | None | None |
| `display_name` | Display name of this environment for the UI. | false | None | None |
| `description` | A brief description of this environment. | false | None | None |
| `post_startup_script` | Path to a Bash script that automatically runs after a notebook instance fully boots up. The path must be a URL or Cloud Storage path. Example: "gs://path-to-file/file-name" | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### vm_image Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project` | The name of the Google Cloud project that this VM image belongs to. Format: projects/{project_id} | true | None | None |
| `image_name` | Use VM image name to find the image. | false | None | None |
| `image_family` | Use this VM image family to find the image; the newest image in this family will be used. | false | None | None |

### container_image Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `repository` | The path to the container image repository. For example: gcr.io/{project_id}/{imageName} | true | None | None |
| `tag` | The tag of the container image. If not specified, this defaults to the latest tag. | false | None | None |
