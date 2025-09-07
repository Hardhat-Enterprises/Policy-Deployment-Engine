## 🛡️ Policy Deployment Engine: `compute_firewall`

This section provides a concise policy evaluation for the `compute_firewall` resource in GCP.

Reference: [Terraform Registry – compute_firewall](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) The name or self_link of the network to attach this firewall to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow`
- Description: (Optional) The list of ALLOW rules specified by this firewall. Each rule specifies a protocol and port-range tuple that describes a permitted connection. Structure is [documented below](#nested_allow).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deny`
- Description: (Optional) The list of DENY rules specified by this firewall. Each rule specifies a protocol and port-range tuple that describes a denied connection. Structure is [documented below](#nested_deny).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. Provide this property when you create the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_ranges`
- Description: (Optional) If destination ranges are specified, the firewall will apply only to traffic that has destination IP address in these ranges. These ranges must be expressed in CIDR format. IPv4 or IPv6 ranges are supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `direction`
- Description: (Optional) Direction of traffic to which this firewall applies; default is INGRESS. Note: For INGRESS traffic, one of `source_ranges`, `source_tags` or `source_service_accounts` is required. Possible values are: `INGRESS`, `EGRESS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Denotes whether the firewall rule is disabled, i.e not applied to the network it is associated with. When set to true, the firewall rule is not enforced and the network behaves as if it did not exist. If this is unspecified, the firewall rule will be enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_config`
- Description: (Optional) This field denotes the logging options for a particular firewall rule. If defined, logging is enabled, and logs will be exported to Cloud Logging. Structure is [documented below](#nested_log_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `priority`
- Description: (Optional) Priority for this rule. This is an integer between 0 and 65535, both inclusive. When not specified, the value assumed is 1000. Relative priorities determine precedence of conflicting rules. Lower value of priority implies higher precedence (eg, a rule with priority 0 has higher precedence than a rule with priority 1). DENY rules take precedence over ALLOW rules having equal priority.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_ranges`
- Description: (Optional) If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges. These ranges must be expressed in CIDR format. One or both of sourceRanges and sourceTags may be set. If both properties are set, the firewall will apply to traffic that has source IP address within sourceRanges OR the source IP that belongs to a tag listed in the sourceTags property. The connection does not need to match both properties for the firewall to apply. IPv4 or IPv6 ranges are supported. For INGRESS traffic, one of `source_ranges`, `source_tags` or `source_service_accounts` is required.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_service_accounts`
- Description: (Optional) If source service accounts are specified, the firewall will apply only to traffic originating from an instance with a service account in this list. Source service accounts cannot be used to control traffic to an instance's external IP address because service accounts are associated with an instance, not an IP address. sourceRanges can be set at the same time as sourceServiceAccounts. If both are set, the firewall will apply to traffic that has source IP address within sourceRanges OR the source IP belongs to an instance with service account listed in sourceServiceAccount. The connection does not need to match both properties for the firewall to apply. sourceServiceAccounts cannot be used at the same time as sourceTags or targetTags. For INGRESS traffic, one of `source_ranges`, `source_tags` or `source_service_accounts` is required.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_tags`
- Description: (Optional) If source tags are specified, the firewall will apply only to traffic with source IP that belongs to a tag listed in source tags. Source tags cannot be used to control traffic to an instance's external IP address. Because tags are associated with an instance, not an IP address. One or both of sourceRanges and sourceTags may be set. If both properties are set, the firewall will apply to traffic that has source IP address within sourceRanges OR the source IP that belongs to a tag listed in the sourceTags property. The connection does not need to match both properties for the firewall to apply. For INGRESS traffic, one of `source_ranges`, `source_tags` or `source_service_accounts` is required.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_service_accounts`
- Description: (Optional) A list of service accounts indicating sets of instances located in the network that may make network connections as specified in allowed[]. targetServiceAccounts cannot be used at the same time as targetTags or sourceTags. If neither targetServiceAccounts nor targetTags are specified, the firewall rule applies to all instances on the specified network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_tags`
- Description: (Optional) A list of instance tags indicating sets of instances located in the network that may make network connections as specified in allowed[]. If no targetTags are specified, the firewall rule applies to all instances on the specified network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `params`
- Description: (Optional) Additional params passed with the request, but not persisted as part of resource payload Structure is [documented below](#nested_params).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_logging`
- Description: If logging is enabled, logs will be exported to Stackdriver. Deprecated in favor of `log_config` <a name="nested_allow"></a>The `allow` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `protocol`
- Description: (Required) The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, sctp, ipip, all), or the IP protocol number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ports`
- Description: (Optional) An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port. Example inputs include: [22], [80, 443], and ["12345-12349"]. <a name="nested_deny"></a>The `deny` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `protocol`
- Description: (Required) The IP protocol to which this rule applies. The protocol type is required when creating a firewall rule. This value can either be one of the following well known protocol strings (tcp, udp, icmp, esp, ah, sctp, ipip, all), or the IP protocol number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ports`
- Description: (Optional) An optional list of ports to which this rule applies. This field is only applicable for UDP or TCP protocol. Each entry must be either an integer or a range. If not specified, this rule applies to connections through any port. Example inputs include: [22], [80, 443], and ["12345-12349"]. <a name="nested_log_config"></a>The `log_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Required) This field denotes whether to include or exclude metadata for firewall logs. Possible values are: `EXCLUDE_ALL_METADATA`, `INCLUDE_ALL_METADATA`. <a name="nested_params"></a>The `params` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_manager_tags`
- Description: (Optional) Resource manager tags to be bound to the firewall. Tag keys and values have the same definition as resource manager tags. Keys must be in the format tagKeys/{tag_key_id}, and values are in the format tagValues/456. The field is ignored when empty. The field is immutable and causes resource replacement when mutated. This field is only set at create time and modifying this field after creation will trigger recreation. To apply tags to an existing resource, see the google_tags_tag_binding resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
