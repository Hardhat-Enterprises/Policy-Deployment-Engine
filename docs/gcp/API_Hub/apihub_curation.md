## 🛡️ Policy Deployment Engine: `apihub_curation`

This section provides a concise policy evaluation for the `apihub_curation` resource in GCP.

Reference: [Terraform Registry – apihub_curation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apihub_curation)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | The display name of the curation. | true | false | None | None | None |
| `endpoint` | The endpoint to be triggered for curation. The endpoint will be invoked with a request payload containing ApiMetadata. Response should contain curated data in the form of ApiMetadata. Structure is [documented below](#nested_endpoint). | true | false | Endpoint configuration determines where API metadata is routed | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | true | Location controls regional compliance and data residency. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1', 'europe-west1'] |
| `curation_id` | The ID to use for the curation resource, which will become the final component of the curations's resource name. This field is optional. * If provided, the same will be used. The service will throw an error if the specified ID is already used by another curation resource in the API hub. * If not provided, a system generated ID will be used. This value should be 4-500 characters, and valid characters are /a-z[0-9]-_/. | true | false | Identifier only. | None | None |
| `description` | The description of the curation. | false | false | Purely informational field with no effect on security. | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | Required so that terraform operates normally | ['PDE'] | ['Anything else'] |
| `application_integration_endpoint_details` |  | true | false | Arguments inside may impact security | None | None |

### endpoint Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `application_integration_endpoint_details` | The details of the Application Integration endpoint to be triggered for curation. Structure is [documented below](#nested_endpoint_application_integration_endpoint_details). | true | false | Controls workflow routing for API metadata. | None | None |

### application_integration_endpoint_details Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `trigger_id` | The API trigger ID of the Application Integration workflow. | true | true | Trigger IDs must follow strict naming conventions to prevent routing to unauthorized workflows. | ['api_trigger/curation_API_PDE_1', 'api_trigger/curation_API_PDE_2', 'api_trigger/curation_API_PDE_3'] | ['RANDOM_9999', 'api_trigger/aaaa', ''] |
| `uri` | The endpoint URI should be a valid REST URI for triggering an Application Integration. Format: `https://integrations.googleapis.com/v1/{name=projects/*/locations/*/integrations/*}:execute` or `https://{location}-integrations.googleapis.com/v1/{name=projects/*/locations/*/integrations/*}:execute` | true | true | Defines endpoint where metadata is sent. Unapproved URIs may result in data leakage. | ['https://integrations.googleapis.com/v1/projects/1082615593856/locations/us-central1/integrations/curation:execute'] | ['http://unsecure-endpoint.local', 'https://randomsite.com/invoke'] |
