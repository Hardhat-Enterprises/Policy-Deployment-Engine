## 🛡️ Policy Deployment Engine: `resource_manager_capability`

This section provides a concise policy evaluation for the `resource_manager_capability` resource in GCP.

Reference: [Terraform Registry – resource_manager_capability](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/resource_manager_capability)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | Folder on which Capability needs to be updated in the format folders/folder_id. | true | None | None |
| `capability_name` | Capability name that should be updated on the folder. | true | None | None |
| `value` | Capability Value. | true | None | None |
