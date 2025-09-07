## 🛡️ Policy Deployment Engine: `dataflow_job`

This section provides a concise policy evaluation for the `dataflow_job` resource in GCP.

Reference: [Terraform Registry – dataflow_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataflow_job)

---

## 1. Argument Reference

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `template_gcs_path`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `temp_gcs_location`
- Description: - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameters`
- Description: case-sensitive based on the language on which the pipeline is coded, mostly Java. **Note**: do not configure Dataflow options here in parameters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: specified in the [labeling restrictions](https://cloud.google.com/compute/docs/labeling-resources#restrictions) page. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `terraform_labels`
- Description: The combination of labels configured directly on the resource and default labels configured on the provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effective_labels`
- Description: All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transform_name_mapping`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_workers`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `on_delete`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `skip_wait_on_job_termination`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_configuration`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_experiments`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_streaming_engine`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
