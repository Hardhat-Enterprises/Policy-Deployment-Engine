## 🛡️ Policy Deployment Engine: `cloud_quotas_quota_preference`

This section provides a concise policy evaluation for the `cloud_quotas_quota_preference` resource in GCP.

Reference: [Terraform Registry – cloud_quotas_quota_preference](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_quotas_quota_preference)

---

## 1. Argument Reference

### `service`
- Description: (Required) The name of the service to which the quota preference is applied.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quota_id`
- Description: (Required) The id of the quota to which the quota preference is applied. A quota id is unique in the service. Example: `CPUS-per-project-region`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quota_config`
- Description: (Required) The preferred quota configuration. Structure is [documented below](#nested_quota_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The parent of the quota preference. Allowed parents are "projects/[project-id / number]" or "folders/[folder-id / number]" or "organizations/[org-id / number]".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The resource name of the quota preference. Required except in the CREATE requests.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dimensions`
- Description: (Optional) The dimensions that this quota preference applies to. The key of the map entry is the name of a dimension, such as "region", "zone", "network_id", and the value of the map entry is the dimension value. If a dimension is missing from the map of dimensions, the quota preference applies to all the dimension values except for those that have other quota preferences configured for the specific value. NOTE: QuotaPreferences can only be applied across all values of "user" and "resource" dimension. Do not set values for "user" or "resource" in the dimension map. Example: `{"provider": "Foo Inc"}` where "provider" is a service specific dimension.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `justification`
- Description: (Optional) The reason / justification for this quota preference.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `contact_email`
- Description: (Optional) An email address that can be used for quota related communication between the Google Cloud and the user in case the Google Cloud needs further information to make a decision on whether the user preferred quota can be granted. The Google account for the email address must have quota update permission for the project, folder or organization this quota preference is for.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_safety_checks`
- Description: (Optional) The list of quota safety checks to be ignored. Default value is `QUOTA_SAFETY_CHECK_UNSPECIFIED`. Possible values are: `QUOTA_SAFETY_CHECK_UNSPECIFIED`, `QUOTA_DECREASE_BELOW_USAGE`, `QUOTA_DECREASE_PERCENTAGE_TOO_HIGH`. <a name="nested_quota_config"></a>The `quota_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preferred_value`
- Description: (Required) The preferred value. Must be greater than or equal to -1. If set to -1, it means the value is "unlimited".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state_detail`
- Description: (Output) Optional details about the state of this quota preference.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `granted_value`
- Description: (Output) Granted quota value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trace_id`
- Description: (Output) The trace id that the Google Cloud uses to provision the requested quota. This trace id may be used by the client to contact Cloud support to track the state of a quota preference request. The trace id is only produced for increase requests and is unique for each request. The quota decrease requests do not have a trace id.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) The annotations map for clients to store small amounts of arbitrary data. Do not put PII or other sensitive information here. See https://google.aip.dev/128#annotations. An object containing a list of "key: value" pairs. Example: `{ "name": "wrench", "mass": "1.3kg", "count": "3" }`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_origin`
- Description: (Output) The origin of the quota preference request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
