## 🛡️ Policy Deployment Engine: `network_services_grpc_route`

This section provides a concise policy evaluation for the `network_services_grpc_route` resource in GCP.

Reference: [Terraform Registry – network_services_grpc_route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_grpc_route)

---

## 1. Argument Reference

### `hostnames`
- Description: (Required) Required. Service hostnames with an optional port for which this route describes traffic.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rules`
- Description: (Required) Rules that define how traffic is routed and handled. Structure is [documented below](#nested_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the GrpcRoute resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the GrpcRoute resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A free-text description of the resource. Max length 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `meshes`
- Description: (Optional) List of meshes this GrpcRoute is attached to, as one of the routing rules to route the requests served by the mesh.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gateways`
- Description: (Optional) List of gateways this GrpcRoute is attached to, as one of the routing rules to route the requests served by the gateway.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) Location (region) of the GRPCRoute resource to be created. Only the value 'global' is currently allowed; defaults to 'global' if omitted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `matches`
- Description: (Optional) Matches define conditions used for matching the rule against incoming gRPC requests. Structure is [documented below](#nested_rules_rules_matches).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Optional) Required. A detailed rule defining how to route traffic. Structure is [documented below](#nested_rules_rules_action). <a name="nested_rules_rules_matches"></a>The `matches` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `headers`
- Description: (Optional) Specifies a list of HTTP request headers to match against. Structure is [documented below](#nested_rules_rules_matches_matches_headers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `method`
- Description: (Optional) A gRPC method to match against. If this field is empty or omitted, will match all methods. Structure is [documented below](#nested_rules_rules_matches_matches_method). <a name="nested_rules_rules_matches_matches_headers"></a>The `headers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) Required. The key of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) Required. The value of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The type of match. Default value is `EXACT`. Possible values are: `TYPE_UNSPECIFIED`, `EXACT`, `REGULAR_EXPRESSION`. <a name="nested_rules_rules_matches_matches_method"></a>The `method` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `grpc_service`
- Description: (Required) Required. Name of the service to match against.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `grpc_method`
- Description: (Required) Required. Name of the method to match against.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `case_sensitive`
- Description: (Optional) Specifies that matches are case sensitive. The default value is true. <a name="nested_rules_rules_action"></a>The `action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destinations`
- Description: (Optional) The destination to which traffic should be forwarded. Structure is [documented below](#nested_rules_rules_action_destinations).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fault_injection_policy`
- Description: (Optional) The specification for fault injection introduced into traffic to test the resiliency of clients to backend service failure. Structure is [documented below](#nested_rules_rules_action_fault_injection_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: (Optional) Specifies the timeout for selected route.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_policy`
- Description: (Optional) Specifies the retry policy associated with this route. Structure is [documented below](#nested_rules_rules_action_retry_policy). <a name="nested_rules_rules_action_destinations"></a>The `destinations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_name`
- Description: (Optional) The URL of a BackendService to route traffic to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weight`
- Description: (Optional) Specifies the proportion of requests forwarded to the backend referenced by the serviceName field. <a name="nested_rules_rules_action_fault_injection_policy"></a>The `fault_injection_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delay`
- Description: (Optional) Specification of how client requests are delayed as part of fault injection before being sent to a destination. Structure is [documented below](#nested_rules_rules_action_fault_injection_policy_delay).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `abort`
- Description: (Optional) Specification of how client requests are aborted as part of fault injection before being sent to a destination. Structure is [documented below](#nested_rules_rules_action_fault_injection_policy_abort). <a name="nested_rules_rules_action_fault_injection_policy_delay"></a>The `delay` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed_delay`
- Description: (Optional) Specify a fixed delay before forwarding the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percentage`
- Description: (Optional) The percentage of traffic on which delay will be injected. <a name="nested_rules_rules_action_fault_injection_policy_abort"></a>The `abort` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_status`
- Description: (Optional) The HTTP status code used to abort the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percentage`
- Description: (Optional) The percentage of traffic which will be aborted. <a name="nested_rules_rules_action_retry_policy"></a>The `retry_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_conditions`
- Description: (Optional) Specifies one or more conditions when this retry policy applies. Each value may be one of: `connect-failure`, `refused-stream`, `cancelled`, `deadline-exceeded`, `resource-exhausted`, `unavailable`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_retries`
- Description: (Optional) Specifies the allowed number of retries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
