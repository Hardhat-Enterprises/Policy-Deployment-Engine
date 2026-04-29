## 🛡️ Policy Deployment Engine: `bigtable_authorized_view`

This section provides a concise policy evaluation for the `bigtable_authorized_view` resource in GCP.

Reference: [Terraform Registry – bigtable_authorized_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_authorized_view)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Configuration for name on this Cloud Bigtable resource. | true | false | Terraform name for the authorized view. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `project` | is not provided, the provider project is used. | true | false | GCP project ID managing this view. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `instance_name` | Configuration for instance_name on this Cloud Bigtable resource. | true | false | Bigtable instance hosting the backing table. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `table_name` | Configuration for table_name on this Cloud Bigtable resource. | true | false | Backing table for the authorized view. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `column_family` | Configuration for column_family on this Cloud Bigtable resource. | true | false | Column family exposed or constrained by the view. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `deletion_protection` | If not provided, currently deletion protection will be set to UNPROTECTED as it is the API default value. Note this field configs the deletion protection provided by the API in the backend, and should not be confused with Terraform-side deletion protection. | false | true | Backend deletion protection reduces accidental or unauthorized removal of authorized view access boundaries. | "PROTECTED" | "UNPROTECTED" |
| `subset_view` | ----- `subset_view` supports the following arguments: | false | false | Wrapper for subset filters such as row prefixes. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `row_prefixes` | Configuration for row_prefixes on this Cloud Bigtable resource. | false | true | Empty row prefix grants full-row access; scoped prefixes enforce least privilege. | [base64encode("user_")] | [base64encode("")] |
| `family_subsets` | ----- `family_subsets` supports the following arguments: | false | false | Per-family qualifier subsets for fine-grained column access. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `family_name` | Configuration for family_name on this Cloud Bigtable resource. | false | false | Column family targeted by an adjacent subset block. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `qualifiers` | Configuration for qualifiers on this Cloud Bigtable resource. | false | false | Explicit base64-encoded qualifiers allowed in the view. It is metadata/configuration and does not directly grant access, enforce encryption, or expose sensitive data by itself. | None | None |
| `qualifier_prefixes` | Every qualifier starting with one of these prefixes is included in the authorized view. To provide access to all qualifiers, include the empty string as a prefix (""). | false | true | Empty qualifier prefix grants full qualifier access within a family and increases data exposure. | [base64encode("user_")] | [base64encode("")] |
