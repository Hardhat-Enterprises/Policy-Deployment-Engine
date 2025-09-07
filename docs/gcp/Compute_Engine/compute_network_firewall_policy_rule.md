## 🛡️ Policy Deployment Engine: `compute_network_firewall_policy_rule`

This section provides a concise policy evaluation for the `compute_network_firewall_policy_rule` resource in GCP.

Reference: [Terraform Registry – compute_network_firewall_policy_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_firewall_policy_rule)

---

## 1. Argument Reference

### `priority`
- Description: (Required) An integer indicating the priority of a rule in the list. The priority must be a positive value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest prority.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match`
- Description: (Required) A match condition that incoming traffic is evaluated against. If it evaluates to true, the corresponding 'action' is enforced. Structure is [documented below](#nested_match).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Required) The Action to perform when the client connection triggers the rule. Valid actions are "allow", "deny", "goto_next" and "apply_security_profile_group".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `direction`
- Description: (Required) The direction in which this rule applies. Possible values are: `INGRESS`, `EGRESS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `firewall_policy`
- Description: (Required) The firewall policy of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rule_name`
- Description: (Optional) An optional name for the rule. This field is not a unique identifier and can be updated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description for this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_profile_group`
- Description: (Optional) A fully-qualified URL of a SecurityProfile resource instance. Example: https://networksecurity.googleapis.com/v1/projects/{project}/locations/{location}/securityProfileGroups/my-security-profile-group Must be specified if action = 'apply_security_profile_group' and cannot be specified for other actions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tls_inspect`
- Description: (Optional) Boolean flag indicating if the traffic should be TLS decrypted. Can be set only if action = 'apply_security_profile_group' and cannot be set for other actions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_logging`
- Description: (Optional) Denotes whether to enable logging for a particular rule. If logging is enabled, logs will be exported to the configured export destination in Stackdriver. Logs may be exported to BigQuery or Pub/Sub. Note: you cannot enable logging on "goto_next" rules.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_service_accounts`
- Description: (Optional) A list of service accounts indicating the sets of instances that are applied with this rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_secure_tags`
- Description: (Optional) A list of secure tags that controls which instances the firewall rule applies to. If targetSecureTag are specified, then the firewall rule applies only to instances in the VPC network that have one of those EFFECTIVE secure tags, if all the targetSecureTag are in INEFFECTIVE state, then this rule will be ignored. targetSecureTag may not be set at the same time as targetServiceAccounts. If neither targetServiceAccounts nor targetSecureTag are specified, the firewall rule applies to all instances on the specified network. Maximum number of target label tags allowed is 256. Structure is [documented below](#nested_target_secure_tags).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Denotes whether the firewall policy rule is disabled. When set to true, the firewall policy rule is not enforced and traffic behaves as if it did not exist. If this is unspecified, the firewall policy rule will be enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_match"></a>The `match` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `src_ip_ranges`
- Description: (Optional) CIDR IP address range. Maximum number of source CIDR IP ranges allowed is 5000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dest_ip_ranges`
- Description: (Optional) CIDR IP address range. Maximum number of destination CIDR IP ranges allowed is 5000.
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

### `layer4_configs`
- Description: (Required) Pairs of IP protocols and ports that the rule should match. Structure is [documented below](#nested_match_layer4_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `src_secure_tags`
- Description: (Optional) List of secure tag values, which should be matched at the source of the traffic. For INGRESS rule, if all the srcSecureTag are INEFFECTIVE, and there is no srcIpRange, this rule will be ignored. Maximum number of source tag values allowed is 256. Structure is [documented below](#nested_match_src_secure_tags).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dest_address_groups`
- Description: (Optional) Address groups which should be matched against the traffic destination. Maximum number of destination address groups is 10.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `src_address_groups`
- Description: (Optional) Address groups which should be matched against the traffic source. Maximum number of source address groups is 10.
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

### `src_region_codes`
- Description: (Optional) Region codes whose IP addresses will be used to match for source of traffic. Should be specified as 2 letter country code defined as per ISO 3166 alpha-2 country codes. ex."US" Maximum number of source region codes allowed is 5000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dest_region_codes`
- Description: (Optional) Region codes whose IP addresses will be used to match for destination of traffic. Should be specified as 2 letter country code defined as per ISO 3166 alpha-2 country codes. ex."US" Maximum number of dest region codes allowed is 5000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dest_threat_intelligences`
- Description: (Optional) Names of Network Threat Intelligence lists. The IPs in these lists will be matched against traffic destination.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `src_threat_intelligences`
- Description: (Optional) Names of Network Threat Intelligence lists. The IPs in these lists will be matched against traffic source. <a name="nested_match_layer4_configs"></a>The `layer4_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_protocol`
- Description: (Required) The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, ipip, sctp), or the IP protocol number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ports`
- Description: (Optional) An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port. Example inputs include: ["22"], ["80","443"], and ["12345-12349"]. <a name="nested_match_src_secure_tags"></a>The `src_secure_tags` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the secure tag, created with TagManager's TagValue API.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) State of the secure tag, either EFFECTIVE or INEFFECTIVE. A secure tag is INEFFECTIVE when it is deleted or its network is deleted. <a name="nested_target_secure_tags"></a>The `target_secure_tags` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the secure tag, created with TagManager's TagValue API.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) State of the secure tag, either EFFECTIVE or INEFFECTIVE. A secure tag is INEFFECTIVE when it is deleted or its network is deleted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
