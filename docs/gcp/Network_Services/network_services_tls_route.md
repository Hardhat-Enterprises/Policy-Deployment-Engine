## 🛡️ Policy Deployment Engine: `network_services_tls_route`

This section provides a concise policy evaluation for the `network_services_tls_route` resource in GCP.

Reference: [Terraform Registry – network_services_tls_route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_tls_route)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the TlsRoute resource. | true | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `meshes` | Meshes defines a list of meshes this TlsRoute is attached to, as one of the routing rules to route the requests served by the mesh. Each mesh reference should match the pattern: projects/*/locations/global/meshes/<mesh_name> The attached Mesh should be of a type SIDECAR | false | None | None |
| `gateways` | Gateways defines a list of gateways this TlsRoute is attached to, as one of the routing rules to route the requests served by the gateway. Each gateway reference should match the pattern: projects/*/locations/global/gateways/<gateway_name> | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `matches` | Matches define the predicate used to match requests to a given action. Structure is [documented below](#nested_rules_rules_matches). | true | None | None |
| `action` | Required. A detailed rule defining how to route traffic. Structure is [documented below](#nested_rules_rules_action). | true | None | None |

### matches Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `sni_host` | SNI (server name indicator) to match against. SNI will be matched against all wildcard domains, i.e. www.example.com will be first matched against www.example.com, then *.example.com, then *.com. Partial wildcards are not supported, and values like *w.example.com are invalid. At least one of sniHost and alpn is required. Up to 5 sni hosts across all matches can be set. | false | None | None |
| `alpn` | ALPN (Application-Layer Protocol Negotiation) to match against. Examples: "http/1.1", "h2". At least one of sniHost and alpn is required. Up to 5 alpns across all matches can be set. | false | None | None |

### action Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `destinations` | The destination to which traffic should be forwarded. Structure is [documented below](#nested_rules_rules_action_destinations). | false | None | None |

### destinations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_name` | The URL of a BackendService to route traffic to. | false | None | None |
| `weight` | Specifies the proportion of requests forwarded to the backend referenced by the serviceName field. | false | None | None |
