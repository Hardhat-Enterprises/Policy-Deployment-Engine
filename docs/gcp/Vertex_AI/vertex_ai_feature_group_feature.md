## 🛡️ Policy Deployment Engine: `vertex_ai_feature_group_feature`

This section provides a concise policy evaluation for the `vertex_ai_feature_group_feature` resource in GCP.

Reference: [Terraform Registry – vertex_ai_feature_group_feature](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_feature_group_feature)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name of the Feature Group Feature.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `feature_group`
- Description: (Required) The name of the Feature Group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Required) The region for the resource. It should be the same as the feature group's region.
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

### `version_column_name`
- Description: (Optional) The name of the BigQuery Table/View column hosting data for this version. If no value is provided, will use featureId.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
