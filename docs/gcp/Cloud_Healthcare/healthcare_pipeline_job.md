## 🛡️ Policy Deployment Engine: `healthcare_pipeline_job`

This section provides a concise policy evaluation for the `healthcare_pipeline_job` resource in GCP.

Reference: [Terraform Registry – healthcare_pipeline_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_pipeline_job)

---

## 1. Argument Reference

### `name`
- Description: (Required) Specifies the name of the pipeline job. This field is user-assigned.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Location where the Pipeline Job is to run
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset`
- Description: (Required) Healthcare Dataset under which the Pipeline Job is to run
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_lineage`
- Description: (Optional) If true, disables writing lineage for the pipeline.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-supplied key-value pairs used to organize Pipeline Jobs. Label keys must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}][\p{Ll}\p{Lo}\p{N}_-]{0,62} Label values are optional, must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}\p{N}_-]{0,63} No more than 64 labels can be associated with a given pipeline. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mapping_pipeline_job`
- Description: (Optional) Specifies mapping configuration. Structure is [documented below](#nested_mapping_pipeline_job).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reconciliation_pipeline_job`
- Description: (Optional) Specifies reconciliation configuration. Structure is [documented below](#nested_reconciliation_pipeline_job).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backfill_pipeline_job`
- Description: (Optional) Specifies the backfill configuration. Structure is [documented below](#nested_backfill_pipeline_job). <a name="nested_mapping_pipeline_job"></a>The `mapping_pipeline_job` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mapping_config`
- Description: (Required) The location of the mapping configuration. Structure is [documented below](#nested_mapping_pipeline_job_mapping_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fhir_streaming_source`
- Description: (Optional) A streaming FHIR data source. Structure is [documented below](#nested_mapping_pipeline_job_fhir_streaming_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fhir_store_destination`
- Description: (Optional) If set, the mapping pipeline will write snapshots to this FHIR store without assigning stable IDs. You must grant your pipeline project's Cloud Healthcare Service Agent serviceaccount healthcare.fhirResources.executeBundle and healthcare.fhirResources.create permissions on the destination store. The destination store must set [disableReferentialIntegrity][FhirStore.disable_referential_integrity] to true. The destination store must use FHIR version R4. Format: project/{projectID}/locations/{locationID}/datasets/{datasetName}/fhirStores/{fhirStoreID}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reconciliation_destination`
- Description: (Optional) If set to true, a mapping pipeline will send output snapshots to the reconciliation pipeline in its dataset. A reconciliation pipeline must exist in this dataset before a mapping pipeline with a reconciliation destination can be created. <a name="nested_mapping_pipeline_job_mapping_config"></a>The `mapping_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Describes the mapping configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `whistle_config_source`
- Description: (Optional) Specifies the path to the mapping configuration for harmonization pipeline. Structure is [documented below](#nested_mapping_pipeline_job_mapping_config_whistle_config_source). <a name="nested_mapping_pipeline_job_mapping_config_whistle_config_source"></a>The `whistle_config_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) Main configuration file which has the entrypoint or the root function. Example: gs://{bucket-id}/{path/to/import-root/dir}/entrypoint-file-name.wstl.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `import_uri_prefix`
- Description: (Required) Directory path where all the Whistle files are located. Example: gs://{bucket-id}/{path/to/import-root/dir} <a name="nested_mapping_pipeline_job_fhir_streaming_source"></a>The `fhir_streaming_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fhir_store`
- Description: (Required) The path to the FHIR store in the format projects/{projectId}/locations/{locationId}/datasets/{datasetId}/fhirStores/{fhirStoreId}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Describes the streaming FHIR data source. <a name="nested_reconciliation_pipeline_job"></a>The `reconciliation_pipeline_job` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `merge_config`
- Description: (Required) Specifies the location of the reconciliation configuration. Structure is [documented below](#nested_reconciliation_pipeline_job_merge_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `matching_uri_prefix`
- Description: (Required) Specifies the top level directory of the matching configs used in all mapping pipelines, which extract properties for resources to be matched on. Example: gs://{bucket-id}/{path/to/matching/configs}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fhir_store_destination`
- Description: (Optional) The harmonized FHIR store to write harmonized FHIR resources to, in the format of: project/{projectID}/locations/{locationID}/datasets/{datasetName}/fhirStores/{id} <a name="nested_reconciliation_pipeline_job_merge_config"></a>The `merge_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Describes the mapping configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `whistle_config_source`
- Description: (Required) Specifies the path to the mapping configuration for harmonization pipeline. Structure is [documented below](#nested_reconciliation_pipeline_job_merge_config_whistle_config_source). <a name="nested_reconciliation_pipeline_job_merge_config_whistle_config_source"></a>The `whistle_config_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) Main configuration file which has the entrypoint or the root function. Example: gs://{bucket-id}/{path/to/import-root/dir}/entrypoint-file-name.wstl.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `import_uri_prefix`
- Description: (Required) Directory path where all the Whistle files are located. Example: gs://{bucket-id}/{path/to/import-root/dir} <a name="nested_backfill_pipeline_job"></a>The `backfill_pipeline_job` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mapping_pipeline_job`
- Description: (Optional) Specifies the mapping pipeline job to backfill, the name format should follow: projects/{projectId}/locations/{locationId}/datasets/{datasetId}/pipelineJobs/{pipelineJobId}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
