## 🛡️ Policy Deployment Engine: `firebase_app_hosting_backend`

This section provides a concise policy evaluation for the `firebase_app_hosting_backend` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_backend](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_backend)

---

## 1. Argument Reference

### `serving_locality`
- Description: (Required) Immutable. Specifies how App Hosting will serve the content for this backend. It will either be contained to a single region (REGIONAL_STRICT) or allowed to use App Hosting's global-replicated serving infrastructure (GLOBAL_ACCESS). Possible values are: `REGIONAL_STRICT`, `GLOBAL_ACCESS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_id`
- Description: (Required) The [ID of a Web App](https://firebase.google.com/docs/reference/firebase-management/rest/v1beta1/projects.webApps#WebApp.FIELDS.app_id) associated with the backend.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Required) The name of the service account used for Cloud Build and Cloud Run. Should have the role roles/firebaseapphosting.computeRunner or equivalent permissions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The canonical IDs of a Google Cloud location such as "us-east1".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend_id`
- Description: (Required) Id of the backend. Also used as the service ID for Cloud Run, and as part of the default domain name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Human-readable name. 63 character limit.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environment`
- Description: (Optional) The environment name of the backend, used to load environment variables from environment specific configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Unstructured key value map that can be used to organize and categorize objects. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `codebase`
- Description: (Optional) The connection to an external source repository to watch for event-driven updates to the backend. Structure is [documented below](#nested_codebase).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_codebase"></a>The `codebase` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Required) The resource name for the Developer Connect [`gitRepositoryLink`](https://cloud.google.com/developer-connect/docs/api/reference/rest/v1/projects.locations.connections.gitRepositoryLinks) connected to this backend, in the format: projects/{project}/locations/{location}/connections/{connection}/gitRepositoryLinks/{repositoryLink}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `root_directory`
- Description: (Optional) If `repository` is provided, the directory relative to the root of the repository to use as the root for the deployed web app.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
