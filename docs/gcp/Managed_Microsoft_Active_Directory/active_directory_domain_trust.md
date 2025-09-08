## 🛡️ Policy Deployment Engine: `active_directory_domain_trust`

This section provides a concise policy evaluation for the `active_directory_domain_trust` resource in GCP.

Reference: [Terraform Registry – active_directory_domain_trust](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/active_directory_domain_trust)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target_domain_name` | The fully qualified target domain name which will be in trust with the current domain. | true | None | None |
| `trust_type` | The type of trust represented by the trust resource. Possible values are: `FOREST`, `EXTERNAL`. | true | None | None |
| `trust_direction` | The trust direction, which decides if the current domain is trusted, trusting, or both. Possible values are: `INBOUND`, `OUTBOUND`, `BIDIRECTIONAL`. | true | None | None |
| `target_dns_ip_addresses` | The target DNS server IP addresses which can resolve the remote domain involved in the trust. | true | None | None |
| `trust_handshake_secret` | The trust secret used for the handshake with the target domain. This will not be stored. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |
| `domain` | The fully qualified domain name. e.g. mydomain.myorganization.com, with the restrictions of https://cloud.google.com/managed-microsoft-ad/reference/rest/v1/projects.locations.global.domains. | true | None | None |
| `selective_authentication` | Whether the trusted side has forest/domain wide access or selective access to an approved set of resources. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
