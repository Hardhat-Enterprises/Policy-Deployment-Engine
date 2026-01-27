## 🛡️ Policy Deployment Engine: `biglake_catalog`

This section provides a concise policy evaluation for the `biglake_catalog` resource in GCP.

Reference: [Terraform Registry – biglake_catalog](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/biglake_catalog)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The geographic location where the Catalog should reside. | true | true | The catalog location determines where metadata is stored and affects data residency, compliance, and regulatory requirements. | Catalog is created in an approved region | Catalog is created in an unapproved or unrestricted region |
| `name` | The name of the Catalog. Format: projects/{project_id_or_number}/locations/{locationId}/catalogs/{catalogId} | true | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | true | Explicitly specifying the project ensures that the catalog is created within the intended security boundary and access controls. | Project is explicitly specified | Project is omitted or points to an unintended project |
