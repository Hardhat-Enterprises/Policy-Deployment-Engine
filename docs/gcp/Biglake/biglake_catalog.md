## 🛡️ Policy Deployment Engine: `biglake_catalog`

This section provides a concise policy evaluation for the `biglake_catalog` resource in GCP.

Reference: [Terraform Registry – biglake_catalog](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/biglake_catalog)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The geographic location where the Catalog should reside. | true | None | None |
| `name` | The name of the Catalog. Format: projects/{project_id_or_number}/locations/{locationId}/catalogs/{catalogId} | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
