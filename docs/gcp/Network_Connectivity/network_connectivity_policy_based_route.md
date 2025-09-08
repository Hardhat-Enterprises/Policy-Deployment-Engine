## 🛡️ Policy Deployment Engine: `network_connectivity_policy_based_route`

This section provides a concise policy evaluation for the `network_connectivity_policy_based_route` resource in GCP.

Reference: [Terraform Registry – network_connectivity_policy_based_route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_policy_based_route)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the policy based route. | true | None | None |
| `network` | Fully-qualified URL of the network that this route applies to, for example: projects/my-project/global/networks/my-network. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `labels` | User-defined labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `next_hop_other_routes` | Other routes that will be referenced to determine the next hop of the packet. Possible values are: `DEFAULT_ROUTING`. | false | None | None |
| `next_hop_ilb_ip` | The IP address of a global-access-enabled L4 ILB that is the next hop for matching packets. | false | None | None |
| `priority` | The priority of this policy-based route. Priority is used to break ties in cases where there are more than one matching policy-based routes found. In cases where multiple policy-based routes are matched, the one with the lowest-numbered priority value wins. The default value is 1000. The priority value must be from 1 to 65535, inclusive. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### filter Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `protocol_version` | Internet protocol versions this policy-based route applies to. Possible values are: `IPV4`, `IPV6`. | true | None | None |
| `ip_protocol` | The IP protocol that this policy-based route applies to. Valid values are 'TCP', 'UDP', and 'ALL'. Default is 'ALL'. | false | None | None |
| `src_range` | The source IP range of outgoing packets that this policy-based route applies to. Default is "0.0.0.0/0". | false | None | None |
| `dest_range` | The destination IP range of outgoing packets that this policy-based route applies to. Default is "0.0.0.0/0". | false | None | None |

### virtual_machine Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `tags` | A list of VM instance tags that this policy-based route applies to. VM instances that have ANY of tags specified here will install this PBR. | true | None | None |

### interconnect_attachment Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `region` | Cloud region to install this policy-based route on for Interconnect attachments. Use `all` to install it on all Interconnect attachments. | true | None | None |
