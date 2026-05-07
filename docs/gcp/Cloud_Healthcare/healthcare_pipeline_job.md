## 🛡️ Policy Deployment Engine: `healthcare_pipeline_job`

This section provides a concise policy evaluation for the `healthcare_pipeline_job` resource in GCP.

Reference: [Terraform Registry – healthcare_pipeline_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_pipeline_job)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Specifies the name of the pipeline job. This field is user-assigned. | true | false | The name is a resource identifier only and does not affect security posture. | None | None |
| `location` | Location where the Pipeline Job is to run | true | false | The location field defines where the pipeline runs and does not directly affect the security posture of the pipeline job itself. | None | None |
| `dataset` | Healthcare Dataset under which the Pipeline Job is to run | true | false | The dataset field is a required reference to the parent dataset and does not directly affect security posture. | None | None |
| `disable_lineage` | If true, disables writing lineage for the pipeline. | false | true | Lineage tracking records data provenance across pipeline transformations, enabling organisations to trace how PHI was processed and transformed. Disabling lineage removes this audit capability, making it impossible to investigate data quality issues or demonstrate compliance with HIPAA data stewardship requirements. | disable_lineage = false | disable_lineage = true |
| `labels` | User-supplied key-value pairs used to organize Pipeline Jobs. Label keys must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}][\p{Ll}\p{Lo}\p{N}_-]{0,62} Label values are optional, must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}\p{N}_-]{0,63} No more than 64 labels can be associated with a given pipeline. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Labels are essential for resource governance, cost attribution, and access control enforcement. Missing or unapproved labels make it impossible to identify pipeline ownership, classify PHI processing jobs, and apply organisation-wide security policies consistently. | labels = { environment = "prod", owner = "healthcare-team" } | labels not set (null) or missing required keys environment and owner |
| `mapping_pipeline_job` | Specifies mapping configuration. Structure is [documented below](#nested_mapping_pipeline_job). | false | false | The mapping_pipeline_job block defines the mapping configuration and does not directly affect security posture. | None | None |
| `reconciliation_pipeline_job` | Specifies reconciliation configuration. Structure is [documented below](#nested_reconciliation_pipeline_job). | false | false | The reconciliation_pipeline_job block defines reconciliation configuration and does not directly affect security posture. | None | None |
| `backfill_pipeline_job` | Specifies the backfill configuration. Structure is [documented below](#nested_backfill_pipeline_job). | false | false | The backfill_pipeline_job block defines backfill configuration and does not directly affect security posture. | None | None |
| `mapping_config` |  | false | false | The mapping_config block defines the mapping logic configuration and does not directly affect security posture. | None | None |
| `whistle_config_source` |  | false | false | The whistle_config_source block defines GCS paths for Whistle mapping files and does not directly affect security posture. | None | None |
| `fhir_streaming_source` |  | false | false | The fhir_streaming_source block defines the streaming input source and does not directly affect security posture. | None | None |
| `merge_config` |  | false | false | The merge_config block defines reconciliation merge logic and does not directly affect security posture. | None | None |

### mapping_pipeline_job Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mapping_config` | The location of the mapping configuration. Structure is [documented below](#nested_mapping_pipeline_job_mapping_config). | true | false | The mapping_config is a required reference to mapping logic and does not directly affect security posture. | None | None |
| `fhir_streaming_source` | A streaming FHIR data source. Structure is [documented below](#nested_mapping_pipeline_job_fhir_streaming_source). | false | false | The fhir_streaming_source defines the input data source and does not directly affect security posture. | None | None |
| `fhir_store_destination` | If set, the mapping pipeline will write snapshots to this FHIR store without assigning stable IDs. You must grant your pipeline project's Cloud Healthcare Service Agent serviceaccount healthcare.fhirResources.executeBundle and healthcare.fhirResources.create permissions on the destination store. The destination store must set [disableReferentialIntegrity][FhirStore.disable_referential_integrity] to true. The destination store must use FHIR version R4. Format: project/{projectID}/locations/{locationID}/datasets/{datasetName}/fhirStores/{fhirStoreID}. | false | false | The fhir_store_destination is a destination reference only. Security of the target FHIR store is managed through its own IAM policies. | None | None |
| `reconciliation_destination` | If set to true, a mapping pipeline will send output snapshots to the reconciliation pipeline in its dataset. A reconciliation pipeline must exist in this dataset before a mapping pipeline with a reconciliation destination can be created. | false | false | This field controls pipeline routing behaviour and does not directly affect security posture. | None | None |

### reconciliation_pipeline_job Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `merge_config` | Specifies the location of the reconciliation configuration. Structure is [documented below](#nested_reconciliation_pipeline_job_merge_config). | true | false | The merge_config is a required reference to reconciliation logic and does not directly affect security posture. | None | None |
| `matching_uri_prefix` | Specifies the top level directory of the matching configs used in all mapping pipelines, which extract properties for resources to be matched on. Example: gs://{bucket-id}/{path/to/matching/configs} | true | false | The matching_uri_prefix is a configuration path reference and does not directly affect security posture. | None | None |
| `fhir_store_destination` | The harmonized FHIR store to write harmonized FHIR resources to, in the format of: project/{projectID}/locations/{locationID}/datasets/{datasetName}/fhirStores/{id} | false | false | The fhir_store_destination is a destination reference only. Security of the target FHIR store is managed through its own IAM policies. | None | None |

### backfill_pipeline_job Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mapping_pipeline_job` | Specifies the mapping pipeline job to backfill, the name format should follow: projects/{projectId}/locations/{locationId}/datasets/{datasetId}/pipelineJobs/{pipelineJobId}. | false | false | The mapping_pipeline_job reference is an identifier for the job to backfill and does not directly affect security posture. | None | None |

### mapping_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `description` | Describes the mapping configuration. | false | false | A descriptive text field only, no security impact. | None | None |
| `whistle_config_source` | Specifies the path to the mapping configuration for harmonization pipeline. Structure is [documented below](#nested_mapping_pipeline_job_mapping_config_whistle_config_source). | false | false | The whistle_config_source is a path reference to mapping logic and does not directly affect security posture. | None | None |

### whistle_config_source Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `uri` | Main configuration file which has the entrypoint or the root function. Example: gs://{bucket-id}/{path/to/import-root/dir}/entrypoint-file-name.wstl. | true | false | The uri is a GCS path reference to the Whistle entrypoint file and does not directly affect security posture. | None | None |
| `import_uri_prefix` | Directory path where all the Whistle files are located. Example: gs://{bucket-id}/{path/to/import-root/dir} | true | false | The import_uri_prefix is a GCS directory reference and does not directly affect security posture. | None | None |

### fhir_streaming_source Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `fhir_store` | The path to the FHIR store in the format projects/{projectId}/locations/{locationId}/datasets/{datasetId}/fhirStores/{fhirStoreId}. | true | false | The fhir_store is a source reference only. Security of the source FHIR store is managed through its own IAM policies. | None | None |
| `description` | Describes the streaming FHIR data source. | false | false | A descriptive text field only, no security impact. | None | None |

### merge_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `description` | Describes the mapping configuration. | false | false | A descriptive text field only, no security impact. | None | None |
| `whistle_config_source` | Specifies the path to the mapping configuration for harmonization pipeline. Structure is [documented below](#nested_reconciliation_pipeline_job_merge_config_whistle_config_source). | true | false | The whistle_config_source is a path reference to reconciliation logic and does not directly affect security posture. | None | None |
