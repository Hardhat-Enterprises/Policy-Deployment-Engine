## 🛡️ Policy Deployment Engine: `vertex_ai_feature_group`

This section provides a concise policy evaluation for the `vertex_ai_feature_group` resource in GCP.

Reference: [Terraform Registry – vertex_ai_feature_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_feature_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name of the Feature Group. | false | None | None |
| `labels` | The labels with user-defined metadata to organize your FeatureGroup. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | The description of the FeatureGroup. | false | None | None |
| `region` | The region of feature group. eg us-central1 | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### big_query Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `big_query_source` | The BigQuery source URI that points to either a BigQuery Table or View. Structure is [documented below](#nested_big_query_big_query_source). | true | None | None |
| `entity_id_columns` | Columns to construct entityId / row keys. If not provided defaults to entityId. | false | None | None |

### big_query_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `input_uri` | BigQuery URI to a table, up to 2000 characters long. For example: `bq://projectId.bqDatasetId.bqTableId.` | true | None | None |
