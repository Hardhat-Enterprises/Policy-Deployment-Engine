## 🛡️ Policy Deployment Engine: `google_dns_record_set`
This section provides a concise policy evaluation for the `google_dns_record_set` resource in GCP.
Reference: [Terraform Registry – google_dns_record_set](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set)
---
## Argument Reference  
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The DNS name this record set will apply to. | true | false | The DNS record name has no independent security policy impact. | None | None |
| `managed_zone` | The name of the zone in which this record set will reside. | true | false | The managed zone reference has no independent security policy impact. | None | None |
| `type` | The DNS record set type. Possible values include: `A`, `AAAA`, `CNAME`, `MX`, `TXT`, `NS`, `SOA`, `PTR`, `SRV`, `DNSKEY`, `DS`. | true | false | Record type alone does not constitute a security risk requiring policy enforcement. | None | None |
| `ttl` | The time-to-live of this record set (seconds). | false | true | A TTL value below 300 seconds causes DNS records to expire too frequently, significantly increasing the attack surface for DNS cache poisoning attacks. Frequent re-querying allows attackers more opportunities to inject malicious DNS responses. A minimum TTL of 300 seconds and maximum of 86400 seconds must be enforced to balance security and operational flexibility. | 300–86400 | Below 300 (e.g. 60) |
| `rrdatas` | The string data for the records in this record set. | false | false | Record data values have no independent security policy impact at the policy level. | None | None |
| `routing_policy` | The configuration for steering traffic based on query. Structure is documented below. | false | false | Routing policy configuration does not independently drive security policy decisions. | None | None |
| `project` | The ID of the project in which the resource belongs. | false | false | Project ID has no impact on the security of the resource or data contained. | None | None |
