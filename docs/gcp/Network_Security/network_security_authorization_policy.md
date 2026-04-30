## 🛡️ Policy Deployment Engine: `network_security_authorization_policy`

This section provides a concise policy evaluation for the `network_security_authorization_policy` resource in GCP.

Reference: [Terraform Registry – network_security_authorization_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_authorization_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `action` | The action to take when a rule match is found. Possible values are "ALLOW" or "DENY". | true | true | Only allow action value `ALLOW`. | ['"ALLOW"'] | ['"DENY"'] |
| `name` | Name of the AuthorizationPolicy resource. | true | false | None | None | None |
| `labels` | Set of label tags associated with the AuthorizationPolicy resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | false | None | None | None |
| `rules` | List of rules to match. Note that at least one of the rules must match in order for the action specified in the 'action' field to be taken. A rule is a match if there is a matching source and destination. If left blank, the action specified in the action field will be applied on every request. Structure is [documented below](#nested_rules). | false | false | None | None | None |
| `location` | The location of the authorization policy. The default value is `global`. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `sources` |  | false | false | None | None | None |
| `destinations` |  | false | false | None | None | None |
| `http_header_match` |  | false | false | None | None | None |

### rules Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `sources` | List of attributes for the traffic source. All of the sources must match. A source is a match if both principals and ipBlocks match. If not set, the action specified in the 'action' field will be applied without any rule checks for the source. Structure is [documented below](#nested_rules_rules_sources). | false | false | None | None | None |
| `destinations` | List of attributes for the traffic destination. All of the destinations must match. A destination is a match if a request matches all the specified hosts, ports, methods and headers. If not set, the action specified in the 'action' field will be applied without any rule checks for the destination. Structure is [documented below](#nested_rules_rules_destinations). | false | false | None | None | None |

### sources Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principals` | List of peer identities to match for authorization. At least one principal should match. Each peer can be an exact match, or a prefix match (example, "namespace/*") or a suffix match (example, "*/service-account") or a presence match "*". Authorization based on the principal name without certificate validation (configured by ServerTlsPolicy resource) is considered insecure. | false | false | None | None | None |
| `ip_blocks` | List of CIDR ranges to match based on source IP address. At least one IP block should match. Single IP (e.g., "1.2.3.4") and CIDR (e.g., "1.2.3.0/24") are supported. Authorization based on source IP alone should be avoided. The IP addresses of any load balancers or proxies should be considered untrusted. | false | false | None | None | None |

### destinations Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `hosts` | List of destination hosts to match in the authorization policy rule. | true | true | Only allow example.com | ['example.com'] | ['name.com'] |
| `ports` | List of destination ports to match. This policy only allows HTTPS traffic on port 443. | true | true | The policy.rego uses a whitelist check on the attribute path ["rules", 0, "destinations", 0, "ports"] and only permits the value 443. The non-compliant configuration sets ports = [80], which violates the policy. | [443] | [80] |
| `methods` | List of HTTP methods to match. | true | true | Restricts authorization policy destination methods to GET only. | ['GET'] | ['DELETE'] |
| `http_header_match` | Match against key:value pair in http header. Provides a flexible match based on HTTP headers, for potentially advanced use cases. At least one header should match. Avoid using header matches to make authorization decisions unless there is a strong guarantee that requests arrive through a trusted client or proxy. Structure is [documented below](#nested_rules_rules_destinations_destinations_http_header_match). | false | false | None | None | None |

### http_header_match Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `header_name` | The name of the HTTP header to match. For matching against the HTTP request's authority, use a headerMatch with the header name ":authority". For matching a request's method, use the headerName ":method". | true | false | None | None | None |
| `regex_match` | The value of the header must match the regular expression specified in regexMatch. For regular expression grammar, please see: en.cppreference.com/w/cpp/regex/ecmascript For matching against a port specified in the HTTP request, use a headerMatch with headerName set to Host and a regular expression that satisfies the RFC2616 Host header's port specifier. | true | false | None | None | None |
