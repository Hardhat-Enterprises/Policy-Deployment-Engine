## 🛡️ Policy Deployment Engine: `compute_organization_security_policy_rule`

This section provides a concise policy evaluation for the `compute_organization_security_policy_rule` resource in GCP.

Reference: [Terraform Registry – compute_organization_security_policy_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_organization_security_policy_rule)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `priority` | An integer indicating the priority of a rule in the list. The priority must be a value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest prority. | true | None | None |
| `action` | The Action to perform when the client connection triggers the rule. Can currently be either "allow", "deny" or "goto_next". | true | None | None |
| `policy_id` | The ID of the OrganizationSecurityPolicy this rule applies to. | true | None | None |
| `description` | A description of the rule. | false | None | None |
| `preview` | If set to true, the specified action is not enforced. | false | None | None |
| `direction` | The direction in which this rule applies. If unspecified an INGRESS rule is created. Possible values are: `INGRESS`, `EGRESS`. | false | None | None |
| `target_resources` | A list of network resource URLs to which this rule applies. This field allows you to control which network's VMs get this rule. If this field is left blank, all VMs within the organization will receive the rule. | false | None | None |
| `enable_logging` | Denotes whether to enable logging for a particular rule. If logging is enabled, logs will be exported to the configured export destination in Stackdriver. | false | None | None |
| `target_service_accounts` | A list of service accounts indicating the sets of instances that are applied with this rule. | false | None | None |

### match Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | A description of the rule. | false | None | None |
| `versioned_expr` | Preconfigured versioned expression. For organization security policy rules, the only supported type is "FIREWALL". Default value is `FIREWALL`. Possible values are: `FIREWALL`. | false | None | None |
| `config` | The configuration options for matching the rule. Structure is [documented below](#nested_match_config). | true | None | None |

### config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `src_ip_ranges` | Source IP address range in CIDR format. Required for INGRESS rules. | false | None | None |
| `dest_ip_ranges` | Destination IP address range in CIDR format. Required for EGRESS rules. | false | None | None |
| `layer4_config` | Pairs of IP protocols and ports that the rule should match. Structure is [documented below](#nested_match_config_layer4_config). | true | None | None |

### layer4_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_protocol` | The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, ipip, sctp), or the IP protocol number. | true | None | None |
| `ports` | An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port. Example inputs include: ["22"], ["80","443"], and ["12345-12349"]. | false | None | None |
