## 🛡️ Policy Deployment Engine: `network_security_authorization_policy`

This section provides a concise policy evaluation for the `network_security_authorization_policy` resource in GCP.

Reference: [Terraform Registry – network_security_authorization_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_authorization_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `action` | The action to take when a rule match is found. Possible values are "ALLOW" or "DENY". Possible values are: `ALLOW`, `DENY`. | true | None | None |
| `name` | Name of the AuthorizationPolicy resource. | true | None | None |
| `labels` | Set of label tags associated with the AuthorizationPolicy resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `location` | The location of the authorization policy. The default value is `global`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `sources` | List of attributes for the traffic source. All of the sources must match. A source is a match if both principals and ipBlocks match. If not set, the action specified in the 'action' field will be applied without any rule checks for the source. Structure is [documented below](#nested_rules_rules_sources). | false | None | None |
| `destinations` | List of attributes for the traffic destination. All of the destinations must match. A destination is a match if a request matches all the specified hosts, ports, methods and headers. If not set, the action specified in the 'action' field will be applied without any rule checks for the destination. Structure is [documented below](#nested_rules_rules_destinations). | false | None | None |

### sources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `principals` | List of peer identities to match for authorization. At least one principal should match. Each peer can be an exact match, or a prefix match (example, "namespace/*") or a suffix match (example, "*/service-account") or a presence match "*". Authorization based on the principal name without certificate validation (configured by ServerTlsPolicy resource) is considered insecure. | false | None | None |
| `ip_blocks` | List of CIDR ranges to match based on source IP address. At least one IP block should match. Single IP (e.g., "1.2.3.4") and CIDR (e.g., "1.2.3.0/24") are supported. Authorization based on source IP alone should be avoided. The IP addresses of any load balancers or proxies should be considered untrusted. | false | None | None |

### destinations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hosts` | List of host names to match. Matched against the ":authority" header in http requests. At least one host should match. Each host can be an exact match, or a prefix match (example "mydomain.*") or a suffix match (example "*.myorg.com") or a presence (any) match "*". | true | None | None |
| `ports` | List of destination ports to match. At least one port should match. | true | None | None |
| `methods` | A list of HTTP methods to match. At least one method should match. Should not be set for gRPC services. | true | None | None |
| `http_header_match` | Match against key:value pair in http header. Provides a flexible match based on HTTP headers, for potentially advanced use cases. At least one header should match. Avoid using header matches to make authorization decisions unless there is a strong guarantee that requests arrive through a trusted client or proxy. Structure is [documented below](#nested_rules_rules_destinations_destinations_http_header_match). | false | None | None |

### http_header_match Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `header_name` | The name of the HTTP header to match. For matching against the HTTP request's authority, use a headerMatch with the header name ":authority". For matching a request's method, use the headerName ":method". | true | None | None |
| `regex_match` | The value of the header must match the regular expression specified in regexMatch. For regular expression grammar, please see: en.cppreference.com/w/cpp/regex/ecmascript For matching against a port specified in the HTTP request, use a headerMatch with headerName set to Host and a regular expression that satisfies the RFC2616 Host header's port specifier. | true | None | None |
