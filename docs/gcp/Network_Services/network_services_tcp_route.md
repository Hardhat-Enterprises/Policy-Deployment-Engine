## 🛡️ Policy Deployment Engine: `network_services_tcp_route`

This section provides a concise policy evaluation for the `network_services_tcp_route` resource in GCP.

Reference: [Terraform Registry – network_services_tcp_route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_tcp_route)

---

## 1. Argument Reference

### `rules`
- Description: (Required) Rules that define how traffic is routed and handled. At least one RouteRule must be supplied. If there are multiple rules then the action taken will be the first rule to match. Structure is [documented below](#nested_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the TcpRoute resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the TcpRoute resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A free-text description of the resource. Max length 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `meshes`
- Description: (Optional) Meshes defines a list of meshes this TcpRoute is attached to, as one of the routing rules to route the requests served by the mesh. Each mesh reference should match the pattern: projects/*/locations/global/meshes/<mesh_name> The attached Mesh should be of a type SIDECAR
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gateways`
- Description: (Optional) Gateways defines a list of gateways this TcpRoute is attached to, as one of the routing rules to route the requests served by the gateway. Each gateway reference should match the pattern: projects/*/locations/global/gateways/<gateway_name>
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `matches`
- Description: (Optional) RouteMatch defines the predicate used to match requests to a given action. Multiple match types are "OR"ed for evaluation. If no routeMatch field is specified, this rule will unconditionally match traffic. Structure is [documented below](#nested_rules_rules_matches).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Required) A detailed rule defining how to route traffic. Structure is [documented below](#nested_rules_rules_action). <a name="nested_rules_rules_matches"></a>The `matches` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `address`
- Description: (Required) Must be specified in the CIDR range format. A CIDR range consists of an IP Address and a prefix length to construct the subnet mask. By default, the prefix length is 32 (i.e. matches a single IP address). Only IPV4 addresses are supported. Examples: "10.0.0.1" - matches against this exact IP address. "10.0.0.0/8" - matches against any IP address within the 10.0.0.0 subnet and 255.255.255.0 mask. "0.0.0.0/0" - matches against any IP address'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Required) Specifies the destination port to match against. <a name="nested_rules_rules_action"></a>The `action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destinations`
- Description: (Optional) The destination services to which traffic should be forwarded. At least one destination service is required. Structure is [documented below](#nested_rules_rules_action_destinations).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `original_destination`
- Description: (Optional) If true, Router will use the destination IP and port of the original connection as the destination of the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idle_timeout`
- Description: (Optional) Specifies the idle timeout for the selected route. The idle timeout is defined as the period in which there are no bytes sent or received on either the upstream or downstream connection. If not set, the default idle timeout is 30 seconds. If set to 0s, the timeout will be disabled. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". <a name="nested_rules_rules_action_destinations"></a>The `destinations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_name`
- Description: (Optional) The URL of a BackendService to route traffic to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weight`
- Description: (Optional) Specifies the proportion of requests forwarded to the backend referenced by the serviceName field. This is computed as: weight/Sum(weights in this destination list). For non-zero values, there may be some epsilon from the exact proportion defined here depending on the precision an implementation supports. If only one serviceName is specified and it has a weight greater than 0, 100% of the traffic is forwarded to that backend. If weights are specified for any one service name, they need to be specified for all of them. If weights are unspecified for all services, then, traffic is distributed in equal proportions to all of them.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
