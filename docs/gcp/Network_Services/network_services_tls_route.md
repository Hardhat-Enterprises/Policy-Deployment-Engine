## 🛡️ Policy Deployment Engine: `network_services_tls_route`

This section provides a concise policy evaluation for the `network_services_tls_route` resource in GCP.

Reference: [Terraform Registry – network_services_tls_route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_tls_route)

---

## 1. Argument Reference

### `rules`
- Description: (Required) Rules that define how traffic is routed and handled. Structure is [documented below](#nested_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the TlsRoute resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A free-text description of the resource. Max length 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `meshes`
- Description: (Optional) Meshes defines a list of meshes this TlsRoute is attached to, as one of the routing rules to route the requests served by the mesh. Each mesh reference should match the pattern: projects/*/locations/global/meshes/<mesh_name> The attached Mesh should be of a type SIDECAR
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gateways`
- Description: (Optional) Gateways defines a list of gateways this TlsRoute is attached to, as one of the routing rules to route the requests served by the gateway. Each gateway reference should match the pattern: projects/*/locations/global/gateways/<gateway_name>
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `matches`
- Description: (Required) Matches define the predicate used to match requests to a given action. Structure is [documented below](#nested_rules_rules_matches).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Required) Required. A detailed rule defining how to route traffic. Structure is [documented below](#nested_rules_rules_action). <a name="nested_rules_rules_matches"></a>The `matches` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sni_host`
- Description: (Optional) SNI (server name indicator) to match against. SNI will be matched against all wildcard domains, i.e. www.example.com will be first matched against www.example.com, then *.example.com, then *.com. Partial wildcards are not supported, and values like *w.example.com are invalid. At least one of sniHost and alpn is required. Up to 5 sni hosts across all matches can be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `alpn`
- Description: (Optional) ALPN (Application-Layer Protocol Negotiation) to match against. Examples: "http/1.1", "h2". At least one of sniHost and alpn is required. Up to 5 alpns across all matches can be set. <a name="nested_rules_rules_action"></a>The `action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destinations`
- Description: (Optional) The destination to which traffic should be forwarded. Structure is [documented below](#nested_rules_rules_action_destinations). <a name="nested_rules_rules_action_destinations"></a>The `destinations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_name`
- Description: (Optional) The URL of a BackendService to route traffic to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weight`
- Description: (Optional) Specifies the proportion of requests forwarded to the backend referenced by the serviceName field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
