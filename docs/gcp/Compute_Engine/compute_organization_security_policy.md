## 🛡️ Policy Deployment Engine: `compute_organization_security_policy`

This section provides a concise policy evaluation for the `compute_organization_security_policy` resource in GCP.

Reference: [Terraform Registry – compute_organization_security_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_organization_security_policy)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) A textual name of the security policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The parent of this OrganizationSecurityPolicy in the Cloud Resource Hierarchy. Format: organizations/{organization_id} or folders/{folder_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A textual description for the organization security policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The type indicates the intended use of the security policy. For organization security policies, the only supported type is "FIREWALL". Default value is `FIREWALL`. Possible values are: `FIREWALL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
