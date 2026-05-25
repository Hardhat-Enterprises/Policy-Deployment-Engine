## 🛡️ Policy Deployment Engine: `google_dns_policy`
This section provides a concise policy evaluation for the `google_dns_policy` resource in GCP.
Reference: [Terraform Registry – google_dns_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_policy)
---
## Argument Reference  
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | User assigned name for this policy. | true | false | The name has no impact on the security of the resource or data contained. | None | None |
| `enable_logging` | Controls whether logging is enabled for the networks bound to this policy. Defaults to no logging if not set. | false | true | DNS query logging is critical for security monitoring, threat detection, and incident response. Without logging enabled, there is no visibility into DNS queries made within the VPC network, making it impossible to detect DNS-based attacks, data exfiltration attempts, or unauthorised access patterns. All DNS policies must have logging enabled. | true | false |
| `enable_inbound_forwarding` | Allows networks bound to this policy to receive DNS queries sent by VMs or applications over VPN connections. | false | false | Inbound forwarding enables hybrid DNS resolution but does not independently introduce a security risk that requires policy enforcement. | None | None |
| `alternative_name_server_config` | Sets an alternative name server for the associated networks. Structure is documented below. | false | false | Alternative name server configuration does not independently drive security policy decisions at this level. | None | None |
| `networks` | List of network names specifying networks to which this policy is applied. Structure is documented below. | false | false | Network binding has no independent security policy impact. | None | None |
| `project` | The ID of the project in which the resource belongs. | false | false | Project ID has no impact on the security of the resource or data contained. | None | None |

### alternative_name_server_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target_name_servers` | Sets an alternative name server for the associated networks. Structure is documented below. | true | false | Target name server configuration has no independent security policy impact at this level. | None | None |

### target_name_servers Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ipv4_address` | IPv4 address to forward to. | true | false | IP address of name server has no independent security policy impact. | None | None |
🎉 Both new policies working perfectly!
Now update the docs for both resources, then commit everything together.
Update docs/gcp/Cloud_DNS/dns_policy.md
Find the forwarding_path row and change from false to true security impact:
| `forwarding_path` | Forwarding path for this TargetNameServer. Possible values are: `default`, `private`. | false | true | When set to `default`, Cloud DNS may forward queries to the public internet for non-RFC1918 addresses, exposing internal DNS queries to external name servers. Setting to `private` ensures all DNS queries are always routed through the VPC. | private | default |
