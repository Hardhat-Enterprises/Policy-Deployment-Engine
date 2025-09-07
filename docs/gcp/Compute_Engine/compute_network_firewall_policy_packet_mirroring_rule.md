## 🛡️ Policy Deployment Engine: `compute_network_firewall_policy_packet_mirroring_rule`

This section provides a concise policy evaluation for the `compute_network_firewall_policy_packet_mirroring_rule` resource in GCP.

Reference: [Terraform Registry – compute_network_firewall_policy_packet_mirroring_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_firewall_policy_packet_mirroring_rule)

---

## 1. Argument Reference

### `priority`
- Description: (Required) An integer indicating the priority of a rule in the list. The priority must be a positive value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest priority.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match`
- Description: (Required) A match condition that incoming traffic is evaluated against. If it evaluates to true, the corresponding 'action' is enforced. Structure is [documented below](#nested_match).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Required) The Action to perform when the client connection triggers the rule. Valid actions are "mirror", "do_not_mirror", "goto_next".
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
- Description: (Optional) A fully-qualified URL of a SecurityProfile resource instance. Example: https://networksecurity.googleapis.com/v1/projects/{project}/locations/{location}/securityProfileGroups/my-security-profile-group Must be specified if action = 'mirror' and cannot be specified for other actions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_secure_tags`
- Description: (Optional) A list of secure tags that controls which instances the firewall rule applies to. If targetSecureTag are specified, then the firewall rule applies only to instances in the VPC network that have one of those EFFECTIVE secure tags, if all the targetSecureTag are in INEFFECTIVE state, then this rule will be ignored. targetSecureTag may not be set at the same time as targetServiceAccounts. If neither targetServiceAccounts nor targetSecureTag are specified, the firewall rule applies to all instances on the specified network. Maximum number of target label tags allowed is 256. Structure is [documented below](#nested_target_secure_tags).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tls_inspect`
- Description: (Optional) Boolean flag indicating if the traffic should be TLS decrypted. Can be set only if action = 'mirror' and cannot be set for other actions.
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

### `layer4_configs`
- Description: (Required) Pairs of IP protocols and ports that the rule should match. Structure is [documented below](#nested_match_layer4_configs). <a name="nested_match_layer4_configs"></a>The `layer4_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_protocol`
- Description: (Required) The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, ipip, sctp), or the IP protocol number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ports`
- Description: (Optional) An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port. Example inputs include: ["22"], ["80","443"], and ["12345-12349"]. <a name="nested_target_secure_tags"></a>The `target_secure_tags` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the secure tag, created with TagManager's TagValue API. diff_suppress_func: 'tpgresource.CompareSelfLinkOrResourceName'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) State of the secure tag, either EFFECTIVE or INEFFECTIVE. A secure tag is INEFFECTIVE when it is deleted or its network is deleted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
