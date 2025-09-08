## 🛡️ Policy Deployment Engine: `secure_source_manager_repository`

This section provides a concise policy evaluation for the `secure_source_manager_repository` resource in GCP.

Reference: [Terraform Registry – secure_source_manager_repository](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secure_source_manager_repository)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instance` | The name of the instance in which the repository is hosted. | true | None | None |
| `location` | The location for the Repository. | true | None | None |
| `repository_id` | The ID for the Repository. | true | None | None |
| `description` | Description of the repository, which cannot exceed 500 characters. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_policy` | to be abandoned, rather than deleted. Setting `DELETE` deletes the resource and all its contents. Setting `PREVENT` prevents the resource from accidental deletion by erroring out during plan. Default is `DELETE`.  Possible values are: * DELETE * PREVENT * ABANDON | none | None | None |

### initial_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `default_branch` | Default branch name of the repository. | false | None | None |
| `gitignores` | List of gitignore template names user can choose from. Valid values can be viewed at https://cloud.google.com/secure-source-manager/docs/reference/rest/v1/projects.locations.repositories#initialconfig. | false | None | None |
| `license` | License template name user can choose from. Valid values can be viewed at https://cloud.google.com/secure-source-manager/docs/reference/rest/v1/projects.locations.repositories#initialconfig. | false | None | None |
| `readme` | README template name. Valid values can be viewed at https://cloud.google.com/secure-source-manager/docs/reference/rest/v1/projects.locations.repositories#initialconfig. | false | None | None |
