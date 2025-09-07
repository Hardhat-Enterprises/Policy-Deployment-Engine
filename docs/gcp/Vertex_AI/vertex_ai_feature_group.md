## 🛡️ Policy Deployment Engine: `vertex_ai_feature_group`

This section provides a concise policy evaluation for the `vertex_ai_feature_group` resource in GCP.

Reference: [Terraform Registry – vertex_ai_feature_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_feature_group)

---

## 1. Argument Reference

### `name`
- Description: (Optional) The resource name of the Feature Group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels with user-defined metadata to organize your FeatureGroup. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of the FeatureGroup.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `big_query`
- Description: (Optional) Indicates that features for this group come from BigQuery Table/View. By default treats the source as a sparse time series source, which is required to have an entityId and a feature_timestamp column in the source. Structure is [documented below](#nested_big_query).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of feature group. eg us-central1
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_big_query"></a>The `big_query` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `big_query_source`
- Description: (Required) The BigQuery source URI that points to either a BigQuery Table or View. Structure is [documented below](#nested_big_query_big_query_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entity_id_columns`
- Description: (Optional) Columns to construct entityId / row keys. If not provided defaults to entityId. <a name="nested_big_query_big_query_source"></a>The `big_query_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `input_uri`
- Description: (Required) BigQuery URI to a table, up to 2000 characters long. For example: `bq://projectId.bqDatasetId.bqTableId.`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
