## 🛡️ Policy Deployment Engine: `compute_region_network_firewall_policy_rule`

This section provides a concise policy evaluation for the `compute_region_network_firewall_policy_rule` resource in GCP.

Reference: [Terraform Registry – compute_region_network_firewall_policy_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_network_firewall_policy_rule)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `priority` | An integer indicating the priority of a rule in the list. The priority must be a positive value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest prority. | true | None | None |
| `action` | The Action to perform when the client connection triggers the rule. Valid actions are "allow", "deny", "goto_next" and "apply_security_profile_group". | true | None | None |
| `direction` | The direction in which this rule applies. Possible values are: `INGRESS`, `EGRESS`. | true | None | None |
| `firewall_policy` | The firewall policy of the resource. | true | None | None |
| `rule_name` | An optional name for the rule. This field is not a unique identifier and can be updated. | false | None | None |
| `description` | An optional description for this resource. | false | None | None |
| `security_profile_group` | A fully-qualified URL of a SecurityProfile resource instance. Example: https://networksecurity.googleapis.com/v1/projects/{project}/locations/{location}/securityProfileGroups/my-security-profile-group Must be specified if action = 'apply_security_profile_group' and cannot be specified for other actions. Security Profile Group and Firewall Policy Rule must be in the same scope. | false | None | None |
| `tls_inspect` | Boolean flag indicating if the traffic should be TLS decrypted. Can be set only if action = 'apply_security_profile_group' and cannot be set for other actions. | false | None | None |
| `enable_logging` | Denotes whether to enable logging for a particular rule. If logging is enabled, logs will be exported to the configured export destination in Stackdriver. Logs may be exported to BigQuery or Pub/Sub. Note: you cannot enable logging on "goto_next" rules. | false | None | None |
| `target_service_accounts` | A list of service accounts indicating the sets of instances that are applied with this rule. | false | None | None |
| `disabled` | Denotes whether the firewall policy rule is disabled. When set to true, the firewall policy rule is not enforced and traffic behaves as if it did not exist. If this is unspecified, the firewall policy rule will be enabled. | false | None | None |
| `region` | The location of this resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### match Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `src_ip_ranges` | CIDR IP address range. Maximum number of source CIDR IP ranges allowed is 5000. | false | None | None |
| `dest_ip_ranges` | CIDR IP address range. Maximum number of destination CIDR IP ranges allowed is 5000. | false | None | None |
| `src_network_scope` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Network scope of the traffic source. Possible values are: `INTERNET`, `INTRA_VPC`, `NON_INTERNET`, `VPC_NETWORKS`. | false | None | None |
| `src_networks` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Networks of the traffic source. It can be either a full or partial url. | false | None | None |
| `dest_network_scope` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Network scope of the traffic destination. Possible values are: `INTERNET`, `INTRA_VPC`, `NON_INTERNET`, `VPC_NETWORKS`. | false | None | None |
| `layer4_configs` | Pairs of IP protocols and ports that the rule should match. Structure is [documented below](#nested_match_layer4_configs). | true | None | None |
| `src_secure_tags` | List of secure tag values, which should be matched at the source of the traffic. For INGRESS rule, if all the srcSecureTag are INEFFECTIVE, and there is no srcIpRange, this rule will be ignored. Maximum number of source tag values allowed is 256. Structure is [documented below](#nested_match_src_secure_tags). | false | None | None |
| `dest_address_groups` | Address groups which should be matched against the traffic destination. Maximum number of destination address groups is 10. | false | None | None |
| `src_address_groups` | Address groups which should be matched against the traffic source. Maximum number of source address groups is 10. | false | None | None |
| `src_fqdns` | Fully Qualified Domain Name (FQDN) which should be matched against traffic source. Maximum number of source fqdn allowed is 100. | false | None | None |
| `dest_fqdns` | Fully Qualified Domain Name (FQDN) which should be matched against traffic destination. Maximum number of destination fqdn allowed is 100. | false | None | None |
| `src_region_codes` | Region codes whose IP addresses will be used to match for source of traffic. Should be specified as 2 letter country code defined as per ISO 3166 alpha-2 country codes. ex."US" Maximum number of source region codes allowed is 5000. | false | None | None |
| `dest_region_codes` | Region codes whose IP addresses will be used to match for destination of traffic. Should be specified as 2 letter country code defined as per ISO 3166 alpha-2 country codes. ex."US" Maximum number of dest region codes allowed is 5000. | false | None | None |
| `dest_threat_intelligences` | Names of Network Threat Intelligence lists. The IPs in these lists will be matched against traffic destination. | false | None | None |
| `src_threat_intelligences` | Names of Network Threat Intelligence lists. The IPs in these lists will be matched against traffic source. | false | None | None |

### target_secure_tags Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the secure tag, created with TagManager's TagValue API. | false | None | None |
| `state` | (Output) State of the secure tag, either EFFECTIVE or INEFFECTIVE. A secure tag is INEFFECTIVE when it is deleted or its network is deleted. | none | None | None |

### layer4_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_protocol` | The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, ipip, sctp), or the IP protocol number. | true | None | None |
| `ports` | An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port. Example inputs include: ["22"], ["80","443"], and ["12345-12349"]. | false | None | None |

### src_secure_tags Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the secure tag, created with TagManager's TagValue API. | false | None | None |
| `state` | (Output) State of the secure tag, either EFFECTIVE or INEFFECTIVE. A secure tag is INEFFECTIVE when it is deleted or its network is deleted. | none | None | None |
