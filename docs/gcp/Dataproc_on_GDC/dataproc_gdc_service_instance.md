## 🛡️ Policy Deployment Engine: `dataproc_gdc_service_instance`

This section provides a concise policy evaluation for the `dataproc_gdc_service_instance` resource in GCP.

Reference: [Terraform Registry – dataproc_gdc_service_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_gdc_service_instance)

---

## 1. Argument Reference

### `location`
- Description: (Required) Location of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_instance_id`
- Description: (Required) Id of the service instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gdce_cluster`
- Description: (Optional) Gdce cluster information. Structure is [documented below](#nested_gdce_cluster).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User-provided human-readable name to be used in user interfaces.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels to associate with this service instance. Labels may be used for filtering and billing tracking. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_service_instance_config`
- Description: (Optional) Spark-specific service instance configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) Requested service account to associate with ServiceInstance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_gdce_cluster"></a>The `gdce_cluster` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gdce_cluster`
- Description: (Required) Gdce cluster resource id.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
