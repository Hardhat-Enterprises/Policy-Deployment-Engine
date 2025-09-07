## 🛡️ Policy Deployment Engine: `apihub_curation`

This section provides a concise policy evaluation for the `apihub_curation` resource in GCP.

Reference: [Terraform Registry – apihub_curation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apihub_curation)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The display name of the curation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoint`
- Description: (Required) The endpoint to be triggered for curation. The endpoint will be invoked with a request payload containing ApiMetadata. Response should contain curated data in the form of ApiMetadata. Structure is [documented below](#nested_endpoint).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `curation_id`
- Description: (Required) The ID to use for the curation resource, which will become the final component of the curations's resource name. This field is optional. * If provided, the same will be used. The service will throw an error if the specified ID is already used by another curation resource in the API hub. * If not provided, a system generated ID will be used. This value should be 4-500 characters, and valid characters are /a-z[0-9]-_/.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of the curation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_endpoint"></a>The `endpoint` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `application_integration_endpoint_details`
- Description: (Required) The details of the Application Integration endpoint to be triggered for curation. Structure is [documented below](#nested_endpoint_application_integration_endpoint_details). <a name="nested_endpoint_application_integration_endpoint_details"></a>The `application_integration_endpoint_details` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trigger_id`
- Description: (Required) The API trigger ID of the Application Integration workflow.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) The endpoint URI should be a valid REST URI for triggering an Application Integration. Format: `https://integrations.googleapis.com/v1/{name=projects/*/locations/*/integrations/*}:execute` or `https://{location}-integrations.googleapis.com/v1/{name=projects/*/locations/*/integrations/*}:execute`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
