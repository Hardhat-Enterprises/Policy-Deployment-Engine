## 🛡️ Policy Deployment Engine: `colab_notebook_execution`

This section provides a concise policy evaluation for the `colab_notebook_execution` resource in GCP.

Reference: [Terraform Registry – colab_notebook_execution](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/colab_notebook_execution)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) Required. The display name of the Notebook Execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_output_uri`
- Description: (Required) The Cloud Storage location to upload the result to. Format:`gs://bucket-name`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource: https://cloud.google.com/colab/docs/locations
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataform_repository_source`
- Description: (Optional) The Dataform Repository containing the input notebook. Structure is [documented below](#nested_dataform_repository_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_notebook_source`
- Description: (Optional) The Cloud Storage uri for the input notebook. Structure is [documented below](#nested_gcs_notebook_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `direct_notebook_source`
- Description: (Optional) The content of the input notebook in ipynb format. Structure is [documented below](#nested_direct_notebook_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `execution_timeout`
- Description: (Optional) Max running time of the execution job in seconds (default 86400s / 24 hrs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notebook_runtime_template_resource_name`
- Description: (Optional) The NotebookRuntimeTemplate to source compute configuration from.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `execution_user`
- Description: (Optional) The user email to run the execution as.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) The service account to run the execution as.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notebook_execution_job_id`
- Description: (Optional) User specified ID for the Notebook Execution Job
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_dataform_repository_source"></a>The `dataform_repository_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataform_repository_resource_name`
- Description: (Required) The resource name of the Dataform Repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `commit_sha`
- Description: (Optional) The commit SHA to read repository with. If unset, the file will be read at HEAD. <a name="nested_gcs_notebook_source"></a>The `gcs_notebook_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) The Cloud Storage uri pointing to the ipynb file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation`
- Description: (Optional) The version of the Cloud Storage object to read. If unset, the current version of the object is read. See https://cloud.google.com/storage/docs/metadata#generation-number. <a name="nested_direct_notebook_source"></a>The `direct_notebook_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content`
- Description: (Required) The base64-encoded contents of the input notebook file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
