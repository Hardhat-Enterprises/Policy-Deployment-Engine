## 🛡️ Policy Deployment Engine: `dataproc_metastore_federation`

This section provides a concise policy evaluation for the `dataproc_metastore_federation` resource in GCP.

Reference: [Terraform Registry – dataproc_metastore_federation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_metastore_federation)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `version` | The Apache Hive metastore version of the federation. All backend metastore versions must be compatible with the federation version. | true | None | None |
| `federation_id` | The ID of the metastore federation. The id must contain only letters (a-z, A-Z), numbers (0-9), underscores (_), and hyphens (-). Cannot begin or end with underscore or hyphen. Must consist of between 3 and 63 characters. | true | None | None |
| `labels` | User-defined labels for the metastore federation. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `location` | The location where the metastore federation should reside. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_protection` | When the field is set to true in Terraform state, a `terraform apply` or `terraform destroy` that would delete the federation will fail. | none | None | None |

### backend_metastores Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `rank` |  | none | None | None |
| `name` | The relative resource name of the metastore that is being federated. The formats of the relative resource names for the currently supported metastores are listed below: Dataplex: projects/{projectId}/locations/{location}/lakes/{lake_id} BigQuery: projects/{projectId} Dataproc Metastore: projects/{projectId}/locations/{location}/services/{serviceId} | true | None | None |
| `metastore_type` | The type of the backend metastore. Possible values are: `METASTORE_TYPE_UNSPECIFIED`, `DATAPROC_METASTORE`, `BIGQUERY`. | true | None | None |
