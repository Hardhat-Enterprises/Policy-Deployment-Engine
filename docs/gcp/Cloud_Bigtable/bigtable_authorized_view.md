## 🛡️ Policy Deployment Engine: `bigtable_authorized_view`

This section provides a concise policy evaluation for the `bigtable_authorized_view` resource in GCP.

Reference: [Terraform Registry – bigtable_authorized_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_authorized_view)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of this authorized view. | true | false | A resource name/identifier in config; it is not a service account key or password and does not, by itself, add principals to IAM. | None | None |
| `project` | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | false | false | Project IDs are non-secret scope metadata; they do not replace authentication or table IAM when reading data. | None | None |
| `instance_name` | The name of the Bigtable instance containing the table. | true | false | Points at an instance by name only; names are not credentials and access still depends on IAM and client identity. | None | None |
| `table_name` | The name of the table to create the authorized view on. | true | false | Identifies which table backs the view; it does not list who may read rows—that remains IAM plus the effective subset_view filters. | None | None |
| `column_family` | The name of the column family that the authorized view can access. | true | false | A schema label for which family the view applies to; it is not an IAM role string and does not grant anonymous access. | None | None |
| `deletion_protection` | The deletion protection state of the authorized view. `PROTECTED` or `UNPROTECTED` (API default for new resources is `UNPROTECTED` if unset). | false | true | Backend deletion protection reduces accidental or malicious removal of the view configuration that enforces least-privilege data access. | "PROTECTED" | "UNPROTECTED" |
| `subset_view` | Optional block that limits which rows and column qualifiers the authorized view can read. Omitted means no authorized view is defined in this resource (see provider docs for full behavior). | false | false | Terraform grouping only: the block header carries no secret values. Whether data is over-exposed is determined by nested `row_prefixes` and `family_subsets`, which are evaluated separately where policies apply. | None | None |

### subset_view Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `row_prefixes` | List of base64-encoded row key prefixes included in the view. Including an empty prefix exposes all rows for the authorized columns. | false | true | An empty string prefix matches every row key for that family subset path and defeats row-level least privilege—your policies evaluate `subset_view.row_prefixes`. | [base64encode("user_")] | [base64encode("")] |
| `family_subsets` | Repeated block restricting visibility to one column family with optional qualifier lists or prefixes. | false | false | Structural block for per-family qualifier rules; the block itself does not grant IAM—actual exposure comes from `qualifier_prefixes`, `qualifiers`, and row prefixes, which may be security-relevant when overly broad. | None | None |

###   family_subsets Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `family_name` | The column family name for this subset. | true | false | Non-secret schema identifier; narrowing which family is included does not by itself authenticate callers. | None | None |
  | `qualifiers` | Exact base64-encoded qualifiers allowed in this subset. | false | false | Declares which column qualifiers may appear in the view configuration; it shapes column visibility but does not add IAM members or expose stored row payloads without authorized reads. | None | None |
  | `qualifier_prefixes` | Base64-encoded prefixes; any qualifier starting with one of these prefixes is included. Including the empty string matches all qualifiers in the family. | false | true | An empty-string prefix matches every qualifier in the family and increases column exposure—your policies evaluate `subset_view.family_subsets.qualifier_prefixes`. | [base64encode("user_")] | [base64encode("")] |
