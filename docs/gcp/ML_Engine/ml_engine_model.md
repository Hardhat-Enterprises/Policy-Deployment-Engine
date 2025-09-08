## 🛡️ Policy Deployment Engine: `ml_engine_model`

This section provides a concise policy evaluation for the `ml_engine_model` resource in GCP.

Reference: [Terraform Registry – ml_engine_model](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/ml_engine_model)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name specified for the model. | true | None | None |
| `description` | The description specified for the model when it was created. | false | None | None |
| `regions` | The list of regions where the model is going to be deployed. Currently only one region per model is supported | false | None | None |
| `online_prediction_logging` | If true, online prediction access logs are sent to StackDriver Logging. | false | None | None |
| `online_prediction_console_logging` | If true, online prediction nodes send stderr and stdout streams to Stackdriver Logging | false | None | None |
| `labels` | One or more labels that you can add, to organize your models. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### default_version Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name specified for the version when it was created. | true | None | None |
