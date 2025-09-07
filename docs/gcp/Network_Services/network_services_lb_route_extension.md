## 🛡️ Policy Deployment Engine: `network_services_lb_route_extension`

This section provides a concise policy evaluation for the `network_services_lb_route_extension` resource in GCP.

Reference: [Terraform Registry – network_services_lb_route_extension](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_lb_route_extension)

---

## 1. Argument Reference

### `forwarding_rules`
- Description: (Required) A list of references to the forwarding rules to which this service extension is attached to. At least one forwarding rule is required. There can be only one LbRouteExtension resource per forwarding rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `extension_chains`
- Description: (Required) A set of ordered extension chains that contain the match conditions and extensions to execute. Match conditions for each extension chain are evaluated in sequence for a given request. The first extension chain that has a condition that matches the request is executed. Any subsequent extension chains do not execute. Limited to 5 extension chains per resource. Structure is [documented below](#nested_extension_chains).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `load_balancing_scheme`
- Description: (Required) All backend services and forwarding rules referenced by this extension must share the same load balancing scheme. For more information, refer to [Choosing a load balancer](https://cloud.google.com/load-balancing/docs/backend-service) and [Supported application load balancers](https://cloud.google.com/service-extensions/docs/callouts-overview#supported-lbs). Possible values are: `INTERNAL_MANAGED`, `EXTERNAL_MANAGED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the route extension
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the LbRouteExtension resource in the following format: projects/{project}/locations/{location}/lbRouteExtensions/{lbRouteExtension}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human-readable description of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of labels associated with the LbRouteExtension resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_extension_chains"></a>The `extension_chains` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name for this extension chain. The name is logged as part of the HTTP request logs. The name must conform with RFC-1034, is restricted to lower-cased letters, numbers and hyphens, and can have a maximum length of 63 characters. Additionally, the first character must be a letter and the last character must be a letter or a number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match_condition`
- Description: (Required) Conditions under which this chain is invoked for a request. Structure is [documented below](#nested_extension_chains_extension_chains_match_condition).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `extensions`
- Description: (Required) A set of extensions to execute for the matching request. At least one extension is required. Up to 3 extensions can be defined for each extension chain for LbTrafficExtension resource. LbRouteExtension chains are limited to 1 extension per extension chain. Structure is [documented below](#nested_extension_chains_extension_chains_extensions). <a name="nested_extension_chains_extension_chains_match_condition"></a>The `match_condition` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cel_expression`
- Description: (Required) A Common Expression Language (CEL) expression that is used to match requests for which the extension chain is executed. <a name="nested_extension_chains_extension_chains_extensions"></a>The `extensions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name for this extension. The name is logged as part of the HTTP request logs. The name must conform with RFC-1034, is restricted to lower-cased letters, numbers and hyphens, and can have a maximum length of 63 characters. Additionally, the first character must be a letter and the last a letter or a number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authority`
- Description: (Optional) The :authority header in the gRPC request sent from Envoy to the extension service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) The reference to the service that runs the extension. Must be a reference to a backend service
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: (Optional) Specifies the timeout for each individual message on the stream. The timeout must be between 10-1000 milliseconds. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fail_open`
- Description: (Optional) Determines how the proxy behaves if the call to the extension fails or times out. When set to TRUE, request or response processing continues without error. Any subsequent extensions in the extension chain are also executed. When set to FALSE: * If response headers have not been delivered to the downstream client, a generic 500 error is returned to the client. The error response can be tailored by configuring a custom error response in the load balancer.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `forward_headers`
- Description: (Optional) List of the HTTP headers to forward to the extension (from the client or backend). If omitted, all headers are sent. Each element is a string indicating the header name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
