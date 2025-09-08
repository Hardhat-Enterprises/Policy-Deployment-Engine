## 🛡️ Policy Deployment Engine: `storage_folder`

This section provides a concise policy evaluation for the `storage_folder` resource in GCP.

Reference: [Terraform Registry – storage_folder](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_folder)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` | The name of the bucket that contains the folder. | true | None | None |
| `name` | The name of the folder expressed as a path. Must include trailing '/'. For example, `example_dir/example_dir2/`, `example@#/`, `a-b/d-f/`. | true | None | None |
| `force_destroy` |  | none | None | None |
