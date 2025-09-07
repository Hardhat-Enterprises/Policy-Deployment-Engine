## 🛡️ Policy Deployment Engine: `compute_organization_security_policy_rule`

This section provides a concise policy evaluation for the `compute_organization_security_policy_rule` resource in GCP.

Reference: [Terraform Registry – compute_organization_security_policy_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_organization_security_policy_rule)

---

## 1. Argument Reference

### `priority`
- Description: (Required) An integer indicating the priority of a rule in the list. The priority must be a value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest prority.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match`
- Description: (Required) A match condition that incoming traffic is evaluated against. If it evaluates to true, the corresponding 'action' is enforced. Structure is [documented below](#nested_match).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Required) The Action to perform when the client connection triggers the rule. Can currently be either "allow", "deny" or "goto_next".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_id`
- Description: (Required) The ID of the OrganizationSecurityPolicy this rule applies to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preview`
- Description: (Optional) If set to true, the specified action is not enforced.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `direction`
- Description: (Optional) The direction in which this rule applies. If unspecified an INGRESS rule is created. Possible values are: `INGRESS`, `EGRESS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_resources`
- Description: (Optional) A list of network resource URLs to which this rule applies. This field allows you to control which network's VMs get this rule. If this field is left blank, all VMs within the organization will receive the rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_logging`
- Description: (Optional) Denotes whether to enable logging for a particular rule. If logging is enabled, logs will be exported to the configured export destination in Stackdriver.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_service_accounts`
- Description: (Optional) A list of service accounts indicating the sets of instances that are applied with this rule. <a name="nested_match"></a>The `match` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `versioned_expr`
- Description: (Optional) Preconfigured versioned expression. For organization security policy rules, the only supported type is "FIREWALL". Default value is `FIREWALL`. Possible values are: `FIREWALL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Required) The configuration options for matching the rule. Structure is [documented below](#nested_match_config). <a name="nested_match_config"></a>The `config` block supports:
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

### `layer4_config`
- Description: (Required) Pairs of IP protocols and ports that the rule should match. Structure is [documented below](#nested_match_config_layer4_config). <a name="nested_match_config_layer4_config"></a>The `layer4_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_protocol`
- Description: (Required) The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, ipip, sctp), or the IP protocol number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ports`
- Description: (Optional) An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port. Example inputs include: ["22"], ["80","443"], and ["12345-12349"].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
