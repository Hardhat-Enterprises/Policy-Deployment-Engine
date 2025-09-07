## 🛡️ Policy Deployment Engine: `app_engine_service_split_traffic`

This section provides a concise policy evaluation for the `app_engine_service_split_traffic` resource in GCP.

Reference: [Terraform Registry – app_engine_service_split_traffic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_service_split_traffic)

---

## 1. Argument Reference

### `service`
- Description: (Required) The name of the service these settings apply to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `split`
- Description: (Required) Mapping that defines fractional HTTP traffic diversion to different versions within the service. Structure is [documented below](#nested_split).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `migrate_traffic`
- Description: (Optional) If set to true traffic will be migrated to this version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_split"></a>The `split` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shard_by`
- Description: (Optional) Mechanism used to determine which version a request is sent to. The traffic selection algorithm will be stable for either type until allocations are changed. Possible values are: `UNSPECIFIED`, `COOKIE`, `IP`, `RANDOM`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allocations`
- Description: (Required) Mapping from version IDs within the service to fractional (0.000, 1] allocations of traffic for that version. Each version can be specified only once, but some versions in the service may not have any traffic allocation. Services that have traffic allocated cannot be deleted until either the service is deleted or their traffic allocation is removed. Allocations must sum to 1. Up to two decimal place precision is supported for IP-based splits and up to three decimal places is supported for cookie-based splits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
