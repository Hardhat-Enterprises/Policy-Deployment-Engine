## 🛡️ Policy Deployment Engine: `vertex_ai_dataset`

This section provides a concise policy evaluation for the `vertex_ai_dataset` resource in GCP.

Reference: [Terraform Registry – vertex_ai_dataset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_dataset)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The user-defined name of the Dataset. The name can be up to 128 characters long and can be consist of any UTF-8 characters. | true | None | None |
| `metadata_schema_uri` | Points to a YAML file stored on Google Cloud Storage describing additional information about the Dataset. The schema is defined as an OpenAPI 3.0.2 Schema Object. The schema files that can be used here are found in gs://google-cloud-aiplatform/schema/dataset/metadata/. | true | None | None |
| `labels` | A set of key/value label pairs to assign to this Workflow. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `region` | The region of the dataset. eg us-central1 | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### encryption_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_name` | Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key. The key needs to be in the same region as where the resource is created. | false | None | None |
