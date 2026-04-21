## 🛡️ Policy Deployment Engine: `bigtable_authorized_view`

This section provides a concise policy evaluation for the `bigtable_authorized_view` resource in GCP.

Reference: [Terraform Registry – bigtable_authorized_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_authorized_view)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Configuration for name on this Cloud Bigtable resource. | true | false | This argument is primarily operational and should follow platform standards. | None | None |
| `project` | is not provided, the provider project is used. | true | false | This argument can affect security posture or operational safety and should align with organizational policy. | None | None |
| `instance_name` | Configuration for instance_name on this Cloud Bigtable resource. | true | false | This argument can affect security posture or operational safety and should align with organizational policy. | None | None |
| `table_name` | Configuration for table_name on this Cloud Bigtable resource. | true | false | This argument is primarily operational and should follow platform standards. | None | None |
| `column_family` | Configuration for column_family on this Cloud Bigtable resource. | true | false | This argument is primarily operational and should follow platform standards. | None | None |
| `deletion_protection` | If not provided, currently deletion protection will be set to UNPROTECTED as it is the API default value. Note this field configs the deletion protection provided by the API in the backend, and should not be confused with Terraform-side deletion protection. | false | true | Backend deletion protection reduces accidental or unauthorized removal of authorized view access boundaries. | "PROTECTED" | "UNPROTECTED" |
| `subset_view` | ----- `subset_view` supports the following arguments: | false | false | This argument is primarily operational and should follow platform standards. | None | None |
| `row_prefixes` | Configuration for row_prefixes on this Cloud Bigtable resource. | false | true | Empty row prefix grants full-row access; scoped prefixes enforce least privilege. | ["user_"] | [""] |
| `family_subsets` | ----- `family_subsets` supports the following arguments: | false | false | This argument is primarily operational and should follow platform standards. | None | None |
| `family_name` | Configuration for family_name on this Cloud Bigtable resource. | false | false | This argument is primarily operational and should follow platform standards. | None | None |
| `qualifiers` | Configuration for qualifiers on this Cloud Bigtable resource. | false | false | This argument is primarily operational and should follow platform standards. | None | None |
| `qualifier_prefixes` | Every qualifier starting with one of these prefixes is included in the authorized view. To provide access to all qualifiers, include the empty string as a prefix (""). | false | true | Empty qualifier prefix grants full qualifier access within a family and increases data exposure. | ["user_"] | [""] |
