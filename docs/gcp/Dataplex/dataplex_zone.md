## 🛡️ Policy Deployment Engine: `dataplex_zone`

This section provides a concise policy evaluation for the `dataplex_zone` resource in GCP.

Reference: [Terraform Registry – dataplex_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_zone)

---

## 1. Argument Reference

### `discovery_spec`
- Description: (Required) Required. Specification of the discovery feature applied to data in this zone.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lake`
- Description: (Required) The lake for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the zone.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_spec`
- Description: (Required) Required. Immutable. Specification of the resources that are referenced by the assets within this zone.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Required. Immutable. The type of the zone. Possible values: TYPE_UNSPECIFIED, RAW, CURATED
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `discovery_spec` Block

### `csv_options`
- Description: (Optional) Optional. Configuration for CSV data.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Required. Whether discovery is enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_patterns`
- Description: (Optional) Optional. The list of patterns to apply for selecting data to exclude during discovery. For Cloud Storage bucket assets, these are interpreted as glob patterns used to match object names. For BigQuery dataset assets, these are interpreted as patterns to match table names.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_patterns`
- Description: (Optional) Optional. The list of patterns to apply for selecting data to include during discovery if only a subset of the data should considered. For Cloud Storage bucket assets, these are interpreted as glob patterns used to match object names. For BigQuery dataset assets, these are interpreted as patterns to match table names.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `json_options`
- Description: (Optional) Optional. Configuration for Json data.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule`
- Description: (Optional) Optional. Cron schedule (https://en.wikipedia.org/wiki/Cron) for running discovery periodically. Successive discovery runs must be scheduled at least 60 minutes apart. The default value is to run discovery every 60 minutes. To explicitly set a timezone to the cron tab, apply a prefix in the cron tab: "CRON_TZ=${IANA_TIME_ZONE}" or TZ=${IANA_TIME_ZONE}". The ${IANA_TIME_ZONE} may only be a valid string from IANA time zone database. For example, "CRON_TZ=America/New_York 1 * * * *", or "TZ=America/New_York 1 * * * *".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `resource_spec` Block

### `location_type`
- Description: (Required) Required. Immutable. The location type of the resources that are allowed to be attached to the assets within this zone. Possible values: LOCATION_TYPE_UNSPECIFIED, SINGLE_REGION, MULTI_REGION - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. Description of the zone.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Optional. User friendly display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. User defined labels for the zone. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `csv_options` Block

### `delimiter`
- Description: (Optional) Optional. The delimiter being used to separate values. This defaults to ','.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_type_inference`
- Description: (Optional) Optional. Whether to disable the inference of data type for CSV data. If true, all columns will be registered as strings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encoding`
- Description: (Optional) Optional. The character encoding of the data. The default is UTF-8.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_rows`
- Description: (Optional) Optional. The number of rows to interpret as header rows that should be skipped when reading data rows.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `json_options` Block

### `disable_type_inference`
- Description: (Optional) Optional. Whether to disable the inference of data type for Json data. If true, all columns will be registered as their primitive types (strings, number or boolean).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encoding`
- Description: (Optional) Optional. The character encoding of the data. The default is UTF-8.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
