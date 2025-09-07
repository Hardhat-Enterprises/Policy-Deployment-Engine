## 🛡️ Policy Deployment Engine: `apigee_api_product`

This section provides a concise policy evaluation for the `apigee_api_product` resource in GCP.

Reference: [Terraform Registry – apigee_api_product](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_api_product)

---

## 1. Argument Reference

### `name`
- Description: (Required) Internal name of the API product.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) Name displayed in the UI or developer portal to developers registering for API access.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_id`
- Description: (Required) The Apigee Organization associated with the Apigee API product, in the format `organizations/{{org_name}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the API product. Include key information about the API product that is not captured by other fields.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `approval_type`
- Description: (Optional) Flag that specifies how API keys are approved to access the APIs defined by the API product. Valid values are `auto` or `manual`. Possible values are: `auto`, `manual`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attributes`
- Description: (Optional) Array of attributes that may be used to extend the default API product profile with customer-specific metadata. You can specify a maximum of 18 attributes. Use this property to specify the access level of the API product as either public, private, or internal. Structure is [documented below](#nested_attributes).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_resources`
- Description: (Optional) Comma-separated list of API resources to be bundled in the API product. By default, the resource paths are mapped from the proxy.pathsuffix variable. The proxy path suffix is defined as the URI fragment following the ProxyEndpoint base path. For example, if the apiResources element is defined to be /forecastrss and the base path defined for the API proxy is /weather, then only requests to /weather/forecastrss are permitted by the API product.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environments`
- Description: (Optional) Comma-separated list of environment names to which the API product is bound. Requests to environments that are not listed are rejected. By specifying one or more environments, you can bind the resources listed in the API product to a specific environment, preventing developers from accessing those resources through API proxies deployed in another environment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxies`
- Description: (Optional) Comma-separated list of API proxy names to which this API product is bound. By specifying API proxies, you can associate resources in the API product with specific API proxies, preventing developers from accessing those resources through other API proxies. Apigee rejects requests to API proxies that are not listed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scopes`
- Description: (Optional) Comma-separated list of OAuth scopes that are validated at runtime. Apigee validates that the scopes in any access token presented match the scopes defined in the OAuth policy associated with the API product.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quota`
- Description: (Optional) Number of request messages permitted per app by this API product for the specified quotaInterval and quotaTimeUnit. For example, a quota of 50, for a quotaInterval of 12 and a quotaTimeUnit of hours means 50 requests are allowed every 12 hours.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quota_interval`
- Description: (Optional) Time interval over which the number of request messages is calculated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quota_time_unit`
- Description: (Optional) Time unit defined for the quotaInterval. Valid values include second, minute, hour, day, month or year.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operation_group`
- Description: (Optional) Configuration used to group Apigee proxies or remote services with resources, method types, and quotas. The resource refers to the resource URI (excluding the base path). With this grouping, the API product creator is able to fine-tune and give precise control over which REST methods have access to specific resources and how many calls can be made (using the quota setting). Note: The apiResources setting cannot be specified for both the API product and operation group; otherwise the call will fail. Structure is [documented below](#nested_operation_group).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `graphql_operation_group`
- Description: (Optional) Configuration used to group Apigee proxies or remote services with graphQL operation name, graphQL operation type and quotas. This grouping allows us to precisely set quota for a particular combination of graphQL name and operation type for a particular proxy request. If graphQL name is not set, this would imply quota will be applied on all graphQL requests matching the operation type. Structure is [documented below](#nested_graphql_operation_group).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `grpc_operation_group`
- Description: (Optional) Optional. Configuration used to group Apigee proxies with gRPC services and method names. This grouping allows us to set quota for a particular proxy with the gRPC service name and method. If a method name is not set, this implies quota and authorization are applied to all gRPC methods implemented by that proxy for that particular gRPC service. Structure is [documented below](#nested_grpc_operation_group).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quota_counter_scope`
- Description: (Optional) Scope of the quota decides how the quota counter gets applied and evaluate for quota violation. If the Scope is set as PROXY, then all the operations defined for the APIproduct that are associated with the same proxy will share the same quota counter set at the APIproduct level, making it a global counter at a proxy level. If the Scope is set as OPERATION, then each operations get the counter set at the API product dedicated, making it a local counter. Note that, the QuotaCounterScope applies only when an operation does not have dedicated quota set for itself. Possible values are: `QUOTA_COUNTER_SCOPE_UNSPECIFIED`, `PROXY`, `OPERATION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `space`
- Description: (Optional) Optional. The resource ID of the parent Space. If not set, the parent resource will be the Organization. <a name="nested_attributes"></a>The `attributes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Key of the attribute.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Value of the attribute. <a name="nested_operation_group"></a>The `operation_group` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operation_configs`
- Description: (Optional) Required. List of operation configurations for either Apigee API proxies or other remote services that are associated with this API product. Structure is [documented below](#nested_operation_group_operation_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operation_config_type`
- Description: (Optional) Flag that specifes whether the configuration is for Apigee API proxy or a remote service. Valid values include proxy or remoteservice. Defaults to proxy. Set to proxy when Apigee API proxies are associated with the API product. Set to remoteservice when non-Apigee proxies like Istio-Envoy are associated with the API product. Possible values are: `proxy`, `remoteservice`. <a name="nested_operation_group_operation_configs"></a>The `operation_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_source`
- Description: (Optional) Required. Name of the API proxy or remote service with which the resources, methods, and quota are associated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operations`
- Description: (Optional) List of resource/method pairs for the API proxy or remote service to which quota will applied. Note: Currently, you can specify only a single resource/method pair. The call will fail if more than one resource/method pair is provided. Structure is [documented below](#nested_operation_group_operation_configs_operation_configs_operations).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quota`
- Description: (Optional) Quota parameters to be enforced for the resources, methods, and API source combination. If none are specified, quota enforcement will not be done. Structure is [documented below](#nested_operation_group_operation_configs_operation_configs_quota).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attributes`
- Description: (Optional) Custom attributes associated with the operation. Structure is [documented below](#nested_operation_group_operation_configs_operation_configs_attributes). <a name="nested_operation_group_operation_configs_operation_configs_operations"></a>The `operations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource`
- Description: (Optional) Required. REST resource path associated with the API proxy or remote service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `methods`
- Description: (Optional) Methods refers to the REST verbs, when none specified, all verb types are allowed. <a name="nested_operation_group_operation_configs_operation_configs_quota"></a>The `quota` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `limit`
- Description: (Optional) Required. Upper limit allowed for the time interval and time unit specified. Requests exceeding this limit will be rejected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interval`
- Description: (Optional) Required. Time interval over which the number of request messages is calculated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_unit`
- Description: (Optional) Time unit defined for the interval. Valid values include second, minute, hour, day, month or year. If limit and interval are valid, the default value is hour; otherwise, the default is null. <a name="nested_operation_group_operation_configs_operation_configs_attributes"></a>The `attributes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Key of the attribute.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Value of the attribute. <a name="nested_graphql_operation_group"></a>The `graphql_operation_group` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operation_configs`
- Description: (Optional) List of graphQL operation configuration details associated with Apigee API proxies or remote services. Remote services are non-Apigee proxies, such as Istio-Envoy. Structure is [documented below](#nested_graphql_operation_group_operation_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operation_config_type`
- Description: (Optional) Flag that specifes whether the configuration is for Apigee API proxy or a remote service. Valid values include proxy or remoteservice. Defaults to proxy. Set to proxy when Apigee API proxies are associated with the API product. Set to remoteservice when non-Apigee proxies like Istio-Envoy are associated with the API product. Possible values are: `proxy`, `remoteservice`. <a name="nested_graphql_operation_group_operation_configs"></a>The `operation_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_source`
- Description: (Optional) Required. Name of the API proxy endpoint or remote service with which the GraphQL operation and quota are associated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operations`
- Description: (Optional) Required. List of GraphQL name/operation type pairs for the proxy or remote service to which quota will be applied. If only operation types are specified, the quota will be applied to all GraphQL requests irrespective of the GraphQL name. Note: Currently, you can specify only a single GraphQLOperation. Specifying more than one will cause the operation to fail. Structure is [documented below](#nested_graphql_operation_group_operation_configs_operation_configs_operations).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quota`
- Description: (Optional) Quota parameters to be enforced for the resources, methods, and API source combination. If none are specified, quota enforcement will not be done. Structure is [documented below](#nested_graphql_operation_group_operation_configs_operation_configs_quota).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attributes`
- Description: (Optional) Custom attributes associated with the operation. Structure is [documented below](#nested_graphql_operation_group_operation_configs_operation_configs_attributes). <a name="nested_graphql_operation_group_operation_configs_operation_configs_operations"></a>The `operations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operation_types`
- Description: (Optional) Required. GraphQL operation types. Valid values include query or mutation. Note: Apigee does not currently support subscription types.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operation`
- Description: (Optional) GraphQL operation name. The name and operation type will be used to apply quotas. If no name is specified, the quota will be applied to all GraphQL operations irrespective of their operation names in the payload. <a name="nested_graphql_operation_group_operation_configs_operation_configs_quota"></a>The `quota` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `limit`
- Description: (Optional) Required. Upper limit allowed for the time interval and time unit specified. Requests exceeding this limit will be rejected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interval`
- Description: (Optional) Required. Time interval over which the number of request messages is calculated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_unit`
- Description: (Optional) Time unit defined for the interval. Valid values include second, minute, hour, day, month or year. If limit and interval are valid, the default value is hour; otherwise, the default is null. <a name="nested_graphql_operation_group_operation_configs_operation_configs_attributes"></a>The `attributes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Key of the attribute.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Value of the attribute. <a name="nested_grpc_operation_group"></a>The `grpc_operation_group` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operation_configs`
- Description: (Optional) Required. List of operation configurations for either Apigee API proxies that are associated with this API product. Structure is [documented below](#nested_grpc_operation_group_operation_configs). <a name="nested_grpc_operation_group_operation_configs"></a>The `operation_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_source`
- Description: (Optional) Required. Name of the API proxy with which the gRPC operation and quota are associated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `methods`
- Description: (Optional) List of unqualified gRPC method names for the proxy to which quota will be applied. If this field is empty, the Quota will apply to all operations on the gRPC service defined on the proxy. Example: Given a proxy that is configured to serve com.petstore.PetService, the methods com.petstore.PetService.ListPets and com.petstore.PetService.GetPet would be specified here as simply ["ListPets", "GetPet"]. Note: Currently, you can specify only a single GraphQLOperation. Specifying more than one will cause the operation to fail.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quota`
- Description: (Optional) Quota parameters to be enforced for the resources, methods, and API source combination. If none are specified, quota enforcement will not be done. Structure is [documented below](#nested_grpc_operation_group_operation_configs_operation_configs_quota).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attributes`
- Description: (Optional) Custom attributes associated with the operation. Structure is [documented below](#nested_grpc_operation_group_operation_configs_operation_configs_attributes).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Optional) Required. gRPC Service name associated to be associated with the API proxy, on which quota rules can be applied upon. <a name="nested_grpc_operation_group_operation_configs_operation_configs_quota"></a>The `quota` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `limit`
- Description: (Optional) Required. Upper limit allowed for the time interval and time unit specified. Requests exceeding this limit will be rejected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interval`
- Description: (Optional) Required. Time interval over which the number of request messages is calculated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_unit`
- Description: (Optional) Time unit defined for the interval. Valid values include second, minute, hour, day, month or year. If limit and interval are valid, the default value is hour; otherwise, the default is null. <a name="nested_grpc_operation_group_operation_configs_operation_configs_attributes"></a>The `attributes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Key of the attribute.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Value of the attribute.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
