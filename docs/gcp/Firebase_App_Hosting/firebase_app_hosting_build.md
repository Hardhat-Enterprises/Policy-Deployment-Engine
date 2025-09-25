## 🛡️ Policy Deployment Engine: `firebase_app_hosting_build`

This section provides a concise policy evaluation for the `firebase_app_hosting_build` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_build](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_build)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source` | The source for the build. Structure is [documented below](#nested_source). | true | true | Build source must use approved container registries to ensure secure and trusted container images. | Refer to child arguments | Refer to child arguments |
| `location` | The location of the Backend that this Build applies to | true | false | Location inherits from backend configuration and has no independent security policy. | australia-southeast2-a | us-east1 |
| `backend` | The ID of the Backend that this Build applies to | true | false | Backend ID is a reference with no direct security implications. | valid-backend | invalid-backend |
| `build_id` | The user-specified ID of the build being created. | true | false | Build ID is an identifier with no direct security impact. | c | nc |
| `display_name` | Human-readable name. 63 character limit. | false | false | Display name has no security implications. | None | None |
| `annotations` | Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Annotations are metadata with no direct security impact. | None | None |
| `labels` | Unstructured key value map that can be used to organize and categorize objects. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are metadata with no direct security impact. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Project specification uses default provider project when not specified. | None | None |
| `container` |  | false | true | Container configuration must specify approved image sources for security compliance. | Refer to child arguments | Refer to child arguments |
| `codebase` |  | false | false | Codebase fields are output-only or have no specific security policies. | None | None |

### source Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `container` | The URI of an Artifact Registry [container image](https://cloud.google.com/artifact-registry/docs/reference/rest/v1/projects.locations.repositories.dockerImages) to use as the build source. Structure is [documented below](#nested_source_container). | false | true | Container images must be sourced from approved registries to ensure security and compliance. | Refer to child arguments | Refer to child arguments |
| `codebase` | A codebase source, representing the state of the codebase that the build will be created at. Structure is [documented below](#nested_source_codebase). | false | false | Codebase source has no specific security policy in place. | None | None |

### container Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `image` | A URI representing a container for the backend to use. | true | true | Container image must be sourced from approved Australian Artifact Registry to ensure security, compliance, and data residency requirements. | au-docker.pkg.dev | docker.io/nginx:latest |

### codebase Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | (Output) The 'name' field in a Git user's git.config. Required by Git. | false | false | Output field with no security policy. | None | None |
| `hash` | (Output) The full SHA-1 hash of a Git commit, if available. | false | false | Output field with no security policy. | None | None |
| `commit_message` | (Output) The message of a codebase change. | false | false | Output field with no security policy. | None | None |
| `uri` | (Output) A URI linking to the codebase on an hosting provider's website. May not be valid if the commit has been rebased or force-pushed out of existence in the linked repository. | false | false | Output field with no security policy. | None | None |
| `author` | (Output) Version control metadata for a user associated with a resolved codebase. Currently assumes a Git user. Structure is [documented below](#nested_source_codebase_author). | false | false | Output field with no security policy. | None | None |
| `commit_time` | (Output) The time the change was made. | false | false | Output field with no security policy. | None | None |
| `branch` | The branch in the codebase to build from, using the latest commit. | false | false | Branch specification has no security policy. | None | None |
| `commit` | The commit in the codebase to build from. The `author` block contains: | false | false | Commit specification has no security policy. | None | None |
| `email` | (Output) The 'email' field in a Git user's git.config, if available. | false | false | Output field with no security policy. | None | None |
| `image_uri` | (Output) The URI of an image file associated with the user's account in an external source control provider, if available. | false | false | Output field with no security policy. | None | None |
