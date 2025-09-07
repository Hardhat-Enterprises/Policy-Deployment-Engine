## 🛡️ Policy Deployment Engine: `apigee_environment`

This section provides a concise policy evaluation for the `apigee_environment` resource in GCP.

Reference: [Terraform Registry – apigee_environment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_environment)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource ID of the environment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_id`
- Description: (Required) The Apigee Organization associated with the Apigee environment, in the format `organizations/{{org_name}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Display name of the environment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the environment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deployment_type`
- Description: (Optional) Optional. Deployment type supported by the environment. The deployment type can be set when creating the environment and cannot be changed. When you enable archive deployment, you will be prevented from performing a subset of actions within the environment, including: Managing the deployment of API proxy or shared flow revisions; Creating, updating, or deleting resource files; Creating, updating, or deleting target servers. Possible values are: `DEPLOYMENT_TYPE_UNSPECIFIED`, `PROXY`, `ARCHIVE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_proxy_type`
- Description: (Optional) Optional. API Proxy type supported by the environment. The type can be set when creating the Environment and cannot be changed. Possible values are: `API_PROXY_TYPE_UNSPECIFIED`, `PROGRAMMABLE`, `CONFIGURABLE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_config`
- Description: (Optional) NodeConfig for setting the min/max number of nodes associated with the environment. Structure is [documented below](#nested_node_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Types that can be selected for an Environment. Each of the types are limited by capability and capacity. Refer to Apigee's public documentation to understand about each of these types in details. An Apigee org can support heterogeneous Environments. Possible values are: `ENVIRONMENT_TYPE_UNSPECIFIED`, `BASE`, `INTERMEDIATE`, `COMPREHENSIVE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `forward_proxy_uri`
- Description: (Optional) Optional. URI of the forward proxy to be applied to the runtime instances in this environment. Must be in the format of {scheme}://{hostname}:{port}. Note that the scheme must be one of "http" or "https", and the port must be supplied.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) Key-value pairs that may be used for customizing the environment. Structure is [documented below](#nested_properties).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_ip_resolution_config`
- Description: (Optional) The algorithm to resolve IP. This will affect Analytics, API Security, and other features that use the client ip. To remove a client ip resolution config, update the field to an empty value. Example: '{ "clientIpResolutionConfig" = {} }' For more information, see: https://cloud.google.com/apigee/docs/api-platform/system-administration/client-ip-resolution Structure is [documented below](#nested_client_ip_resolution_config). <a name="nested_node_config"></a>The `node_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_node_count`
- Description: (Optional) The minimum total number of gateway nodes that the is reserved for all instances that has the specified environment. If not specified, the default is determined by the recommended minimum number of nodes for that gateway.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_node_count`
- Description: (Optional) The maximum total number of gateway nodes that the is reserved for all instances that has the specified environment. If not specified, the default is determined by the recommended maximum number of nodes for that gateway.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `current_aggregate_node_count`
- Description: (Output) The current total number of gateway nodes that each environment currently has across all instances. <a name="nested_properties"></a>The `properties` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `property`
- Description: (Optional) List of all properties in the object. Structure is [documented below](#nested_properties_property). <a name="nested_properties_property"></a>The `property` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The property key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) The property value. <a name="nested_client_ip_resolution_config"></a>The `client_ip_resolution_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_index_algorithm`
- Description: (Optional) Resolves the client ip based on a custom header. Structure is [documented below](#nested_client_ip_resolution_config_header_index_algorithm). <a name="nested_client_ip_resolution_config_header_index_algorithm"></a>The `header_index_algorithm` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_header_name`
- Description: (Required) The name of the header to extract the client ip from. We are currently only supporting the X-Forwarded-For header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_header_index`
- Description: (Required) The index of the ip in the header. Positive indices 0, 1, 2, 3 chooses indices from the left (first ips). Negative indices -1, -2, -3 chooses indices from the right (last ips).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
