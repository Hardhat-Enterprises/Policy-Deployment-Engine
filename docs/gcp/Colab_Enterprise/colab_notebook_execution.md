## 🛡️ Policy Deployment Engine: `colab_notebook_execution`

This section provides a concise policy evaluation for the `colab_notebook_execution` resource in GCP.

Reference: [Terraform Registry – colab_notebook_execution](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/colab_notebook_execution)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Required. The display name of the Notebook Execution. | true | None | None |
| `gcs_output_uri` | The Cloud Storage location to upload the result to. Format:`gs://bucket-name` | true | None | None |
| `location` | The location for the resource: https://cloud.google.com/colab/docs/locations | true | None | None |
| `execution_timeout` | Max running time of the execution job in seconds (default 86400s / 24 hrs). | false | None | None |
| `notebook_runtime_template_resource_name` | The NotebookRuntimeTemplate to source compute configuration from. | false | None | None |
| `execution_user` | The user email to run the execution as. | false | None | None |
| `service_account` | The service account to run the execution as. | false | None | None |
| `notebook_execution_job_id` | User specified ID for the Notebook Execution Job | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### dataform_repository_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataform_repository_resource_name` | The resource name of the Dataform Repository. | true | None | None |
| `commit_sha` | The commit SHA to read repository with. If unset, the file will be read at HEAD. | false | None | None |

### gcs_notebook_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | The Cloud Storage uri pointing to the ipynb file. | true | None | None |
| `generation` | The version of the Cloud Storage object to read. If unset, the current version of the object is read. See https://cloud.google.com/storage/docs/metadata#generation-number. | false | None | None |

### direct_notebook_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `content` | The base64-encoded contents of the input notebook file. | true | None | None |
