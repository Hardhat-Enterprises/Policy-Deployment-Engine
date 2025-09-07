## 🛡️ Policy Deployment Engine: `dataplex_lake`

This section provides a concise policy evaluation for the `dataplex_lake` resource in GCP.

Reference: [Terraform Registry – dataplex_lake](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_lake)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the lake. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. Description of the lake.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Optional. User friendly display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. User-defined labels for the lake. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metastore`
- Description: (Optional) Optional. Settings to manage lake and Dataproc Metastore service instance association.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `metastore` Block

### `service`
- Description: (Optional) Optional. A relative reference to the Dataproc Metastore (https://cloud.google.com/dataproc-metastore/docs) service associated with the lake: `projects/{project_id}/locations/{location_id}/services/{service_id}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
