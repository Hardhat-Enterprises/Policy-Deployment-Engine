## 🛡️ Policy Deployment Engine: `biglake_database`

This section provides a concise policy evaluation for the `biglake_database` resource in GCP.

Reference: [Terraform Registry – biglake_database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/biglake_database)

---

## 1. Argument Reference

### `type`
- Description: (Required) The database type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hive_options`
- Description: (Required) Options of a Hive database. Structure is [documented below](#nested_hive_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `catalog`
- Description: (Required) The parent catalog.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the database. <a name="nested_hive_options"></a>The `hive_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location_uri`
- Description: (Optional) Cloud Storage folder URI where the database data is stored, starting with "gs://".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameters`
- Description: (Optional) Stores user supplied Hive database parameters. An object containing a list of"key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
