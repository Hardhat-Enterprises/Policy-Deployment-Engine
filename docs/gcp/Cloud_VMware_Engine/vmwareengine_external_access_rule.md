## 🛡️ Policy Deployment Engine: `vmwareengine_external_access_rule`

This section provides a concise policy evaluation for the `vmwareengine_external_access_rule` resource in GCP.

Reference: [Terraform Registry – vmwareengine_external_access_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_external_access_rule)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `priority` | External access rule priority, which determines the external access rule to use when multiple rules apply. | true | None | None |
| `action` | The action that the external access rule performs. Possible values are: `ALLOW`, `DENY`. | true | None | None |
| `ip_protocol` | The IP protocol to which the external access rule applies. | true | None | None |
| `source_ports` | A list of source ports to which the external access rule applies. | true | None | None |
| `destination_ports` | A list of destination ports to which the external access rule applies. | true | None | None |
| `parent` | The resource name of the network policy. Resource names are schemeless URIs that follow the conventions in https://cloud.google.com/apis/design/resource_names. For example: projects/my-project/locations/us-west1-a/networkPolicies/my-policy | true | None | None |
| `name` | The ID of the external access rule. | true | None | None |
| `description` | User-provided description for the external access rule. | false | None | None |

### source_ip_ranges Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_address` | A single IP address. | false | None | None |
| `ip_address_range` | An IP address range in the CIDR format. | false | None | None |

### destination_ip_ranges Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_address_range` | An IP address range in the CIDR format. | false | None | None |
| `external_address` | The name of an `ExternalAddress` resource. | false | None | None |
