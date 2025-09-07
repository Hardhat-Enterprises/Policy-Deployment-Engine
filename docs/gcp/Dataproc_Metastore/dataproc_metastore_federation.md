## 🛡️ Policy Deployment Engine: `dataproc_metastore_federation`

This section provides a concise policy evaluation for the `dataproc_metastore_federation` resource in GCP.

Reference: [Terraform Registry – dataproc_metastore_federation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_metastore_federation)

---

## 1. Argument Reference

### `version`
- Description: (Required) The Apache Hive metastore version of the federation. All backend metastore versions must be compatible with the federation version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend_metastores`
- Description: (Required) A map from BackendMetastore rank to BackendMetastores from which the federation service serves metadata at query time. The map key represents the order in which BackendMetastores should be evaluated to resolve database names at query time and should be greater than or equal to zero. A BackendMetastore with a lower number will be evaluated before a BackendMetastore with a higher number. Structure is [documented below](#nested_backend_metastores).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `federation_id`
- Description: (Required) The ID of the metastore federation. The id must contain only letters (a-z, A-Z), numbers (0-9), underscores (_), and hyphens (-). Cannot begin or end with underscore or hyphen. Must consist of between 3 and 63 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels for the metastore federation. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location where the metastore federation should reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: When the field is set to true in Terraform state, a `terraform apply` or `terraform destroy` that would delete the federation will fail. <a name="nested_backend_metastores"></a>The `backend_metastores` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rank`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The relative resource name of the metastore that is being federated. The formats of the relative resource names for the currently supported metastores are listed below: Dataplex: projects/{projectId}/locations/{location}/lakes/{lake_id} BigQuery: projects/{projectId} Dataproc Metastore: projects/{projectId}/locations/{location}/services/{serviceId}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metastore_type`
- Description: (Required) The type of the backend metastore. Possible values are: `METASTORE_TYPE_UNSPECIFIED`, `DATAPROC_METASTORE`, `BIGQUERY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
