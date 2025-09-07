## 🛡️ Policy Deployment Engine: `compute_firewall_policy_with_rules`

This section provides a concise policy evaluation for the `compute_firewall_policy_with_rules` resource in GCP.

Reference: [Terraform Registry – compute_firewall_policy_with_rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall_policy_with_rules)

---

## 1. Argument Reference

### `short_name`
- Description: (Required) A textual name of the security policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rule`
- Description: (Required) A list of firewall policy rules. Structure is [documented below](#nested_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The parent of this FirewallPolicy in the Cloud Resource Hierarchy. Format: organizations/{organization_id} or folders/{folder_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. <a name="nested_rule"></a>The `rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rule_name`
- Description: (Optional) An optional name for the rule. This field is not a unique identifier and can be updated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `priority`
- Description: (Required) An integer indicating the priority of a rule in the list. The priority must be a value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest priority.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match`
- Description: (Required) A match condition that incoming traffic is evaluated against. If it evaluates to true, the corresponding 'action' is enforced. Structure is [documented below](#nested_rule_rule_match).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_secure_tag`
- Description: (Optional) A list of secure tags that controls which instances the firewall rule applies to. If <code>targetSecureTag</code> are specified, then the firewall rule applies only to instances in the VPC network that have one of those EFFECTIVE secure tags, if all the target_secure_tag are in INEFFECTIVE state, then this rule will be ignored. <code>targetSecureTag</code> may not be set at the same time as <code>targetServiceAccounts</code>. If neither <code>targetServiceAccounts</code> nor <code>targetSecureTag</code> are specified, the firewall rule applies to all instances on the specified network. Maximum number of target secure tags allowed is 256. Structure is [documented below](#nested_rule_rule_target_secure_tag).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Required) The Action to perform when the client connection triggers the rule. Can currently be either "allow", "deny", "apply_security_profile_group" or "goto_next".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `direction`
- Description: (Optional) The direction in which this rule applies. If unspecified an INGRESS rule is created. Possible values are: `INGRESS`, `EGRESS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_logging`
- Description: (Optional) Denotes whether to enable logging for a particular rule. If logging is enabled, logs will be exported to the configured export destination in Stackdriver.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_service_accounts`
- Description: (Optional) A list of service accounts indicating the sets of instances that are applied with this rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_profile_group`
- Description: (Optional) A fully-qualified URL of a SecurityProfile resource instance. Example: https://networksecurity.googleapis.com/v1/projects/{project}/locations/{location}/securityProfileGroups/my-security-profile-group Must be specified if action is 'apply_security_profile_group'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tls_inspect`
- Description: (Optional) Boolean flag indicating if the traffic should be TLS decrypted. It can be set only if action = 'apply_security_profile_group' and cannot be set for other actions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_resources`
- Description: (Optional) A list of network resource URLs to which this rule applies. This field allows you to control which network's VMs get this rule. If this field is left blank, all VMs within the organization will receive the rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Denotes whether the firewall policy rule is disabled. When set to true, the firewall policy rule is not enforced and traffic behaves as if it did not exist. If this is unspecified, the firewall policy rule will be enabled. <a name="nested_rule_rule_match"></a>The `match` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `src_ip_ranges`
- Description: (Optional) Source IP address range in CIDR format. Required for INGRESS rules.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dest_ip_ranges`
- Description: (Optional) Destination IP address range in CIDR format. Required for EGRESS rules.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `src_address_groups`
- Description: (Optional) Address groups which should be matched against the traffic source. Maximum number of source address groups is 10.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dest_address_groups`
- Description: (Optional) Address groups which should be matched against the traffic destination. Maximum number of destination address groups is 10.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `src_fqdns`
- Description: (Optional) Fully Qualified Domain Name (FQDN) which should be matched against traffic source. Maximum number of source fqdn allowed is 100.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dest_fqdns`
- Description: (Optional) Fully Qualified Domain Name (FQDN) which should be matched against traffic destination. Maximum number of destination fqdn allowed is 100.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `src_network_scope`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Network scope of the traffic source. Possible values are: `INTERNET`, `INTRA_VPC`, `NON_INTERNET`, `VPC_NETWORKS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `src_networks`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Networks of the traffic source. It can be either a full or partial url.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dest_network_scope`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Network scope of the traffic destination. Possible values are: `INTERNET`, `INTRA_VPC`, `NON_INTERNET`, `VPC_NETWORKS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `src_region_codes`
- Description: (Optional) Region codes whose IP addresses will be used to match for source of traffic. Should be specified as 2 letter country code defined as per ISO 3166 alpha-2 country codes. ex."US" Maximum number of source region codes allowed is 5000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dest_region_codes`
- Description: (Optional) Region codes whose IP addresses will be used to match for destination of traffic. Should be specified as 2 letter country code defined as per ISO 3166 alpha-2 country codes. ex."US" Maximum number of destination region codes allowed is 5000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `src_threat_intelligences`
- Description: (Optional) Names of Network Threat Intelligence lists. The IPs in these lists will be matched against traffic source.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dest_threat_intelligences`
- Description: (Optional) Names of Network Threat Intelligence lists. The IPs in these lists will be matched against traffic destination.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `src_secure_tag`
- Description: (Optional) List of secure tag values, which should be matched at the source of the traffic. For INGRESS rule, if all the <code>srcSecureTag</code> are INEFFECTIVE, and there is no <code>srcIpRange</code>, this rule will be ignored. Maximum number of source tag values allowed is 256. Structure is [documented below](#nested_rule_rule_match_src_secure_tag).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `layer4_config`
- Description: (Required) Pairs of IP protocols and ports that the rule should match. Structure is [documented below](#nested_rule_rule_match_layer4_config). <a name="nested_rule_rule_match_src_secure_tag"></a>The `src_secure_tag` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the secure tag, created with TagManager's TagValue API. @pattern tagValues/[0-9]+
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) [Output Only] State of the secure tag, either `EFFECTIVE` or `INEFFECTIVE`. A secure tag is `INEFFECTIVE` when it is deleted or its network is deleted. <a name="nested_rule_rule_match_layer4_config"></a>The `layer4_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_protocol`
- Description: (Required) The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, ipip, sctp), or the IP protocol number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ports`
- Description: (Optional) An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port. Example inputs include: ["22"], ["80","443"], and ["12345-12349"]. <a name="nested_rule_rule_target_secure_tag"></a>The `target_secure_tag` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the secure tag, created with TagManager's TagValue API. @pattern tagValues/[0-9]+
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) [Output Only] State of the secure tag, either `EFFECTIVE` or `INEFFECTIVE`. A secure tag is `INEFFECTIVE` when it is deleted or its network is deleted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
