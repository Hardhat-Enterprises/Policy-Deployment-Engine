## 🛡️ Policy Deployment Engine: `cloud_asset_folder_feed`

This section provides a concise policy evaluation for the `cloud_asset_folder_feed` resource in GCP.

Reference: [Terraform Registry – cloud_asset_folder_feed](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_asset_folder_feed)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `billing_project` | The project whose identity will be used when sending messages to the destination pubsub topic. It also specifies the project for API enablement check, quota, and billing. | true | None | None |
| `feed_id` | This is the client-assigned asset feed identifier and it needs to be unique under a specific parent. | true | None | None |
| `folder` | The folder this feed should be created in. | true | None | None |
| `asset_names` | A list of the full names of the assets to receive updates. You must specify either or both of assetNames and assetTypes. Only asset updates matching specified assetNames and assetTypes are exported to the feed. For example: //compute.googleapis.com/projects/my_project_123/zones/zone1/instances/instance1. See https://cloud.google.com/apis/design/resourceNames#fullResourceName for more info. | false | None | None |
| `asset_types` | A list of types of the assets to receive updates. You must specify either or both of assetNames and assetTypes. Only asset updates matching specified assetNames and assetTypes are exported to the feed. For example: "compute.googleapis.com/Disk" See https://cloud.google.com/asset-inventory/docs/supported-asset-types for a list of all supported asset types. | false | None | None |
| `content_type` | Asset content type. If not specified, no content but the asset name and type will be returned. Possible values are: `CONTENT_TYPE_UNSPECIFIED`, `RESOURCE`, `IAM_POLICY`, `ORG_POLICY`, `OS_INVENTORY`, `ACCESS_POLICY`. | false | None | None |

### feed_output_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pubsub_destination` | Destination on Cloud Pubsub. Structure is [documented below](#nested_feed_output_config_pubsub_destination). | true | None | None |

### condition Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | true | None | None |
| `title` | Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | None | None |
| `description` | Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | None | None |
| `location` | String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | None | None |

### pubsub_destination Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `topic` | Destination on Cloud Pubsub topic. | true | None | None |
