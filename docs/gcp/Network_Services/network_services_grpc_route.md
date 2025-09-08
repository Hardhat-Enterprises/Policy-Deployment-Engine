## 🛡️ Policy Deployment Engine: `network_services_grpc_route`

This section provides a concise policy evaluation for the `network_services_grpc_route` resource in GCP.

Reference: [Terraform Registry – network_services_grpc_route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_grpc_route)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hostnames` | Required. Service hostnames with an optional port for which this route describes traffic. | true | None | None |
| `name` | Name of the GrpcRoute resource. | true | None | None |
| `labels` | Set of label tags associated with the GrpcRoute resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `meshes` | List of meshes this GrpcRoute is attached to, as one of the routing rules to route the requests served by the mesh. | false | None | None |
| `gateways` | List of gateways this GrpcRoute is attached to, as one of the routing rules to route the requests served by the gateway. | false | None | None |
| `location` | Location (region) of the GRPCRoute resource to be created. Only the value 'global' is currently allowed; defaults to 'global' if omitted. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `matches` | Matches define conditions used for matching the rule against incoming gRPC requests. Structure is [documented below](#nested_rules_rules_matches). | false | None | None |
| `action` | Required. A detailed rule defining how to route traffic. Structure is [documented below](#nested_rules_rules_action). | false | None | None |

### matches Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `headers` | Specifies a list of HTTP request headers to match against. Structure is [documented below](#nested_rules_rules_matches_matches_headers). | false | None | None |
| `method` | A gRPC method to match against. If this field is empty or omitted, will match all methods. Structure is [documented below](#nested_rules_rules_matches_matches_method). | false | None | None |

### headers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | Required. The key of the header. | true | None | None |
| `value` | Required. The value of the header. | true | None | None |
| `type` | The type of match. Default value is `EXACT`. Possible values are: `TYPE_UNSPECIFIED`, `EXACT`, `REGULAR_EXPRESSION`. | false | None | None |

### method Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `grpc_service` | Required. Name of the service to match against. | true | None | None |
| `grpc_method` | Required. Name of the method to match against. | true | None | None |
| `case_sensitive` | Specifies that matches are case sensitive. The default value is true. | false | None | None |

### action Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `destinations` | The destination to which traffic should be forwarded. Structure is [documented below](#nested_rules_rules_action_destinations). | false | None | None |
| `fault_injection_policy` | The specification for fault injection introduced into traffic to test the resiliency of clients to backend service failure. Structure is [documented below](#nested_rules_rules_action_fault_injection_policy). | false | None | None |
| `timeout` | Specifies the timeout for selected route. | false | None | None |
| `retry_policy` | Specifies the retry policy associated with this route. Structure is [documented below](#nested_rules_rules_action_retry_policy). | false | None | None |

### destinations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_name` | The URL of a BackendService to route traffic to. | false | None | None |
| `weight` | Specifies the proportion of requests forwarded to the backend referenced by the serviceName field. | false | None | None |

### fault_injection_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `delay` | Specification of how client requests are delayed as part of fault injection before being sent to a destination. Structure is [documented below](#nested_rules_rules_action_fault_injection_policy_delay). | false | None | None |
| `abort` | Specification of how client requests are aborted as part of fault injection before being sent to a destination. Structure is [documented below](#nested_rules_rules_action_fault_injection_policy_abort). | false | None | None |

### delay Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `fixed_delay` | Specify a fixed delay before forwarding the request. | false | None | None |
| `percentage` | The percentage of traffic on which delay will be injected. | false | None | None |

### abort Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `http_status` | The HTTP status code used to abort the request. | false | None | None |
| `percentage` | The percentage of traffic which will be aborted. | false | None | None |

### retry_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `retry_conditions` | Specifies one or more conditions when this retry policy applies. Each value may be one of: `connect-failure`, `refused-stream`, `cancelled`, `deadline-exceeded`, `resource-exhausted`, `unavailable`. | false | None | None |
| `num_retries` | Specifies the allowed number of retries. | false | None | None |
