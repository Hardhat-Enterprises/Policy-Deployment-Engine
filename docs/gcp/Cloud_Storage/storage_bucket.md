## 🛡️ Policy Deployment Engine: `storage_bucket`

This section provides a concise policy evaluation for the `storage_bucket` resource in GCP.

Reference: [Terraform Registry – storage_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket)

---

## 1. Argument Reference

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_destroy`
- Description: boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_class`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoclass`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lifecycle_rule`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `versioning`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `website`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cors`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_event_based_hold`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention_policy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_object_retention`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `requester_pays`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rpo`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uniform_bucket_level_access`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_access_prevention`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_placement_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `soft_delete_policy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hierarchical_namespace`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_created`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `updated`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_filter`
- Description: <a name="nested_lifecycle_rule"></a>The `lifecycle_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: <a name="nested_action"></a>The `action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_class`
- Description: <a name="nested_condition"></a>The `condition` block supports the following elements, and requires at least one to be defined. If you specify multiple conditions in a rule, an object has to match all of the conditions for the action to be taken:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `age`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `created_before`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `with_state`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `matches_storage_class`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `matches_prefix`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `matches_suffix`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_newer_versions`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `send_num_newer_versions_if_zero`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_time_before`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `days_since_custom_time`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `send_age_if_zero`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `send_days_since_custom_time_if_zero`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `days_since_noncurrent_time`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `send_days_since_noncurrent_time_if_zero`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `noncurrent_time_before`
- Description: <a name="nested_autoclass"></a>The `autoclass` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `terminal_storage_class`
- Description: <a name="nested_versioning"></a>The `versioning` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: <a name="nested_website"></a>The `website` block supports the following elements, and requires at least one to be defined:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_page_suffix`
- Description: missing objects are treated as potential directories.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `not_found_page`
- Description: resource is not found. <a name="nested_cors"></a>The `cors` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `origin`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `method`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_header`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_age_seconds`
- Description: <a name="nested_retention_policy"></a>The `retention_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_locked`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention_period`
- Description: <a name="nested_logging"></a>The `logging` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_bucket`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_object_prefix`
- Description: by default GCS sets this to this bucket's name. <a name="nested_encryption"></a>The `encryption` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_locations`
- Description: <a name="nested_soft_delete_policy"></a>The `soft_delete_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention_duration_seconds`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effective_time`
- Description: <a name="nested_hierarchical_namespace"></a>The `hierarchical_namespace` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: <a name="nested_ip_filter"></a>The `ip_filter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_cross_org_vpcs`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_network_source`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_network_sources`
- Description: <a name="nested_public_network_source"></a>The `public_network_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_ip_cidr_ranges`
- Description: <a name="nested_vpc_network_sources"></a>The `vpc_network_sources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_ip_cidr_ranges`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
