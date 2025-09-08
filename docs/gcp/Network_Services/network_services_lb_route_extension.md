## 🛡️ Policy Deployment Engine: `network_services_lb_route_extension`

This section provides a concise policy evaluation for the `network_services_lb_route_extension` resource in GCP.

Reference: [Terraform Registry – network_services_lb_route_extension](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_lb_route_extension)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `forwarding_rules` | A list of references to the forwarding rules to which this service extension is attached to. At least one forwarding rule is required. There can be only one LbRouteExtension resource per forwarding rule. | true | None | None |
| `load_balancing_scheme` | All backend services and forwarding rules referenced by this extension must share the same load balancing scheme. For more information, refer to [Choosing a load balancer](https://cloud.google.com/load-balancing/docs/backend-service) and [Supported application load balancers](https://cloud.google.com/service-extensions/docs/callouts-overview#supported-lbs). Possible values are: `INTERNAL_MANAGED`, `EXTERNAL_MANAGED`. | true | None | None |
| `location` | The location of the route extension | true | None | None |
| `name` | Name of the LbRouteExtension resource in the following format: projects/{project}/locations/{location}/lbRouteExtensions/{lbRouteExtension} | true | None | None |
| `description` | A human-readable description of the resource. | false | None | None |
| `labels` | Set of labels associated with the LbRouteExtension resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### extension_chains Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name for this extension chain. The name is logged as part of the HTTP request logs. The name must conform with RFC-1034, is restricted to lower-cased letters, numbers and hyphens, and can have a maximum length of 63 characters. Additionally, the first character must be a letter and the last character must be a letter or a number. | true | None | None |
| `match_condition` | Conditions under which this chain is invoked for a request. Structure is [documented below](#nested_extension_chains_extension_chains_match_condition). | true | None | None |
| `extensions` | A set of extensions to execute for the matching request. At least one extension is required. Up to 3 extensions can be defined for each extension chain for LbTrafficExtension resource. LbRouteExtension chains are limited to 1 extension per extension chain. Structure is [documented below](#nested_extension_chains_extension_chains_extensions). | true | None | None |

### match_condition Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cel_expression` | A Common Expression Language (CEL) expression that is used to match requests for which the extension chain is executed. | true | None | None |

### extensions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name for this extension. The name is logged as part of the HTTP request logs. The name must conform with RFC-1034, is restricted to lower-cased letters, numbers and hyphens, and can have a maximum length of 63 characters. Additionally, the first character must be a letter and the last a letter or a number. | true | None | None |
| `authority` | The :authority header in the gRPC request sent from Envoy to the extension service. | false | None | None |
| `service` | The reference to the service that runs the extension. Must be a reference to a backend service | true | None | None |
| `timeout` | Specifies the timeout for each individual message on the stream. The timeout must be between 10-1000 milliseconds. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | None | None |
| `fail_open` | Determines how the proxy behaves if the call to the extension fails or times out. When set to TRUE, request or response processing continues without error. Any subsequent extensions in the extension chain are also executed. When set to FALSE: * If response headers have not been delivered to the downstream client, a generic 500 error is returned to the client. The error response can be tailored by configuring a custom error response in the load balancer. | false | None | None |
| `forward_headers` | List of the HTTP headers to forward to the extension (from the client or backend). If omitted, all headers are sent. Each element is a string indicating the header name. | false | None | None |
