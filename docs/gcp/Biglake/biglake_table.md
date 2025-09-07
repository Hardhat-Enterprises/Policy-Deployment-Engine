## 🛡️ Policy Deployment Engine: `biglake_table`

This section provides a concise policy evaluation for the `biglake_table` resource in GCP.

Reference: [Terraform Registry – biglake_table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/biglake_table)

---

## 1. Argument Reference

### `name`
- Description: (Required) Output only. The name of the Table. Format: projects/{project_id_or_number}/locations/{locationId}/catalogs/{catalogId}/databases/{databaseId}/tables/{tableId}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The database type. Possible values are: `HIVE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hive_options`
- Description: (Optional) Options of a Hive table. Structure is [documented below](#nested_hive_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database`
- Description: (Optional) The id of the parent database. <a name="nested_hive_options"></a>The `hive_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameters`
- Description: (Optional) Stores user supplied Hive table parameters. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_type`
- Description: (Optional) Hive table type. For example, MANAGED_TABLE, EXTERNAL_TABLE.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_descriptor`
- Description: (Optional) Stores physical storage information on the data. Structure is [documented below](#nested_hive_options_storage_descriptor). <a name="nested_hive_options_storage_descriptor"></a>The `storage_descriptor` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location_uri`
- Description: (Optional) Cloud Storage folder URI where the table data is stored, starting with "gs://".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `input_format`
- Description: (Optional) The fully qualified Java class name of the input format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_format`
- Description: (Optional) The fully qualified Java class name of the output format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
