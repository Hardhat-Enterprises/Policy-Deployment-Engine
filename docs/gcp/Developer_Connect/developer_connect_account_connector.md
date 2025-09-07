## 🛡️ Policy Deployment Engine: `developer_connect_account_connector`

This section provides a concise policy evaluation for the `developer_connect_account_connector` resource in GCP.

Reference: [Terraform Registry – developer_connect_account_connector](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/developer_connect_account_connector)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `account_connector_id`
- Description: (Required) Required. The ID to use for the AccountConnector, which will become the final component of the AccountConnector's resource name. Its format should adhere to https://google.aip.dev/122#resource-id-segments Names must be unique per-project per-location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provider_oauth_config`
- Description: (Optional) ProviderOAuthConfig is the OAuth config for a provider. Structure is [documented below](#nested_provider_oauth_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Optional. Allows users to store small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Labels as key value pairs **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_provider_oauth_config"></a>The `provider_oauth_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `system_provider_id`
- Description: (Optional) List of providers that are owned by Developer Connect. Possible values: GITHUB GITLAB GOOGLE SENTRY ROVO NEW_RELIC DATASTAX
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scopes`
- Description: (Required) Required. User selected scopes to apply to the Oauth config In the event of changing scopes, user records under AccountConnector will be deleted and users will re-auth again.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
