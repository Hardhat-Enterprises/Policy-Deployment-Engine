## 🛡️ Policy Deployment Engine: `compute_project_cloud_armor_tier`

This section provides a concise policy evaluation for the `compute_project_cloud_armor_tier` resource in GCP.

Reference: [Terraform Registry – compute_project_cloud_armor_tier](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_project_cloud_armor_tier)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cloud_armor_tier` | Managed protection tier to be set. Possible values are: `CA_STANDARD`, `CA_ENTERPRISE_PAYGO`, `CA_ENTERPRISE_ANNUAL`. | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
