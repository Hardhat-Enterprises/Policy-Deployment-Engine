## 🛡️ Policy Deployment Engine: `network_services_gateway`

This section provides a concise policy evaluation for the `network_services_gateway` resource in GCP.

Reference: [Terraform Registry – network_services_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_gateway)

---

## 1. Argument Reference

### `type`
- Description: (Required) Immutable. The type of the customer managed gateway. Possible values are: `OPEN_MESH`, `SECURE_WEB_GATEWAY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ports`
- Description: (Required) One or more port numbers (1-65535), on which the Gateway will receive traffic. The proxy binds to the specified ports. Gateways of type 'SECURE_WEB_GATEWAY' are limited to 1 port. Gateways of type 'OPEN_MESH' listen on 0.0.0.0 for IPv4 and :: for IPv6 and support multiple ports.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the Gateway resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the Gateway resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A free-text description of the resource. Max length 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `addresses`
- Description: (Optional) Zero or one IPv4 or IPv6 address on which the Gateway will receive the traffic. When no address is provided, an IP from the subnetwork is allocated. This field only applies to gateways of type 'SECURE_WEB_GATEWAY'. Gateways of type 'OPEN_MESH' listen on 0.0.0.0 for IPv4 and :: for IPv6.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: (Optional) Immutable. Scope determines how configuration across multiple Gateway instances are merged. The configuration for multiple Gateway instances with the same scope will be merged as presented as a single coniguration to the proxy/load balancer. Max length 64 characters. Scope should start with a letter and can only have letters, numbers, hyphens.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_tls_policy`
- Description: (Optional) A fully-qualified ServerTLSPolicy URL reference. Specifies how TLS traffic is terminated. If empty, TLS termination is disabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `certificate_urls`
- Description: (Optional) A fully-qualified Certificates URL reference. The proxy presents a Certificate (selected based on SNI) when establishing a TLS connection. This feature only applies to gateways of type 'SECURE_WEB_GATEWAY'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gateway_security_policy`
- Description: (Optional) A fully-qualified GatewaySecurityPolicy URL reference. Defines how a server should apply security policy to inbound (VM to Proxy) initiated connections. For example: 'projects/*/locations/*/gatewaySecurityPolicies/swg-policy'. This policy is specific to gateways of type 'SECURE_WEB_GATEWAY'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The relative resource name identifying the VPC network that is using this configuration. For example: 'projects/*/global/networks/network-1'. Currently, this field is specific to gateways of type 'SECURE_WEB_GATEWAY'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: (Optional) The relative resource name identifying the subnetwork in which this SWG is allocated. For example: projects/*/regions/us-central1/subnetworks/network-1. Currently, this field is specific to gateways of type 'SECURE_WEB_GATEWAY'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_version`
- Description: (Optional) The IP Version that will be used by this gateway. Possible values are: `IPV4`, `IPV6`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `envoy_headers`
- Description: (Optional) Determines if envoy will insert internal debug headers into upstream requests. Other Envoy headers may still be injected. By default, envoy will not insert any debug headers. Possible values are: `NONE`, `DEBUG_HEADERS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `routing_mode`
- Description: (Optional) The routing mode of the Gateway. This field is configurable only for gateways of type SECURE_WEB_GATEWAY. This field is required for gateways of type SECURE_WEB_GATEWAY. Possible values are: `NEXT_HOP_ROUTING_MODE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location of the gateway. The default value is `global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_swg_autogen_router_on_destroy`
- Description: If there is no other gateway of type 'SECURE_WEB_GATEWAY' remaining for that region and network it will be deleted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
