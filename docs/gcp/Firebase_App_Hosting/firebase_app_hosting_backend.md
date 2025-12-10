## 🛡️ Policy Deployment Engine: `firebase_app_hosting_backend`

This section provides a concise policy evaluation for the `firebase_app_hosting_backend` resource in GCP.

Reference: [Terraform Registry – firebase_app_hosting_backend](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_hosting_backend)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `serving_locality` | Immutable. Specifies how App Hosting will serve the content for this backend. It will either be contained to a single region (REGIONAL_STRICT) or allowed to use App Hosting's global-replicated serving infrastructure (GLOBAL_ACCESS). Possible values are: `REGIONAL_STRICT`, `GLOBAL_ACCESS`. | true | true | Serving locality must be set to REGIONAL_STRICT to ensure data residency compliance and maintain regional data sovereignty requirements. | REGIONAL_STRICT | GLOBAL_ACCESS |
| `app_id` | The [ID of a Web App](https://firebase.google.com/docs/reference/firebase-management/rest/v1beta1/projects.webApps#WebApp.FIELDS.app_id) associated with the backend. | true | false | App ID is a unique identifier with no direct security implications. | 1:0000000000:web:abc123456789 | 1:0000000000:web:invalid123 |
| `service_account` | The name of the service account used for Cloud Build and Cloud Run. Should have the role roles/firebaseapphosting.computeRunner or equivalent permissions. | true | false | Service account specification has no direct security impact as role assignments are managed separately. | firebase-hosting-bot@grounded-jetty-469512-j6.iam.gserviceaccount.com | invalid-service-account@project.iam.gserviceaccount.com |
| `location` | The canonical IDs of a Google Cloud location such as "us-east1". | true | true | Location must be set to approved Australian regions to ensure data residency compliance and maintain regional data sovereignty. | australia-southeast2-a | africa-south1-a |
| `backend_id` | Id of the backend. Also used as the service ID for Cloud Run, and as part of the default domain name. | true | false | Backend ID is an identifier with no direct security impact. | c | nc |
| `annotations` | Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Annotations are metadata with no direct security impact. | None | None |
| `display_name` | Human-readable name. 63 character limit. | false | false | Display name has no security implications. | None | None |
| `environment` | The environment name of the backend, used to load environment variables from environment specific configuration. | false | false | Environment specification has no direct security impact. | None | None |
| `labels` | Unstructured key value map that can be used to organize and categorize objects. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are metadata with no direct security impact. | None | None |
| `codebase` | The connection to an external source repository to watch for event-driven updates to the backend. Structure is [documented below](#nested_codebase). | false | true | Codebase repository must use the proper GCP Developer Connect format to ensure secure and authorized source code connections. | Refer to child arguments | Refer to child arguments |
| `project` | If it is not provided, the provider project is used. | false | false | Project specification uses default provider project when not specified. | None | None |

### codebase Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `repository` | The resource name for the Developer Connect [`gitRepositoryLink`](https://cloud.google.com/developer-connect/docs/api/reference/rest/v1/projects.locations.connections.gitRepositoryLinks) connected to this backend, in the format: projects/{project}/locations/{location}/connections/{connection}/gitRepositoryLinks/{repositoryLink} | true | true | Repository must use the GCP Developer Connect format to ensure secure authentication and authorization through GCP's managed connections. | projects/my-project/locations/australia-southeast2/connections/github-connection/gitRepositoryLinks/my-repo-link | github.com/user/repo |
| `root_directory` | If `repository` is provided, the directory relative to the root of the repository to use as the root for the deployed web app. | false | false | Root directory specification has no direct security impact. | None | None |
