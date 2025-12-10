## 🛡️ Policy Deployment Engine: `storage_managed_folder`

This section provides a concise policy evaluation for the `storage_managed_folder` resource in GCP.

Reference: [Terraform Registry – storage_managed_folder](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_managed_folder)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | The name of the bucket that contains the managed folder. | true | false | None | None | None |
| `name` | The name of the managed folder expressed as a path. Must include trailing '/'. For example, `example_dir/example_dir2/`. | true | false | None | None | None |
| `force_destroy` | objects. If a non-empty managed folder is deleted, any objects within the folder will remain in a simulated folder with the same name. | false | true | Force destroy can lead to unintentional data deletion | False | True |
