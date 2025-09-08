## 🛡️ Policy Deployment Engine: `compute_firewall_policy_with_rules`

This section provides a concise policy evaluation for the `compute_firewall_policy_with_rules` resource in GCP.

Reference: [Terraform Registry – compute_firewall_policy_with_rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall_policy_with_rules)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `short_name` | A textual name of the security policy. | true | None | None |
| `parent` | The parent of this FirewallPolicy in the Cloud Resource Hierarchy. Format: organizations/{organization_id} or folders/{folder_id} | true | None | None |
| `description` | An optional description of this resource. | false | None | None |

### rule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | A description of the rule. | false | None | None |
| `rule_name` | An optional name for the rule. This field is not a unique identifier and can be updated. | false | None | None |
| `priority` | An integer indicating the priority of a rule in the list. The priority must be a value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest priority. | true | None | None |
| `match` | A match condition that incoming traffic is evaluated against. If it evaluates to true, the corresponding 'action' is enforced. Structure is [documented below](#nested_rule_rule_match). | true | None | None |
| `target_secure_tag` | A list of secure tags that controls which instances the firewall rule applies to. If <code>targetSecureTag</code> are specified, then the firewall rule applies only to instances in the VPC network that have one of those EFFECTIVE secure tags, if all the target_secure_tag are in INEFFECTIVE state, then this rule will be ignored. <code>targetSecureTag</code> may not be set at the same time as <code>targetServiceAccounts</code>. If neither <code>targetServiceAccounts</code> nor <code>targetSecureTag</code> are specified, the firewall rule applies to all instances on the specified network. Maximum number of target secure tags allowed is 256. Structure is [documented below](#nested_rule_rule_target_secure_tag). | false | None | None |
| `action` | The Action to perform when the client connection triggers the rule. Can currently be either "allow", "deny", "apply_security_profile_group" or "goto_next". | true | None | None |
| `direction` | The direction in which this rule applies. If unspecified an INGRESS rule is created. Possible values are: `INGRESS`, `EGRESS`. | false | None | None |
| `enable_logging` | Denotes whether to enable logging for a particular rule. If logging is enabled, logs will be exported to the configured export destination in Stackdriver. | false | None | None |
| `target_service_accounts` | A list of service accounts indicating the sets of instances that are applied with this rule. | false | None | None |
| `security_profile_group` | A fully-qualified URL of a SecurityProfile resource instance. Example: https://networksecurity.googleapis.com/v1/projects/{project}/locations/{location}/securityProfileGroups/my-security-profile-group Must be specified if action is 'apply_security_profile_group'. | false | None | None |
| `tls_inspect` | Boolean flag indicating if the traffic should be TLS decrypted. It can be set only if action = 'apply_security_profile_group' and cannot be set for other actions. | false | None | None |
| `target_resources` | A list of network resource URLs to which this rule applies. This field allows you to control which network's VMs get this rule. If this field is left blank, all VMs within the organization will receive the rule. | false | None | None |
| `disabled` | Denotes whether the firewall policy rule is disabled. When set to true, the firewall policy rule is not enforced and traffic behaves as if it did not exist. If this is unspecified, the firewall policy rule will be enabled. | false | None | None |

### match Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `src_ip_ranges` | Source IP address range in CIDR format. Required for INGRESS rules. | false | None | None |
| `dest_ip_ranges` | Destination IP address range in CIDR format. Required for EGRESS rules. | false | None | None |
| `src_address_groups` | Address groups which should be matched against the traffic source. Maximum number of source address groups is 10. | false | None | None |
| `dest_address_groups` | Address groups which should be matched against the traffic destination. Maximum number of destination address groups is 10. | false | None | None |
| `src_fqdns` | Fully Qualified Domain Name (FQDN) which should be matched against traffic source. Maximum number of source fqdn allowed is 100. | false | None | None |
| `dest_fqdns` | Fully Qualified Domain Name (FQDN) which should be matched against traffic destination. Maximum number of destination fqdn allowed is 100. | false | None | None |
| `src_network_scope` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Network scope of the traffic source. Possible values are: `INTERNET`, `INTRA_VPC`, `NON_INTERNET`, `VPC_NETWORKS`. | false | None | None |
| `src_networks` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Networks of the traffic source. It can be either a full or partial url. | false | None | None |
| `dest_network_scope` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Network scope of the traffic destination. Possible values are: `INTERNET`, `INTRA_VPC`, `NON_INTERNET`, `VPC_NETWORKS`. | false | None | None |
| `src_region_codes` | Region codes whose IP addresses will be used to match for source of traffic. Should be specified as 2 letter country code defined as per ISO 3166 alpha-2 country codes. ex."US" Maximum number of source region codes allowed is 5000. | false | None | None |
| `dest_region_codes` | Region codes whose IP addresses will be used to match for destination of traffic. Should be specified as 2 letter country code defined as per ISO 3166 alpha-2 country codes. ex."US" Maximum number of destination region codes allowed is 5000. | false | None | None |
| `src_threat_intelligences` | Names of Network Threat Intelligence lists. The IPs in these lists will be matched against traffic source. | false | None | None |
| `dest_threat_intelligences` | Names of Network Threat Intelligence lists. The IPs in these lists will be matched against traffic destination. | false | None | None |
| `src_secure_tag` | List of secure tag values, which should be matched at the source of the traffic. For INGRESS rule, if all the <code>srcSecureTag</code> are INEFFECTIVE, and there is no <code>srcIpRange</code>, this rule will be ignored. Maximum number of source tag values allowed is 256. Structure is [documented below](#nested_rule_rule_match_src_secure_tag). | false | None | None |
| `layer4_config` | Pairs of IP protocols and ports that the rule should match. Structure is [documented below](#nested_rule_rule_match_layer4_config). | true | None | None |

### src_secure_tag Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the secure tag, created with TagManager's TagValue API. @pattern tagValues/[0-9]+ | false | None | None |
| `state` | (Output) [Output Only] State of the secure tag, either `EFFECTIVE` or `INEFFECTIVE`. A secure tag is `INEFFECTIVE` when it is deleted or its network is deleted. | none | None | None |

### layer4_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_protocol` | The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, ipip, sctp), or the IP protocol number. | true | None | None |
| `ports` | An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port. Example inputs include: ["22"], ["80","443"], and ["12345-12349"]. | false | None | None |

### target_secure_tag Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the secure tag, created with TagManager's TagValue API. @pattern tagValues/[0-9]+ | false | None | None |
| `state` | (Output) [Output Only] State of the secure tag, either `EFFECTIVE` or `INEFFECTIVE`. A secure tag is `INEFFECTIVE` when it is deleted or its network is deleted. | none | None | None |
