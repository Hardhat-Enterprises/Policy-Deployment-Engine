## 🛡️ Policy Deployment Engine: `biglake_catalog`

This section provides a concise policy evaluation for the `biglake_catalog` resource in GCP.

Reference: [Terraform Registry – biglake_catalog](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/biglake_catalog)

---

## 1. Argument Reference

### `location`
- Description: (Required) The geographic location where the Catalog should reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the Catalog. Format: projects/{project_id_or_number}/locations/{locationId}/catalogs/{catalogId}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
