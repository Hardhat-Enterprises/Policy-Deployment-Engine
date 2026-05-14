## 🛡️ Policy Deployment Engine: `google_dns_response_policy_rule`
This section provides a concise policy evaluation for the `google_dns_response_policy_rule` resource in GCP.
Reference: [Terraform Registry – google_dns_response_policy_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_response_policy_rule)
---
## Argument Reference  
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `rule_name` | An identifier for this rule. Must be unique with the ResponsePolicy. | true | false | Rule name has no independent security policy impact. | None | None |
| `dns_name` | The DNS name (wildcard or exact) to apply this rule to. Must be unique within the Response Policy Rule. | true | true | Wildcard DNS names such as `*.` or `.` match all DNS queries and override all DNS responses within the VPC network. This completely bypasses normal DNS resolution including private zones, public internet, and GCP internal DNS. A wildcard rule could be used to intercept all DNS traffic, redirect users to malicious endpoints, or cause widespread service outages. Only specific, scoped DNS names must be allowed. | Specific dns_name (e.g. dns.example.com.) | Wildcard dns_name (e.g. *. or .) |
| `response_policy` | Identifies the response policy addressed by this request. | true | false | Response policy reference has no independent security policy impact. | None | None |
| `local_data` | Answer this query directly with DNS data. Structure is documented below. | false | false | Local data configuration does not independently drive security policy decisions. | None | None |
| `behavior` | Answer this query with a behavior rather than DNS data. Possible values: `behaviorUnspecified`, `bypassResponsePolicy`. Note: Beta feature only. | false | false | The behavior argument is a Beta feature not supported in the standard provider version used in this project and therefore cannot be enforced as a policy. | None | None |
| `project` | The ID of the project in which the resource belongs. | false | false | Project ID has no impact on the security of the resource or data contained. | None | None |

### local_data Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `local_datas` | All resource record sets for this selector. Structure is documented below. | true | false | Local data records have no independent security policy impact at this level. | None | None |

### local_datas Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | For example, www.example.com. | true | false | Record name has no independent security policy impact. | None | None |
| `type` | One of valid DNS resource types. Possible values are: A, AAAA, CAA, CNAME, DNSKEY, DS, HTTPS, MX, NS, PTR, SOA, SPF, SRV, TXT. | true | false | Record type alone does not constitute a security risk requiring policy enforcement. | None | None |
| `ttl` | Number of seconds that this ResourceRecordSet can be cached by resolvers. | false | true | A TTL below 300 seconds increases the risk of DNS cache poisoning attacks. Frequent re-querying allows attackers more opportunities to inject malicious DNS responses. A minimum TTL of 300 seconds must be enforced. | 300–86400 | Below 300 (e.g. 60) |
| `rrdatas` | As defined in RFC 1035 and RFC 1034. | false | false | Record data values have no independent security policy impact at this level. | None | None |
