## 🛡️ Policy Deployment Engine: `apihub_curation`

This section provides a concise policy evaluation for the `apihub_curation` resource in GCP.

Reference: [Terraform Registry – apihub_curation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apihub_curation)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The display name of the curation. | true | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | None | None |
| `curation_id` | The ID to use for the curation resource, which will become the final component of the curations's resource name. This field is optional. * If provided, the same will be used. The service will throw an error if the specified ID is already used by another curation resource in the API hub. * If not provided, a system generated ID will be used. This value should be 4-500 characters, and valid characters are /a-z[0-9]-_/. | true | None | None |
| `description` | The description of the curation. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### endpoint Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `application_integration_endpoint_details` | The details of the Application Integration endpoint to be triggered for curation. Structure is [documented below](#nested_endpoint_application_integration_endpoint_details). | true | None | None |

### application_integration_endpoint_details Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `trigger_id` | The API trigger ID of the Application Integration workflow. | true | None | None |
| `uri` | The endpoint URI should be a valid REST URI for triggering an Application Integration. Format: `https://integrations.googleapis.com/v1/{name=projects/*/locations/*/integrations/*}:execute` or `https://{location}-integrations.googleapis.com/v1/{name=projects/*/locations/*/integrations/*}:execute` | true | None | None |
