## 🛡️ Policy Deployment Engine: `developer_connect_insights_config`

This section provides a concise policy evaluation for the `developer_connect_insights_config` resource in GCP.

Reference: [Terraform Registry – developer_connect_insights_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/developer_connect_insights_config)

---

## 1. Argument Reference

### `app_hub_application`
- Description: (Required) The name of the App Hub Application. Format: projects/{project}/locations/{location}/applications/{application}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `insights_config_id`
- Description: (Required) ID of the requesting InsightsConfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_configs`
- Description: (Optional) The artifact configurations of the artifacts that are deployed. Structure is [documented below](#nested_artifact_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) User specified annotations. See https://google.aip.dev/148#annotations for more details such as format and size limitations. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of labels associated with an InsightsConfig. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_artifact_configs"></a>The `artifact_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `google_artifact_registry`
- Description: (Optional) Google Artifact Registry configurations. Structure is [documented below](#nested_artifact_configs_artifact_configs_google_artifact_registry).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `google_artifact_analysis`
- Description: (Optional) Google Artifact Analysis configurations. Structure is [documented below](#nested_artifact_configs_artifact_configs_google_artifact_analysis).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) The URI of the artifact that is deployed. e.g. `us-docker.pkg.dev/my-project/my-repo/image`. The URI does not include the tag / digest because it captures a lineage of artifacts. <a name="nested_artifact_configs_artifact_configs_google_artifact_registry"></a>The `google_artifact_registry` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The host project of Artifact Registry.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_registry_package`
- Description: (Required) The name of the artifact registry package. <a name="nested_artifact_configs_artifact_configs_google_artifact_analysis"></a>The `google_artifact_analysis` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The project id of the project where the provenance is stored.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
