## 🛡️ Policy Deployment Engine: `network_services_endpoint_policy`

This section provides a concise policy evaluation for the `network_services_endpoint_policy` resource in GCP.

Reference: [Terraform Registry – network_services_endpoint_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_endpoint_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The type of endpoint policy. This is primarily used to validate the configuration. Possible values are: `SIDECAR_PROXY`, `GRPC_SERVER`. | true | None | None |
| `name` | Name of the EndpointPolicy resource. | true | None | None |
| `labels` | Set of label tags associated with the TcpRoute resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `authorization_policy` | This field specifies the URL of AuthorizationPolicy resource that applies authorization policies to the inbound traffic at the matched endpoints. | false | None | None |
| `server_tls_policy` | A URL referring to ServerTlsPolicy resource. ServerTlsPolicy is used to determine the authentication policy to be applied to terminate the inbound traffic at the identified backends. | false | None | None |
| `client_tls_policy` | A URL referring to a ClientTlsPolicy resource. ClientTlsPolicy can be set to specify the authentication for traffic from the proxy to the actual endpoints. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### endpoint_matcher Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `metadata_label_matcher` | The matcher is based on node metadata presented by xDS clients. Structure is [documented below](#nested_endpoint_matcher_metadata_label_matcher). | true | None | None |

### traffic_port_selector Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ports` | List of ports. Can be port numbers or port range (example, [80-90] specifies all ports from 80 to 90, including 80 and 90) or named ports or * to specify all ports. If the list is empty, all ports are selected. | true | None | None |

### metadata_label_matcher Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `metadata_label_match_criteria` | Specifies how matching should be done. Possible values are: `MATCH_ANY`, `MATCH_ALL`. | true | None | None |
| `metadata_labels` | The list of label value pairs that must match labels in the provided metadata based on filterMatchCriteria Structure is [documented below](#nested_endpoint_matcher_metadata_label_matcher_metadata_labels). | false | None | None |

### metadata_labels Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `label_name` | Required. Label name presented as key in xDS Node Metadata. | true | None | None |
| `label_value` | Required. Label value presented as value corresponding to the above key, in xDS Node Metadata. | true | None | None |
