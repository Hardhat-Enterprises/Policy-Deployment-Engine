## 🛡️ Policy Deployment Engine: `firebase_app_hosting_build`

This section provides a concise policy evaluation for the `firebase_app_hosting_build` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_build](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_build)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the Backend that this Build applies to | true | None | None |
| `backend` | The ID of the Backend that this Build applies to | true | None | None |
| `build_id` | The user-specified ID of the build being created. | true | None | None |
| `display_name` | Human-readable name. 63 character limit. | false | None | None |
| `annotations` | Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `labels` | Unstructured key value map that can be used to organize and categorize objects. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `container` | The URI of an Artifact Registry [container image](https://cloud.google.com/artifact-registry/docs/reference/rest/v1/projects.locations.repositories.dockerImages) to use as the build source. Structure is [documented below](#nested_source_container). | false | None | None |
| `codebase` | A codebase source, representing the state of the codebase that the build will be created at. Structure is [documented below](#nested_source_codebase). | false | None | None |

### container Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `image` | A URI representing a container for the backend to use. | true | None | None |

### codebase Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | (Output) The 'name' field in a Git user's git.config. Required by Git. | none | None | None |
| `hash` | (Output) The full SHA-1 hash of a Git commit, if available. | none | None | None |
| `commit_message` | (Output) The message of a codebase change. | none | None | None |
| `uri` | (Output) A URI linking to the codebase on an hosting provider's website. May not be valid if the commit has been rebased or force-pushed out of existence in the linked repository. | none | None | None |
| `author` | (Output) Version control metadata for a user associated with a resolved codebase. Currently assumes a Git user. Structure is [documented below](#nested_source_codebase_author). | none | None | None |
| `commit_time` | (Output) The time the change was made. | none | None | None |
| `branch` | The branch in the codebase to build from, using the latest commit. | false | None | None |
| `commit` | The commit in the codebase to build from. The `author` block contains: | false | None | None |
| `email` | (Output) The 'email' field in a Git user's git.config, if available. | none | None | None |
| `image_uri` | (Output) The URI of an image file associated with the user's account in an external source control provider, if available. | none | None | None |
