## 🛡️ Policy Deployment Engine: `storage_folder`

This section provides a concise policy evaluation for the `storage_folder` resource in GCP.

Reference: [Terraform Registry – storage_folder](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_folder)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | The name of the bucket that contains the folder. | true | false | None | None | None |
| `name` | The name of the folder expressed as a path. Must include trailing '/'. For example, `example_dir/example_dir2/`, `example@#/`, `a-b/d-f/`. | true | false | None | None | None |
| `force_destroy` |  | false | true | Force destroy can lead to unintentional data deletion | False | True |
