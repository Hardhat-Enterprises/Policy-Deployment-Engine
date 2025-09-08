## 🛡️ Policy Deployment Engine: `dataform_repository`

This section provides a concise policy evaluation for the `dataform_repository` resource in GCP.

Reference: [Terraform Registry – dataform_repository](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataform_repository)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The repository's name. | true | None | None |
| `service_account` | The service account to run workflow invocations under. | false | None | None |
| `npmrc_environment_variables_secret_version` | Optional. The name of the Secret Manager secret version to be used to interpolate variables into the .npmrc file for package installation operations. Must be in the format projects/*/secrets/*/versions/*. The file itself must be in a JSON format. | false | None | None |
| `display_name` | Optional. The repository's user-friendly name. | false | None | None |
| `kms_key_name` | Optional. The reference to a KMS encryption key. If provided, it will be used to encrypt user data in the repository and all child resources. It is not possible to add or update the encryption key after the repository is created. Example projects/[kms_project_id]/locations/[region]/keyRings/[key_region]/cryptoKeys/[key] | false | None | None |
| `labels` | Optional. Repository user labels. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `region` | A reference to the region | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_policy` |  | none | None | None |

### git_remote_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `url` | The Git remote's URL. | true | None | None |
| `default_branch` | The Git remote's default branch name. | true | None | None |
| `authentication_token_secret_version` | The name of the Secret Manager secret version to use as an authentication token for Git operations. This secret is for assigning with HTTPS only(for SSH use `ssh_authentication_config`). Must be in the format projects/*/secrets/*/versions/*. | false | None | None |
| `ssh_authentication_config` | Authentication fields for remote uris using SSH protocol. Structure is [documented below](#nested_git_remote_settings_ssh_authentication_config). | false | None | None |
| `token_status` | (Output) Indicates the status of the Git access token. https://cloud.google.com/dataform/reference/rest/v1beta1/projects.locations.repositories#TokenStatus | none | None | None |

### workspace_compilation_overrides Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `default_database` | The default database (Google Cloud project ID). | false | None | None |
| `schema_suffix` | The suffix that should be appended to all schema (BigQuery dataset ID) names. | false | None | None |
| `table_prefix` | The prefix that should be prepended to all table names. | false | None | None |

### ssh_authentication_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `user_private_key_secret_version` | The name of the Secret Manager secret version to use as a ssh private key for Git operations. Must be in the format projects/*/secrets/*/versions/*. | true | None | None |
| `host_public_key` | Content of a public SSH key to verify an identity of a remote Git host. | true | None | None |
