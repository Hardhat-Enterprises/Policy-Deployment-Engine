## 🛡️ Policy Deployment Engine: `firebase_app_hosting_build`

This section provides a concise policy evaluation for the `firebase_app_hosting_build` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_build](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_build)

---

## 1. Argument Reference

### `source`
- Description: (Required) The source for the build. Structure is [documented below](#nested_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the Backend that this Build applies to
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend`
- Description: (Required) The ID of the Backend that this Build applies to
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `build_id`
- Description: (Required) The user-specified ID of the build being created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Human-readable name. 63 character limit.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Unstructured key value map that can be used to organize and categorize objects. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_source"></a>The `source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container`
- Description: (Optional) The URI of an Artifact Registry [container image](https://cloud.google.com/artifact-registry/docs/reference/rest/v1/projects.locations.repositories.dockerImages) to use as the build source. Structure is [documented below](#nested_source_container).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `codebase`
- Description: (Optional) A codebase source, representing the state of the codebase that the build will be created at. Structure is [documented below](#nested_source_codebase). <a name="nested_source_container"></a>The `container` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image`
- Description: (Required) A URI representing a container for the backend to use. <a name="nested_source_codebase"></a>The `codebase` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Output) The human-friendly name to use for this Codebase when displaying a build. We use the first eight characters of the SHA-1 hash for GitHub.com.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hash`
- Description: (Output) The full SHA-1 hash of a Git commit, if available.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `commit_message`
- Description: (Output) The message of a codebase change.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Output) A URI linking to the codebase on an hosting provider's website. May not be valid if the commit has been rebased or force-pushed out of existence in the linked repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `author`
- Description: (Output) Version control metadata for a user associated with a resolved codebase. Currently assumes a Git user. Structure is [documented below](#nested_source_codebase_author).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `commit_time`
- Description: (Output) The time the change was made.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `branch`
- Description: (Optional) The branch in the codebase to build from, using the latest commit.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `commit`
- Description: (Optional) The commit in the codebase to build from. <a name="nested_source_codebase_author"></a>The `author` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Output) The 'name' field in a Git user's git.config. Required by Git.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Output) The 'email' field in a Git user's git.config, if available.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_uri`
- Description: (Output) The URI of an image file associated with the user's account in an external source control provider, if available.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
