## 🛡️ Policy Deployment Engine: `cloud_asset_project_feed`

This section provides a concise policy evaluation for the `cloud_asset_project_feed` resource in GCP.

Reference: [Terraform Registry – cloud_asset_project_feed](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_asset_project_feed)

---

## 1. Argument Reference

### `feed_id`
- Description: (Required) This is the client-assigned asset feed identifier and it needs to be unique under a specific parent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `feed_output_config`
- Description: (Required) Output configuration for asset feed destination. Structure is [documented below](#nested_feed_output_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `billing_project`
- Description: (Optional) The project whose identity will be used when sending messages to the destination pubsub topic. It also specifies the project for API enablement check, quota, and billing. If not specified, the resource's project will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `asset_names`
- Description: (Optional) A list of the full names of the assets to receive updates. You must specify either or both of assetNames and assetTypes. Only asset updates matching specified assetNames and assetTypes are exported to the feed. For example: //compute.googleapis.com/projects/my_project_123/zones/zone1/instances/instance1. See https://cloud.google.com/apis/design/resourceNames#fullResourceName for more info.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `asset_types`
- Description: (Optional) A list of types of the assets to receive updates. You must specify either or both of assetNames and assetTypes. Only asset updates matching specified assetNames and assetTypes are exported to the feed. For example: "compute.googleapis.com/Disk" See https://cloud.google.com/asset-inventory/docs/supported-asset-types for a list of all supported asset types.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_type`
- Description: (Optional) Asset content type. If not specified, no content but the asset name and type will be returned. Possible values are: `CONTENT_TYPE_UNSPECIFIED`, `RESOURCE`, `IAM_POLICY`, `ORG_POLICY`, `OS_INVENTORY`, `ACCESS_POLICY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: (Optional) A condition which determines whether an asset update should be published. If specified, an asset will be returned only when the expression evaluates to true. When set, expression field must be a valid CEL expression on a TemporalAsset with name temporal_asset. Example: a Feed with expression "temporal_asset.deleted == true" will only publish Asset deletions. Other fields of condition are optional. Structure is [documented below](#nested_condition).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_feed_output_config"></a>The `feed_output_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pubsub_destination`
- Description: (Required) Destination on Cloud Pubsub. Structure is [documented below](#nested_feed_output_config_pubsub_destination). <a name="nested_feed_output_config_pubsub_destination"></a>The `pubsub_destination` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topic`
- Description: (Required) Destination on Cloud Pubsub topic. <a name="nested_condition"></a>The `condition` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: (Required) Textual representation of an expression in Common Expression Language syntax.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: (Optional) Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) String indicating the location of the expression for error reporting, e.g. a file name and a position in the file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
