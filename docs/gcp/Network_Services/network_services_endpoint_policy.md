## 🛡️ Policy Deployment Engine: `network_services_endpoint_policy`

This section provides a concise policy evaluation for the `network_services_endpoint_policy` resource in GCP.

Reference: [Terraform Registry – network_services_endpoint_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_endpoint_policy)

---

## 1. Argument Reference

### `type`
- Description: (Required) The type of endpoint policy. This is primarily used to validate the configuration. Possible values are: `SIDECAR_PROXY`, `GRPC_SERVER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoint_matcher`
- Description: (Required) Required. A matcher that selects endpoints to which the policies should be applied. Structure is [documented below](#nested_endpoint_matcher).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the EndpointPolicy resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the TcpRoute resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A free-text description of the resource. Max length 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorization_policy`
- Description: (Optional) This field specifies the URL of AuthorizationPolicy resource that applies authorization policies to the inbound traffic at the matched endpoints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_tls_policy`
- Description: (Optional) A URL referring to ServerTlsPolicy resource. ServerTlsPolicy is used to determine the authentication policy to be applied to terminate the inbound traffic at the identified backends.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_tls_policy`
- Description: (Optional) A URL referring to a ClientTlsPolicy resource. ClientTlsPolicy can be set to specify the authentication for traffic from the proxy to the actual endpoints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `traffic_port_selector`
- Description: (Optional) Port selector for the (matched) endpoints. If no port selector is provided, the matched config is applied to all ports. Structure is [documented below](#nested_traffic_port_selector).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_endpoint_matcher"></a>The `endpoint_matcher` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata_label_matcher`
- Description: (Required) The matcher is based on node metadata presented by xDS clients. Structure is [documented below](#nested_endpoint_matcher_metadata_label_matcher). <a name="nested_endpoint_matcher_metadata_label_matcher"></a>The `metadata_label_matcher` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata_label_match_criteria`
- Description: (Required) Specifies how matching should be done. Possible values are: `MATCH_ANY`, `MATCH_ALL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata_labels`
- Description: (Optional) The list of label value pairs that must match labels in the provided metadata based on filterMatchCriteria Structure is [documented below](#nested_endpoint_matcher_metadata_label_matcher_metadata_labels). <a name="nested_endpoint_matcher_metadata_label_matcher_metadata_labels"></a>The `metadata_labels` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `label_name`
- Description: (Required) Required. Label name presented as key in xDS Node Metadata.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `label_value`
- Description: (Required) Required. Label value presented as value corresponding to the above key, in xDS Node Metadata. <a name="nested_traffic_port_selector"></a>The `traffic_port_selector` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ports`
- Description: (Required) List of ports. Can be port numbers or port range (example, [80-90] specifies all ports from 80 to 90, including 80 and 90) or named ports or * to specify all ports. If the list is empty, all ports are selected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
