## 🛡️ Policy Deployment Engine: `dataproc_gdc_service_instance`

This section provides a concise policy evaluation for the `dataproc_gdc_service_instance` resource in GCP.

Reference: [Terraform Registry – dataproc_gdc_service_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_gdc_service_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Location of the resource. | true | None | None |
| `service_instance_id` | Id of the service instance. | true | None | None |
| `display_name` | User-provided human-readable name to be used in user interfaces. | false | None | None |
| `labels` | The labels to associate with this service instance. Labels may be used for filtering and billing tracking. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `spark_service_instance_config` | Spark-specific service instance configuration. | false | None | None |
| `service_account` | Requested service account to associate with ServiceInstance. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### gdce_cluster Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `gdce_cluster` | Gdce cluster resource id. | true | None | None |
