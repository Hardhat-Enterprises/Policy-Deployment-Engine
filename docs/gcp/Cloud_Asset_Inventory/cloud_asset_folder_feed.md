## 🛡️ Policy Deployment Engine: `cloud_asset_folder_feed`

This section provides a concise policy evaluation for the `cloud_asset_folder_feed` resource in GCP.

Reference: [Terraform Registry – cloud_asset_folder_feed](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_asset_folder_feed)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `billing_project` | The project whose identity will be used when sending messages to the destination pubsub topic. It also specifies the project for API enablement check, quota, and billing. | true | false | Used for billing and API access. No direct security impact. | None | None |
| `feed_id` | This is the client-assigned asset feed identifier and it needs to be unique under a specific parent. | true | false | Identifier only. No direct security impact. | None | None |
| `feed_output_config` | Output configuration for asset feed destination. Structure is [documented below](#nested_feed_output_config). | true | true | Determines the destination of asset monitoring data. Incorrect configuration may result in loss or redirection of security logs. | projects/projectExample/topics/topicExample | projects/unknown/topics/invalidTopic |
| `folder` | The folder this feed should be created in. | true | false | Defines scope of monitoring but No direct security impact. | None | None |
| `asset_names` | A list of the full names of the assets to receive updates. You must specify either or both of assetNames and assetTypes. Only asset updates matching specified assetNames and assetTypes are exported to the feed. For example: //compute.googleapis.com/projects/my_project_123/zones/zone1/instances/instance1. See https://cloud.google.com/apis/design/resourceNames#fullResourceName for more info. | false | false | Optional filtering field. No direct security impact. | None | None |
| `asset_types` | List of asset types to monitor. | true | true | Defines which resources are monitored. Missing critical types reduces visibility. | ['compute.googleapis.com/Instance'] | ['storage.googleapis.com/Bucket'] |
| `content_type` | Type of asset data to collect. | true | true | Determines what security-relevant data is captured such as IAM policies and configurations. | ['RESOURCE', 'IAM_POLICY', 'ORG_POLICY', 'ACCESS_POLICY'] | ['OS_INVENTORY'] |
| `condition` | Condition to filter asset updates. | true | false | Controls which events are monitored. Incorrect conditions may miss critical events. | ['temporal_asset.deleted == true'] | ['temporal_asset.deleted == false'] |
| `pubsub_destination` | Destination on Cloud Pub/Sub. | true | true | Defines where asset monitoring data is sent. | projects/projectExample/topics/topicExample | projects/unknown/topics/invalidTopic |

### feed_output_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `pubsub_destination` | Destination on Cloud Pubsub. Structure is [documented below](#nested_feed_output_config_pubsub_destination). | true | false | None | None | None |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression defining filtering condition (Common Expression Language). | true | true | Ensures monitoring focuses on relevant security events. | ['temporal_asset.deleted == true'] | ['temporal_asset.deleted == false'] |
| `title` | Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | false | No direct security impact. | None | None |
| `description` | Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | false | No direct security impact. | None | None |
| `location` | String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | false | None | None | None |

### pubsub_destination Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `topic` | Destination on Cloud Pubsub topic. | true | true | The topic determines the exact destination of asset monitoring data. An unapproved topic may cause loss, redirection, or unauthorized exposure of security logs. | projects/projectExample/topics/topicExample | projects/unknown/topics/invalidTopic |
