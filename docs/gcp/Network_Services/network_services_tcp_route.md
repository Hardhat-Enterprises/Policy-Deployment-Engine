## 🛡️ Policy Deployment Engine: `network_services_tcp_route`

This section provides a concise policy evaluation for the `network_services_tcp_route` resource in GCP.

Reference: [Terraform Registry – network_services_tcp_route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_tcp_route)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the TcpRoute resource. | true | None | None |
| `labels` | Set of label tags associated with the TcpRoute resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `meshes` | Meshes defines a list of meshes this TcpRoute is attached to, as one of the routing rules to route the requests served by the mesh. Each mesh reference should match the pattern: projects/*/locations/global/meshes/<mesh_name> The attached Mesh should be of a type SIDECAR | false | None | None |
| `gateways` | Gateways defines a list of gateways this TcpRoute is attached to, as one of the routing rules to route the requests served by the gateway. Each gateway reference should match the pattern: projects/*/locations/global/gateways/<gateway_name> | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `matches` | RouteMatch defines the predicate used to match requests to a given action. Multiple match types are "OR"ed for evaluation. If no routeMatch field is specified, this rule will unconditionally match traffic. Structure is [documented below](#nested_rules_rules_matches). | false | None | None |
| `action` | A detailed rule defining how to route traffic. Structure is [documented below](#nested_rules_rules_action). | true | None | None |

### matches Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `address` | Must be specified in the CIDR range format. A CIDR range consists of an IP Address and a prefix length to construct the subnet mask. By default, the prefix length is 32 (i.e. matches a single IP address). Only IPV4 addresses are supported. Examples: "10.0.0.1" - matches against this exact IP address. "10.0.0.0/8" - matches against any IP address within the 10.0.0.0 subnet and 255.255.255.0 mask. "0.0.0.0/0" - matches against any IP address'. | true | None | None |
| `port` | Specifies the destination port to match against. | true | None | None |

### action Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `destinations` | The destination services to which traffic should be forwarded. At least one destination service is required. Structure is [documented below](#nested_rules_rules_action_destinations). | false | None | None |
| `original_destination` | If true, Router will use the destination IP and port of the original connection as the destination of the request. | false | None | None |
| `idle_timeout` | Specifies the idle timeout for the selected route. The idle timeout is defined as the period in which there are no bytes sent or received on either the upstream or downstream connection. If not set, the default idle timeout is 30 seconds. If set to 0s, the timeout will be disabled. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | None | None |

### destinations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_name` | The URL of a BackendService to route traffic to. | false | None | None |
| `weight` | Specifies the proportion of requests forwarded to the backend referenced by the serviceName field. This is computed as: weight/Sum(weights in this destination list). For non-zero values, there may be some epsilon from the exact proportion defined here depending on the precision an implementation supports. If only one serviceName is specified and it has a weight greater than 0, 100% of the traffic is forwarded to that backend. If weights are specified for any one service name, they need to be specified for all of them. If weights are unspecified for all services, then, traffic is distributed in equal proportions to all of them. | false | None | None |
