## 🛡️ Policy Deployment Engine: `apigee_api_product`

This section provides a concise policy evaluation for the `apigee_api_product` resource in GCP.

Reference: [Terraform Registry – apigee_api_product](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_api_product)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Internal name of the API product. | true | false | It is used to set the name of API Product and does not have any security impact. | None | None |
| `display_name` | Name displayed in the UI or developer portal to developers registering for API access. | true | false | Metadata that sets the display name and does not have any security impact. | None | None |
| `org_id` | The Apigee Organization associated with the Apigee API product, in the format `organizations/{{org_name}}`. | true | false | It sets organisation associated with API Product. It does not have any security impact. | None | None |
| `description` | Description of the API product. Include key information about the API product that is not captured by other fields. | false | false | It contains the description of API Product. Not a security related argument | None | None |
| `approval_type` | Flag that specifies how API keys are approved to access the APIs defined by the API product. Valid values are `auto` or `manual`. Possible values are: `auto`, `manual`. | false | true | Predefined approval type that defines how API keys are approved for accessing the API product. Approval type should be manual in production environment. | manual | auto |
| `attributes` | Array of attributes that may be used to extend the default API product profile with customer-specific metadata. You can specify a maximum of 18 attributes. Use this property to specify the access level of the API product as either public, private, or internal. | false | false | It is used to specify the metadat and does not have any security impact | None | None |
| `api_resources` | Comma-separated list of API resources to be bundled in the API product. By default, the resource paths are mapped from the proxy.pathsuffix variable. The proxy path suffix is defined as the URI fragment following the ProxyEndpoint base path. For example, if the apiResources element is defined to be /forecastrss and the base path defined for the API proxy is /weather, then only requests to /weather/forecastrss are permitted by the API product. | false | true | It restricts API access ensuring that app developers can only access specific resources of an API rather than the entire API proxy, if desired | /weather/** | / |
| `environments` | Comma-separated list of environment names to which the API product is bound. Requests to environments that are not listed are rejected. By specifying one or more environments, you can bind the resources listed in the API product to a specific environment, preventing developers from accessing those resources through API proxies deployed in another environment. | false | false | It provides the list of environment names and does not have any security impact | None | None |
| `proxies` | Comma-separated list of API proxy names to which this API product is bound. By specifying API proxies, you can associate resources in the API product with specific API proxies, preventing developers from accessing those resources through other API proxies. Apigee rejects requests to API proxies that are not listed. | false | true | It provides a mechanism for access control. | proxies-compliant | proxies-non-compliant |
| `scopes` | Comma-separated list of OAuth scopes that are validated at runtime. Apigee validates that the scopes in any access token presented match the scopes defined in the OAuth policy associated with the API product. | false | true | It act as permissions that limit the access granted to an access token | read:* | write:* |

### attributes Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Key of the attribute. | false | false | It sets the key of attribute. Has no impact on the security of resources. | None | None |
| `value` | Value of the attribute. | false | false | It sets the value of the attribute. Has no impact on the security of resources. | None | None |
