## 🛡️ Policy Deployment Engine: `apigee_environment`

This section provides a concise policy evaluation for the `apigee_environment` resource in GCP.

Reference: [Terraform Registry – apigee_environment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_environment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource ID of the environment. | true | None | None |
| `org_id` | The Apigee Organization associated with the Apigee environment, in the format `organizations/{{org_name}}`. | true | None | None |
| `display_name` | Display name of the environment. | false | None | None |
| `description` | Description of the environment. | false | None | None |
| `deployment_type` | Optional. Deployment type supported by the environment. The deployment type can be set when creating the environment and cannot be changed. When you enable archive deployment, you will be prevented from performing a subset of actions within the environment, including: Managing the deployment of API proxy or shared flow revisions; Creating, updating, or deleting resource files; Creating, updating, or deleting target servers. Possible values are: `DEPLOYMENT_TYPE_UNSPECIFIED`, `PROXY`, `ARCHIVE`. | false | None | None |
| `api_proxy_type` | Optional. API Proxy type supported by the environment. The type can be set when creating the Environment and cannot be changed. Possible values are: `API_PROXY_TYPE_UNSPECIFIED`, `PROGRAMMABLE`, `CONFIGURABLE`. | false | None | None |
| `type` | Types that can be selected for an Environment. Each of the types are limited by capability and capacity. Refer to Apigee's public documentation to understand about each of these types in details. An Apigee org can support heterogeneous Environments. Possible values are: `ENVIRONMENT_TYPE_UNSPECIFIED`, `BASE`, `INTERMEDIATE`, `COMPREHENSIVE`. | false | None | None |
| `forward_proxy_uri` | Optional. URI of the forward proxy to be applied to the runtime instances in this environment. Must be in the format of {scheme}://{hostname}:{port}. Note that the scheme must be one of "http" or "https", and the port must be supplied. | false | None | None |

### node_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `min_node_count` | The minimum total number of gateway nodes that the is reserved for all instances that has the specified environment. If not specified, the default is determined by the recommended minimum number of nodes for that gateway. | false | None | None |
| `max_node_count` | The maximum total number of gateway nodes that the is reserved for all instances that has the specified environment. If not specified, the default is determined by the recommended maximum number of nodes for that gateway. | false | None | None |
| `current_aggregate_node_count` | (Output) The current total number of gateway nodes that each environment currently has across all instances. | none | None | None |

### properties Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `property` | List of all properties in the object. Structure is [documented below](#nested_properties_property). | false | None | None |

### client_ip_resolution_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `header_index_algorithm` | Resolves the client ip based on a custom header. Structure is [documented below](#nested_client_ip_resolution_config_header_index_algorithm). | false | None | None |

### property Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The property key. | false | None | None |
| `value` | The property value. | false | None | None |

### header_index_algorithm Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_header_name` | The name of the header to extract the client ip from. We are currently only supporting the X-Forwarded-For header. | true | None | None |
| `ip_header_index` | The index of the ip in the header. Positive indices 0, 1, 2, 3 chooses indices from the left (first ips). Negative indices -1, -2, -3 chooses indices from the right (last ips). | true | None | None |
