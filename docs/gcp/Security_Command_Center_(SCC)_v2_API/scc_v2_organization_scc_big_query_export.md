## 🛡️ Policy Deployment Engine: `scc_v2_organization_scc_big_query_export`

This section provides a concise policy evaluation for the `scc_v2_organization_scc_big_query_export` resource in GCP.

Reference: [Terraform Registry – scc_v2_organization_scc_big_query_export](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_v2_organization_scc_big_query_export)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `organization` | The organization whose Cloud Security Command Center the Big Query Export Config lives in. | true | None | None |
| `big_query_export_id` | This must be unique within the organization. | true | None | None |
| `name` | The resource name of this export, in the format `organizations/{{organization}}/locations/{{location}}/bigQueryExports/{{big_query_export_id}}`. This field is provided in responses, and is ignored when provided in create requests. | false | None | None |
| `description` | The description of the notification config (max of 1024 characters). | false | None | None |
| `dataset` | The dataset to write findings' updates to. Its format is "projects/[projectId]/datasets/[bigquery_dataset_id]". BigQuery Dataset unique ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). | false | None | None |
| `filter` | Expression that defines the filter to apply across create/update events of findings. The expression is a list of zero or more restrictions combined via logical operators AND and OR. Parentheses are supported, and OR has higher precedence than AND. Restrictions have the form <field> <operator> <value> and may have a - character in front of them to indicate negation. The fields map to those defined in the corresponding resource. The supported operators are: * = for all value types. * >, <, >=, <= for integer values. * :, meaning substring matching, for strings. The supported value types are: * string literals in quotes. * integer literals without quotes. * boolean literals true and false without quotes. See [Filtering notifications](https://cloud.google.com/security-command-center/docs/how-to-api-filter-notifications) for information on how to write a filter. | false | None | None |
| `location` | location Id is provided by organization. If not provided, Use global as default. | false | None | None |
