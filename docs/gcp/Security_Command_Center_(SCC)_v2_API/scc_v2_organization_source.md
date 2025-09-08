## 🛡️ Policy Deployment Engine: `scc_v2_organization_source`

This section provides a concise policy evaluation for the `scc_v2_organization_source` resource in GCP.

Reference: [Terraform Registry – scc_v2_organization_source](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_v2_organization_source)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The source’s display name. A source’s display name must be unique amongst its siblings, for example, two sources with the same parent can't share the same display name. The display name must start and end with a letter or digit, may contain letters, digits, spaces, hyphens, and underscores, and can be no longer than 32 characters. | true | None | None |
| `organization` | The organization whose Cloud Security Command Center the Source lives in. | true | None | None |
| `description` | The description of the source (max of 1024 characters). | false | None | None |
