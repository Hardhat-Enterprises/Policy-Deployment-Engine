## 🛡️ Policy Deployment Engine: `data_loss_prevention_stored_info_type`

This section provides a concise policy evaluation for the `data_loss_prevention_stored_info_type` resource in GCP.

Reference: [Terraform Registry – data_loss_prevention_stored_info_type](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_loss_prevention_stored_info_type)

---

## 1. Argument Reference

### `parent`
- Description: (Required) The parent of the info type in any of the following formats:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the info type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User set display name of the info type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stored_info_type_id`
- Description: (Optional) The storedInfoType ID can contain uppercase and lowercase letters, numbers, and hyphens; that is, it must match the regular expression: [a-zA-Z\d-_]+. The maximum length is 100 characters. Can be empty to allow the system to generate one.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex`
- Description: (Optional) Regular expression which defines the rule. Structure is [documented below](#nested_regex).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dictionary`
- Description: (Optional) Dictionary which defines the rule. Structure is [documented below](#nested_dictionary).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `large_custom_dictionary`
- Description: (Optional) Dictionary which defines the rule. Structure is [documented below](#nested_large_custom_dictionary). <a name="nested_regex"></a>The `regex` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pattern`
- Description: (Required) Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_indexes`
- Description: (Optional) The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included. <a name="nested_dictionary"></a>The `dictionary` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `word_list`
- Description: (Optional) List of words or phrases to search for. Structure is [documented below](#nested_dictionary_word_list).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_path`
- Description: (Optional) Newline-delimited file of words in Cloud Storage. Only a single file is accepted. Structure is [documented below](#nested_dictionary_cloud_storage_path). <a name="nested_dictionary_word_list"></a>The `word_list` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `words`
- Description: (Required) Words or phrases defining the dictionary. The dictionary must contain at least one phrase and every phrase must contain at least 2 characters that are letters or digits. <a name="nested_dictionary_cloud_storage_path"></a>The `cloud_storage_path` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) A url representing a file or path (no wildcards) in Cloud Storage. Example: `gs://[BUCKET_NAME]/dictionary.txt` <a name="nested_large_custom_dictionary"></a>The `large_custom_dictionary` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_path`
- Description: (Required) Location to store dictionary artifacts in Google Cloud Storage. These files will only be accessible by project owners and the DLP API. If any of these artifacts are modified, the dictionary is considered invalid and can no longer be used. Structure is [documented below](#nested_large_custom_dictionary_output_path).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_file_set`
- Description: (Optional) Set of files containing newline-delimited lists of dictionary phrases. Structure is [documented below](#nested_large_custom_dictionary_cloud_storage_file_set).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `big_query_field`
- Description: (Optional) Field in a BigQuery table where each cell represents a dictionary phrase. Structure is [documented below](#nested_large_custom_dictionary_big_query_field). <a name="nested_large_custom_dictionary_output_path"></a>The `output_path` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) A url representing a file or path (no wildcards) in Cloud Storage. Example: `gs://[BUCKET_NAME]/dictionary.txt` <a name="nested_large_custom_dictionary_cloud_storage_file_set"></a>The `cloud_storage_file_set` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url`
- Description: (Required) The url, in the format `gs://<bucket>/<path>`. Trailing wildcard in the path is allowed. <a name="nested_large_custom_dictionary_big_query_field"></a>The `big_query_field` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) Field in a BigQuery table where each cell represents a dictionary phrase. Structure is [documented below](#nested_large_custom_dictionary_big_query_field_table).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field`
- Description: (Required) Designated field in the BigQuery table. Structure is [documented below](#nested_large_custom_dictionary_big_query_field_field). <a name="nested_large_custom_dictionary_big_query_field_table"></a>The `table` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The Google Cloud Platform project ID of the project containing the table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) The dataset ID of the table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Required) The name of the table. <a name="nested_large_custom_dictionary_big_query_field_field"></a>The `field` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name describing the field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
