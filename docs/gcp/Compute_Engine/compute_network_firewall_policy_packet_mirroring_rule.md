## 🛡️ Policy Deployment Engine: `compute_network_firewall_policy_packet_mirroring_rule`

This section provides a concise policy evaluation for the `compute_network_firewall_policy_packet_mirroring_rule` resource in GCP.

Reference: [Terraform Registry – compute_network_firewall_policy_packet_mirroring_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_firewall_policy_packet_mirroring_rule)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `priority` | An integer indicating the priority of a rule in the list. The priority must be a positive value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest priority. | true | None | None |
| `action` | The Action to perform when the client connection triggers the rule. Valid actions are "mirror", "do_not_mirror", "goto_next". | true | None | None |
| `direction` | The direction in which this rule applies. Possible values are: `INGRESS`, `EGRESS`. | true | None | None |
| `firewall_policy` | The firewall policy of the resource. | true | None | None |
| `rule_name` | An optional name for the rule. This field is not a unique identifier and can be updated. | false | None | None |
| `description` | An optional description for this resource. | false | None | None |
| `security_profile_group` | A fully-qualified URL of a SecurityProfile resource instance. Example: https://networksecurity.googleapis.com/v1/projects/{project}/locations/{location}/securityProfileGroups/my-security-profile-group Must be specified if action = 'mirror' and cannot be specified for other actions. | false | None | None |
| `tls_inspect` | Boolean flag indicating if the traffic should be TLS decrypted. Can be set only if action = 'mirror' and cannot be set for other actions. | false | None | None |
| `disabled` | Denotes whether the firewall policy rule is disabled. When set to true, the firewall policy rule is not enforced and traffic behaves as if it did not exist. If this is unspecified, the firewall policy rule will be enabled. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### match Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `src_ip_ranges` | CIDR IP address range. Maximum number of source CIDR IP ranges allowed is 5000. | false | None | None |
| `dest_ip_ranges` | CIDR IP address range. Maximum number of destination CIDR IP ranges allowed is 5000. | false | None | None |
| `layer4_configs` | Pairs of IP protocols and ports that the rule should match. Structure is [documented below](#nested_match_layer4_configs). | true | None | None |

### target_secure_tags Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the secure tag, created with TagManager's TagValue API. diff_suppress_func: 'tpgresource.CompareSelfLinkOrResourceName' | false | None | None |
| `state` | (Output) State of the secure tag, either EFFECTIVE or INEFFECTIVE. A secure tag is INEFFECTIVE when it is deleted or its network is deleted. | none | None | None |

### layer4_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_protocol` | The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, ipip, sctp), or the IP protocol number. | true | None | None |
| `ports` | An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port. Example inputs include: ["22"], ["80","443"], and ["12345-12349"]. | false | None | None |
