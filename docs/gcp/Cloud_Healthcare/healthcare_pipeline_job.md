## 🛡️ Policy Deployment Engine: `healthcare_pipeline_job`

This section provides a concise policy evaluation for the `healthcare_pipeline_job` resource in GCP.

Reference: [Terraform Registry – healthcare_pipeline_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_pipeline_job)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Specifies the name of the pipeline job. This field is user-assigned. | true | None | None |
| `location` | Location where the Pipeline Job is to run | true | None | None |
| `dataset` | Healthcare Dataset under which the Pipeline Job is to run | true | None | None |
| `disable_lineage` | If true, disables writing lineage for the pipeline. | false | None | None |
| `labels` | User-supplied key-value pairs used to organize Pipeline Jobs. Label keys must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}][\p{Ll}\p{Lo}\p{N}_-]{0,62} Label values are optional, must be between 1 and 63 characters long, have a UTF-8 encoding of maximum 128 bytes, and must conform to the following PCRE regular expression: [\p{Ll}\p{Lo}\p{N}_-]{0,63} No more than 64 labels can be associated with a given pipeline. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |

### mapping_pipeline_job Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mapping_config` | The location of the mapping configuration. Structure is [documented below](#nested_mapping_pipeline_job_mapping_config). | true | None | None |
| `fhir_streaming_source` | A streaming FHIR data source. Structure is [documented below](#nested_mapping_pipeline_job_fhir_streaming_source). | false | None | None |
| `fhir_store_destination` | If set, the mapping pipeline will write snapshots to this FHIR store without assigning stable IDs. You must grant your pipeline project's Cloud Healthcare Service Agent serviceaccount healthcare.fhirResources.executeBundle and healthcare.fhirResources.create permissions on the destination store. The destination store must set [disableReferentialIntegrity][FhirStore.disable_referential_integrity] to true. The destination store must use FHIR version R4. Format: project/{projectID}/locations/{locationID}/datasets/{datasetName}/fhirStores/{fhirStoreID}. | false | None | None |
| `reconciliation_destination` | If set to true, a mapping pipeline will send output snapshots to the reconciliation pipeline in its dataset. A reconciliation pipeline must exist in this dataset before a mapping pipeline with a reconciliation destination can be created. | false | None | None |

### reconciliation_pipeline_job Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `merge_config` | Specifies the location of the reconciliation configuration. Structure is [documented below](#nested_reconciliation_pipeline_job_merge_config). | true | None | None |
| `matching_uri_prefix` | Specifies the top level directory of the matching configs used in all mapping pipelines, which extract properties for resources to be matched on. Example: gs://{bucket-id}/{path/to/matching/configs} | true | None | None |
| `fhir_store_destination` | The harmonized FHIR store to write harmonized FHIR resources to, in the format of: project/{projectID}/locations/{locationID}/datasets/{datasetName}/fhirStores/{id} | false | None | None |

### backfill_pipeline_job Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mapping_pipeline_job` | Specifies the mapping pipeline job to backfill, the name format should follow: projects/{projectId}/locations/{locationId}/datasets/{datasetId}/pipelineJobs/{pipelineJobId}. | false | None | None |

### mapping_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | Describes the mapping configuration. | false | None | None |
| `whistle_config_source` | Specifies the path to the mapping configuration for harmonization pipeline. Structure is [documented below](#nested_mapping_pipeline_job_mapping_config_whistle_config_source). | false | None | None |

### whistle_config_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | Main configuration file which has the entrypoint or the root function. Example: gs://{bucket-id}/{path/to/import-root/dir}/entrypoint-file-name.wstl. | true | None | None |
| `import_uri_prefix` | Directory path where all the Whistle files are located. Example: gs://{bucket-id}/{path/to/import-root/dir} | true | None | None |

### fhir_streaming_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `fhir_store` | The path to the FHIR store in the format projects/{projectId}/locations/{locationId}/datasets/{datasetId}/fhirStores/{fhirStoreId}. | true | None | None |
| `description` | Describes the streaming FHIR data source. | false | None | None |

### merge_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | Describes the mapping configuration. | false | None | None |
| `whistle_config_source` | Specifies the path to the mapping configuration for harmonization pipeline. Structure is [documented below](#nested_reconciliation_pipeline_job_merge_config_whistle_config_source). | true | None | None |
