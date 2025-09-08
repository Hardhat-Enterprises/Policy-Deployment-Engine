## 🛡️ Policy Deployment Engine: `compute_organization_security_policy`

This section provides a concise policy evaluation for the `compute_organization_security_policy` resource in GCP.

Reference: [Terraform Registry – compute_organization_security_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_organization_security_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | A textual name of the security policy. | true | None | None |
| `parent` | The parent of this OrganizationSecurityPolicy in the Cloud Resource Hierarchy. Format: organizations/{organization_id} or folders/{folder_id} | true | None | None |
| `description` | A textual description for the organization security policy. | false | None | None |
| `type` | The type indicates the intended use of the security policy. For organization security policies, the only supported type is "FIREWALL". Default value is `FIREWALL`. Possible values are: `FIREWALL`. | false | None | None |
