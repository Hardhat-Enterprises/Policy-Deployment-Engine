## 🛡️ Policy Deployment Engine: `dns_response_policy_rule`

This section provides a concise policy evaluation for the `dns_response_policy_rule` resource in GCP.

Reference: [Terraform Registry – dns_response_policy_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_response_policy_rule)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `rule_name` | An identifier for this rule. Must be unique with the ResponsePolicy. | true | None | None |
| `dns_name` | The DNS name (wildcard or exact) to apply this rule to. Must be unique within the Response Policy Rule. | true | None | None |
| `response_policy` | Identifies the response policy addressed by this request. | true | None | None |
| `behavior` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Answer this query with a behavior rather than DNS data. Acceptable values are 'behaviorUnspecified', and 'bypassResponsePolicy' | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### local_data Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `local_datas` | All resource record sets for this selector, one per resource record type. The name must match the dns_name. Structure is [documented below](#nested_local_data_local_datas). | true | None | None |

### local_datas Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | For example, www.example.com. | true | None | None |
| `type` | One of valid DNS resource types. Possible values are: `A`, `AAAA`, `CAA`, `CNAME`, `DNSKEY`, `DS`, `HTTPS`, `IPSECVPNKEY`, `MX`, `NAPTR`, `NS`, `PTR`, `SOA`, `SPF`, `SRV`, `SSHFP`, `SVCB`, `TLSA`, `TXT`. | true | None | None |
| `ttl` | Number of seconds that this ResourceRecordSet can be cached by resolvers. | false | None | None |
| `rrdatas` | As defined in RFC 1035 (section 5) and RFC 1034 (section 3.6.1) | false | None | None |
