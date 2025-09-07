## 🛡️ Policy Deployment Engine: `active_directory_domain_trust`

This section provides a concise policy evaluation for the `active_directory_domain_trust` resource in GCP.

Reference: [Terraform Registry – active_directory_domain_trust](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/active_directory_domain_trust)

---

## 1. Argument Reference

### `target_domain_name`
- Description: (Required) The fully qualified target domain name which will be in trust with the current domain.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trust_type`
- Description: (Required) The type of trust represented by the trust resource. Possible values are: `FOREST`, `EXTERNAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trust_direction`
- Description: (Required) The trust direction, which decides if the current domain is trusted, trusting, or both. Possible values are: `INBOUND`, `OUTBOUND`, `BIDIRECTIONAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_dns_ip_addresses`
- Description: (Required) The target DNS server IP addresses which can resolve the remote domain involved in the trust.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trust_handshake_secret`
- Description: (Required) The trust secret used for the handshake with the target domain. This will not be stored. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain`
- Description: (Required) The fully qualified domain name. e.g. mydomain.myorganization.com, with the restrictions of https://cloud.google.com/managed-microsoft-ad/reference/rest/v1/projects.locations.global.domains.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `selective_authentication`
- Description: (Optional) Whether the trusted side has forest/domain wide access or selective access to an approved set of resources.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
