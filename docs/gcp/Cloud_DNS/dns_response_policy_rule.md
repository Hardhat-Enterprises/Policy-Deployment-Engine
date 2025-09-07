## 🛡️ Policy Deployment Engine: `dns_response_policy_rule`

This section provides a concise policy evaluation for the `dns_response_policy_rule` resource in GCP.

Reference: [Terraform Registry – dns_response_policy_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_response_policy_rule)

---

## 1. Argument Reference

### `rule_name`
- Description: (Required) An identifier for this rule. Must be unique with the ResponsePolicy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_name`
- Description: (Required) The DNS name (wildcard or exact) to apply this rule to. Must be unique within the Response Policy Rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_policy`
- Description: (Required) Identifies the response policy addressed by this request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_data`
- Description: (Optional) Answer this query directly with DNS data. These ResourceRecordSets override any other DNS behavior for the matched name; in particular they override private zones, the public internet, and GCP internal DNS. No SOA nor NS types are allowed. Structure is [documented below](#nested_local_data).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `behavior`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Answer this query with a behavior rather than DNS data. Acceptable values are 'behaviorUnspecified', and 'bypassResponsePolicy'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_local_data"></a>The `local_data` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_datas`
- Description: (Required) All resource record sets for this selector, one per resource record type. The name must match the dns_name. Structure is [documented below](#nested_local_data_local_datas). <a name="nested_local_data_local_datas"></a>The `local_datas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) For example, www.example.com.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) One of valid DNS resource types. Possible values are: `A`, `AAAA`, `CAA`, `CNAME`, `DNSKEY`, `DS`, `HTTPS`, `IPSECVPNKEY`, `MX`, `NAPTR`, `NS`, `PTR`, `SOA`, `SPF`, `SRV`, `SSHFP`, `SVCB`, `TLSA`, `TXT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ttl`
- Description: (Optional) Number of seconds that this ResourceRecordSet can be cached by resolvers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rrdatas`
- Description: (Optional) As defined in RFC 1035 (section 5) and RFC 1034 (section 3.6.1)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
