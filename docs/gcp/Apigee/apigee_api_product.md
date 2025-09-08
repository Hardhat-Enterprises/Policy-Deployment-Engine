## 🛡️ Policy Deployment Engine: `apigee_api_product`

This section provides a concise policy evaluation for the `apigee_api_product` resource in GCP.

Reference: [Terraform Registry – apigee_api_product](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_api_product)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Internal name of the API product. | true | None | None |
| `display_name` | Name displayed in the UI or developer portal to developers registering for API access. | true | None | None |
| `org_id` | The Apigee Organization associated with the Apigee API product, in the format `organizations/{{org_name}}`. | true | None | None |
| `description` | Description of the API product. Include key information about the API product that is not captured by other fields. | false | None | None |
| `approval_type` | Flag that specifies how API keys are approved to access the APIs defined by the API product. Valid values are `auto` or `manual`. Possible values are: `auto`, `manual`. | false | None | None |
| `api_resources` | Comma-separated list of API resources to be bundled in the API product. By default, the resource paths are mapped from the proxy.pathsuffix variable. The proxy path suffix is defined as the URI fragment following the ProxyEndpoint base path. For example, if the apiResources element is defined to be /forecastrss and the base path defined for the API proxy is /weather, then only requests to /weather/forecastrss are permitted by the API product. | false | None | None |
| `environments` | Comma-separated list of environment names to which the API product is bound. Requests to environments that are not listed are rejected. By specifying one or more environments, you can bind the resources listed in the API product to a specific environment, preventing developers from accessing those resources through API proxies deployed in another environment. | false | None | None |
| `proxies` | Comma-separated list of API proxy names to which this API product is bound. By specifying API proxies, you can associate resources in the API product with specific API proxies, preventing developers from accessing those resources through other API proxies. Apigee rejects requests to API proxies that are not listed. | false | None | None |
| `scopes` | Comma-separated list of OAuth scopes that are validated at runtime. Apigee validates that the scopes in any access token presented match the scopes defined in the OAuth policy associated with the API product. | false | None | None |
| `quota_interval` | Time interval over which the number of request messages is calculated. | false | None | None |
| `quota_time_unit` | Time unit defined for the quotaInterval. Valid values include second, minute, hour, day, month or year. | false | None | None |
| `quota_counter_scope` | Scope of the quota decides how the quota counter gets applied and evaluate for quota violation. If the Scope is set as PROXY, then all the operations defined for the APIproduct that are associated with the same proxy will share the same quota counter set at the APIproduct level, making it a global counter at a proxy level. If the Scope is set as OPERATION, then each operations get the counter set at the API product dedicated, making it a local counter. Note that, the QuotaCounterScope applies only when an operation does not have dedicated quota set for itself. Possible values are: `QUOTA_COUNTER_SCOPE_UNSPECIFIED`, `PROXY`, `OPERATION`. | false | None | None |
| `space` | Optional. The resource ID of the parent Space. If not set, the parent resource will be the Organization. | false | None | None |

### attributes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Key of the attribute. | false | None | None |
| `value` | Value of the attribute. | false | None | None |

### quota Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `limit` | Required. Upper limit allowed for the time interval and time unit specified. Requests exceeding this limit will be rejected. | false | None | None |
| `interval` | Required. Time interval over which the number of request messages is calculated. | false | None | None |
| `time_unit` | Time unit defined for the interval. Valid values include second, minute, hour, day, month or year. If limit and interval are valid, the default value is hour; otherwise, the default is null. | false | None | None |

### operation_group Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `operation_configs` | Required. List of operation configurations for either Apigee API proxies or other remote services that are associated with this API product. Structure is [documented below](#nested_operation_group_operation_configs). | false | None | None |
| `operation_config_type` | Flag that specifes whether the configuration is for Apigee API proxy or a remote service. Valid values include proxy or remoteservice. Defaults to proxy. Set to proxy when Apigee API proxies are associated with the API product. Set to remoteservice when non-Apigee proxies like Istio-Envoy are associated with the API product. Possible values are: `proxy`, `remoteservice`. | false | None | None |

### graphql_operation_group Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `operation_configs` | List of graphQL operation configuration details associated with Apigee API proxies or remote services. Remote services are non-Apigee proxies, such as Istio-Envoy. Structure is [documented below](#nested_graphql_operation_group_operation_configs). | false | None | None |
| `operation_config_type` | Flag that specifes whether the configuration is for Apigee API proxy or a remote service. Valid values include proxy or remoteservice. Defaults to proxy. Set to proxy when Apigee API proxies are associated with the API product. Set to remoteservice when non-Apigee proxies like Istio-Envoy are associated with the API product. Possible values are: `proxy`, `remoteservice`. | false | None | None |

### grpc_operation_group Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `operation_configs` | Required. List of operation configurations for either Apigee API proxies that are associated with this API product. Structure is [documented below](#nested_grpc_operation_group_operation_configs). | false | None | None |

### operation_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `api_source` | Required. Name of the API proxy with which the gRPC operation and quota are associated. | false | None | None |
| `operations` | Required. List of GraphQL name/operation type pairs for the proxy or remote service to which quota will be applied. If only operation types are specified, the quota will be applied to all GraphQL requests irrespective of the GraphQL name. Note: Currently, you can specify only a single GraphQLOperation. Specifying more than one will cause the operation to fail. Structure is [documented below](#nested_graphql_operation_group_operation_configs_operation_configs_operations). | false | None | None |
| `quota` | Quota parameters to be enforced for the resources, methods, and API source combination. If none are specified, quota enforcement will not be done. Structure is [documented below](#nested_grpc_operation_group_operation_configs_operation_configs_quota). | false | None | None |
| `attributes` | Custom attributes associated with the operation. Structure is [documented below](#nested_grpc_operation_group_operation_configs_operation_configs_attributes). | false | None | None |
| `methods` | List of unqualified gRPC method names for the proxy to which quota will be applied. If this field is empty, the Quota will apply to all operations on the gRPC service defined on the proxy. Example: Given a proxy that is configured to serve com.petstore.PetService, the methods com.petstore.PetService.ListPets and com.petstore.PetService.GetPet would be specified here as simply ["ListPets", "GetPet"]. Note: Currently, you can specify only a single GraphQLOperation. Specifying more than one will cause the operation to fail. | false | None | None |
| `service` | Required. gRPC Service name associated to be associated with the API proxy, on which quota rules can be applied upon. | false | None | None |

### operations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource` | Required. REST resource path associated with the API proxy or remote service. | false | None | None |
| `methods` | Methods refers to the REST verbs, when none specified, all verb types are allowed. | false | None | None |
| `operation_types` | Required. GraphQL operation types. Valid values include query or mutation. Note: Apigee does not currently support subscription types. | false | None | None |
| `operation` | GraphQL operation name. The name and operation type will be used to apply quotas. If no name is specified, the quota will be applied to all GraphQL operations irrespective of their operation names in the payload. | false | None | None |
