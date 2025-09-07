## 🛡️ Policy Deployment Engine: `dataproc_gdc_application_environment`

This section provides a concise policy evaluation for the `dataproc_gdc_application_environment` resource in GCP.

Reference: [Terraform Registry – dataproc_gdc_application_environment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_gdc_application_environment)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location of the application environment
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `serviceinstance`
- Description: (Required) The id of the service instance to which this application environment belongs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User-provided human-readable name to be used in user interfaces.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels to associate with this application environment. Labels may be used for filtering and billing tracking. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) The annotations to associate with this application environment. Annotations may be used to store client information, but are not used by the server. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_application_environment_config`
- Description: (Optional) Represents the SparkApplicationEnvironmentConfig. Structure is [documented below](#nested_spark_application_environment_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace`
- Description: (Optional) The name of the namespace in which to create this ApplicationEnvironment. This namespace must already exist in the cluster
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `application_environment_id`
- Description: (Optional) The id of the application environment
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_spark_application_environment_config"></a>The `spark_application_environment_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_properties`
- Description: (Optional) A map of default Spark properties to apply to workloads in this application environment. These defaults may be overridden by per-application properties.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_version`
- Description: (Optional) The default Dataproc version to use for applications submitted to this application environment
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
