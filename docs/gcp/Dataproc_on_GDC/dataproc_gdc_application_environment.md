## 🛡️ Policy Deployment Engine: `dataproc_gdc_application_environment`

This section provides a concise policy evaluation for the `dataproc_gdc_application_environment` resource in GCP.

Reference: [Terraform Registry – dataproc_gdc_application_environment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_gdc_application_environment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the application environment | true | None | None |
| `serviceinstance` | The id of the service instance to which this application environment belongs. | true | None | None |
| `display_name` | User-provided human-readable name to be used in user interfaces. | false | None | None |
| `labels` | The labels to associate with this application environment. Labels may be used for filtering and billing tracking. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `annotations` | The annotations to associate with this application environment. Annotations may be used to store client information, but are not used by the server. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `namespace` | The name of the namespace in which to create this ApplicationEnvironment. This namespace must already exist in the cluster | false | None | None |
| `application_environment_id` | The id of the application environment | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### spark_application_environment_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `default_properties` | A map of default Spark properties to apply to workloads in this application environment. These defaults may be overridden by per-application properties. | false | None | None |
| `default_version` | The default Dataproc version to use for applications submitted to this application environment | false | None | None |
