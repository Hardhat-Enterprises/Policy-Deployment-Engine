## 🛡️ Policy Deployment Engine: `bigtable_authorized_view`

This section provides a concise policy evaluation for the `bigtable_authorized_view` resource in GCP.

Reference: [Terraform Registry – bigtable_authorized_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_authorized_view)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
| `instance_name` |  | none | None | None |
| `table_name` |  | none | None | None |
| `column_family` |  | none | None | None |
| `deletion_protection` | If not provided, currently deletion protection will be set to UNPROTECTED as it is the API default value. Note this field configs the deletion protection provided by the API in the backend, and should not be confused with Terraform-side deletion protection. | none | None | None |
| `subset_view` | ----- `subset_view` supports the following arguments: | none | None | None |
| `row_prefixes` |  | none | None | None |
| `family_subsets` | ----- `family_subsets` supports the following arguments: | none | None | None |
| `family_name` |  | none | None | None |
| `qualifiers` |  | none | None | None |
| `qualifier_prefixes` | Every qualifier starting with one of these prefixes is included in the authorized view. To provide access to all qualifiers, include the empty string as a prefix (""). | none | None | None |
