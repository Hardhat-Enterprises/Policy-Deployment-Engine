## 🛡️ Policy Deployment Engine: `network_security_authorization_policy`

This section provides a concise policy evaluation for the `network_security_authorization_policy` resource in GCP.

Reference: [Terraform Registry – network_security_authorization_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_security_authorization_policy)

---

## 1. Argument Reference

### `action`
- Description: (Required) The action to take when a rule match is found. Possible values are "ALLOW" or "DENY". Possible values are: `ALLOW`, `DENY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the AuthorizationPolicy resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the AuthorizationPolicy resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A free-text description of the resource. Max length 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rules`
- Description: (Optional) List of rules to match. Note that at least one of the rules must match in order for the action specified in the 'action' field to be taken. A rule is a match if there is a matching source and destination. If left blank, the action specified in the action field will be applied on every request. Structure is [documented below](#nested_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location of the authorization policy. The default value is `global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sources`
- Description: (Optional) List of attributes for the traffic source. All of the sources must match. A source is a match if both principals and ipBlocks match. If not set, the action specified in the 'action' field will be applied without any rule checks for the source. Structure is [documented below](#nested_rules_rules_sources).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destinations`
- Description: (Optional) List of attributes for the traffic destination. All of the destinations must match. A destination is a match if a request matches all the specified hosts, ports, methods and headers. If not set, the action specified in the 'action' field will be applied without any rule checks for the destination. Structure is [documented below](#nested_rules_rules_destinations). <a name="nested_rules_rules_sources"></a>The `sources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `principals`
- Description: (Optional) List of peer identities to match for authorization. At least one principal should match. Each peer can be an exact match, or a prefix match (example, "namespace/*") or a suffix match (example, "*/service-account") or a presence match "*". Authorization based on the principal name without certificate validation (configured by ServerTlsPolicy resource) is considered insecure.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_blocks`
- Description: (Optional) List of CIDR ranges to match based on source IP address. At least one IP block should match. Single IP (e.g., "1.2.3.4") and CIDR (e.g., "1.2.3.0/24") are supported. Authorization based on source IP alone should be avoided. The IP addresses of any load balancers or proxies should be considered untrusted. <a name="nested_rules_rules_destinations"></a>The `destinations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hosts`
- Description: (Required) List of host names to match. Matched against the ":authority" header in http requests. At least one host should match. Each host can be an exact match, or a prefix match (example "mydomain.*") or a suffix match (example "*.myorg.com") or a presence (any) match "*".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ports`
- Description: (Required) List of destination ports to match. At least one port should match.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `methods`
- Description: (Required) A list of HTTP methods to match. At least one method should match. Should not be set for gRPC services.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_header_match`
- Description: (Optional) Match against key:value pair in http header. Provides a flexible match based on HTTP headers, for potentially advanced use cases. At least one header should match. Avoid using header matches to make authorization decisions unless there is a strong guarantee that requests arrive through a trusted client or proxy. Structure is [documented below](#nested_rules_rules_destinations_destinations_http_header_match). <a name="nested_rules_rules_destinations_destinations_http_header_match"></a>The `http_header_match` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the HTTP header to match. For matching against the HTTP request's authority, use a headerMatch with the header name ":authority". For matching a request's method, use the headerName ":method".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex_match`
- Description: (Required) The value of the header must match the regular expression specified in regexMatch. For regular expression grammar, please see: en.cppreference.com/w/cpp/regex/ecmascript For matching against a port specified in the HTTP request, use a headerMatch with headerName set to Host and a regular expression that satisfies the RFC2616 Host header's port specifier.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
