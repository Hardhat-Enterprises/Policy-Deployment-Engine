## 🛡️ Policy Deployment Engine: `chronicle_data_access_scope`

This section provides a concise policy evaluation for the `chronicle_data_access_scope` resource in GCP.

Reference: [Terraform Registry – chronicle_data_access_scope](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_data_access_scope)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Required) The unique identifier for the Chronicle instance, which is the same as the customer ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_access_scope_id`
- Description: (Required) Required. The user provided scope id which will become the last part of the name of the scope resource. Needs to be compliant with https://google.aip.dev/122
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_data_access_labels`
- Description: (Optional) The allowed labels for the scope. There has to be at least one label allowed for the scope to be valid. The logical operator for evaluation of the allowed labels is OR. Either allow_all or allowed_data_access_labels needs to be provided. E.g.: A customer with scope with allowed labels A and B will be able to see data with labeled with A or B or (A and B). Structure is [documented below](#nested_allowed_data_access_labels).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_all`
- Description: (Optional) Optional. Whether or not the scope allows all labels, allow_all and allowed_data_access_labels are mutually exclusive and one of them must be present. denied_data_access_labels can still be used along with allow_all. When combined with denied_data_access_labels, access will be granted to all data that doesn't have labels mentioned in denied_data_access_labels. E.g.: A customer with scope with denied labels A and B and allow_all will be able to see all data except data labeled with A and data labeled with B and data with labels A and B.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `denied_data_access_labels`
- Description: (Optional) Optional. The denied labels for the scope. The logical operator for evaluation of the denied labels is AND. E.g.: A customer with scope with denied labels A and B won't be able to see data labeled with A and data labeled with B and data with labels A and B. Structure is [documented below](#nested_denied_data_access_labels).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. A description of the data access scope for a human reader.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_allowed_data_access_labels"></a>The `allowed_data_access_labels` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_access_label`
- Description: (Optional) The name of the data access label.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_type`
- Description: (Optional) The name of the log type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `asset_namespace`
- Description: (Optional) The asset namespace configured in the forwarder of the customer's events.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingestion_label`
- Description: (Optional) Representation of an ingestion label type. Structure is [documented below](#nested_allowed_data_access_labels_allowed_data_access_labels_ingestion_label).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Output) Output only. The display name of the label. Data access label and log types's name will match the display name of the resource. The asset namespace will match the namespace itself. The ingestion key value pair will match the key of the tuple. <a name="nested_allowed_data_access_labels_allowed_data_access_labels_ingestion_label"></a>The `ingestion_label` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingestion_label_key`
- Description: (Required) Required. The key of the ingestion label. Always required.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingestion_label_value`
- Description: (Optional) Optional. The value of the ingestion label. Optional. An object with no provided value and some key provided would match against the given key and ANY value. <a name="nested_denied_data_access_labels"></a>The `denied_data_access_labels` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Output) Output only. The display name of the label. Data access label and log types's name will match the display name of the resource. The asset namespace will match the namespace itself. The ingestion key value pair will match the key of the tuple.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_access_label`
- Description: (Optional) The name of the data access label.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_type`
- Description: (Optional) The name of the log type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `asset_namespace`
- Description: (Optional) The asset namespace configured in the forwarder of the customer's events.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingestion_label`
- Description: (Optional) Representation of an ingestion label type. Structure is [documented below](#nested_denied_data_access_labels_denied_data_access_labels_ingestion_label). <a name="nested_denied_data_access_labels_denied_data_access_labels_ingestion_label"></a>The `ingestion_label` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingestion_label_key`
- Description: (Required) Required. The key of the ingestion label. Always required.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingestion_label_value`
- Description: (Optional) Optional. The value of the ingestion label. Optional. An object with no provided value and some key provided would match against the given key and ANY value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
