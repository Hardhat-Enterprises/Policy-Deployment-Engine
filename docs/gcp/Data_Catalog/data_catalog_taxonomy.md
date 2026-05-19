## 🛡️ Policy Deployment Engine: `data_catalog_taxonomy`

This section provides a concise policy evaluation for the `data_catalog_taxonomy` resource in GCP.

Reference: [Terraform Registry – data_catalog_taxonomy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_taxonomy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | User defined name of this taxonomy. The taxonomy display name must be unique within an organization. It must: contain only unicode letters, numbers, underscores, dashes and spaces; not start or end with spaces; and be at most 200 bytes long when encoded in UTF-8. | true | false |  | None | None |
| `description` | Description of this taxonomy. It must: contain only unicode characters, tabs, newlines, carriage returns and page breaks; and be at most 2000 bytes long when encoded in UTF-8. If not set, defaults to an empty description. | false | false | None | None | None |
| `activated_policy_types` | A list of policy types that are activated for this taxonomy. If not set, defaults to an empty list. Each value may be one of: `POLICY_TYPE_UNSPECIFIED`, `FINE_GRAINED_ACCESS_CONTROL`. | false | true | Fine-grained access control should be enabled so the taxonomy can support sensitive data access control. | ["FINE_GRAINED_ACCESS_CONTROL"] | [] |
| `region` | Taxonomy location region. | false | true | Taxonomies should be created only in approved regions to meet data residency and governance requirements. | australia-southeast1 | us-east1 |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
