## 🛡️ Policy Deployment Engine: `firebase_app_hosting_backend`

This section provides a concise policy evaluation for the `firebase_app_hosting_backend` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_backend](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_backend)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `serving_locality` | Immutable. Specifies how App Hosting will serve the content for this backend. It will either be contained to a single region (REGIONAL_STRICT) or allowed to use App Hosting's global-replicated serving infrastructure (GLOBAL_ACCESS). Possible values are: `REGIONAL_STRICT`, `GLOBAL_ACCESS`. | true | None | None |
| `app_id` | The [ID of a Web App](https://firebase.google.com/docs/reference/firebase-management/rest/v1beta1/projects.webApps#WebApp.FIELDS.app_id) associated with the backend. | true | None | None |
| `service_account` | The name of the service account used for Cloud Build and Cloud Run. Should have the role roles/firebaseapphosting.computeRunner or equivalent permissions. | true | None | None |
| `location` | The canonical IDs of a Google Cloud location such as "us-east1". | true | None | None |
| `backend_id` | Id of the backend. Also used as the service ID for Cloud Run, and as part of the default domain name. | true | None | None |
| `annotations` | Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `display_name` | Human-readable name. 63 character limit. | false | None | None |
| `environment` | The environment name of the backend, used to load environment variables from environment specific configuration. | false | None | None |
| `labels` | Unstructured key value map that can be used to organize and categorize objects. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### codebase Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `repository` | The resource name for the Developer Connect [`gitRepositoryLink`](https://cloud.google.com/developer-connect/docs/api/reference/rest/v1/projects.locations.connections.gitRepositoryLinks) connected to this backend, in the format: projects/{project}/locations/{location}/connections/{connection}/gitRepositoryLinks/{repositoryLink} | true | None | None |
| `root_directory` | If `repository` is provided, the directory relative to the root of the repository to use as the root for the deployed web app. | false | None | None |
