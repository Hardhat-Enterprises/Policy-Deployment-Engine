## 🛡️ Policy Deployment Engine: `dataform_repository`

This section provides a concise policy evaluation for the `dataform_repository` resource in GCP.

Reference: [Terraform Registry – dataform_repository](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataform_repository)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The repository's name. | true | false | None | None | None |
| `git_remote_settings` | Optional. If set, configures this repository to be linked to a Git remote. Structure is [documented below](#nested_git_remote_settings). | false | true | Git remote configuration affects source code security, authentication methods, and access controls for repository content. | Properly configured with authentication tokens or SSH keys | Missing authentication or insecure configuration |
| `workspace_compilation_overrides` | If set, fields of workspaceCompilationOverrides override the default compilation settings that are specified in dataform.json when creating workspace-scoped compilation results. Structure is [documented below](#nested_workspace_compilation_overrides). | false | false | None | None | None |
| `service_account` | The service account to run workflow invocations under. | false | false | None | None | None |
| `npmrc_environment_variables_secret_version` | Optional. The name of the Secret Manager secret version to be used to interpolate variables into the .npmrc file for package installation operations. Must be in the format projects/*/secrets/*/versions/*. The file itself must be in a JSON format. | false | false | None | None | None |
| `display_name` | Optional. The repository's user-friendly name. | false | false | None | None | None |
| `kms_key_name` | Optional. The reference to a KMS encryption key. If provided, it will be used to encrypt user data in the repository and all child resources. It is not possible to add or update the encryption key after the repository is created. Example projects/[kms_project_id]/locations/[region]/keyRings/[key_region]/cryptoKeys/[key] | false | true | Customer-managed encryption keys (CMEK) provide enhanced security by allowing organizations to control encryption keys for sensitive data repositories. | projects/my-project/locations/us-central1/keyRings/my-keyring/cryptoKeys/my-key | null or empty string |
| `labels` | Optional. Repository user labels. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Security-oriented labels help with compliance, incident response, and data classification for proper handling of sensitive repositories. | {"security_contact": "sec-team@company.com", "data_classification": "confidential", "business_criticality": "high", "compliance_regime": "hipaa"} | Missing security labels or invalid values like {"security_contact": "", "data_classification": "top-secret"} |
| `region` | A reference to the region | false | true | Regional placement affects data residency, compliance requirements, and access controls for sensitive data repositories. | australia-southeast1 | europe-west1 or other non-approved regions |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `deletion_policy` | The deletion policy for the repository. Can be 'DELETE' or 'FORCE'. | false | true | FORCE deletion policy can cause cascading deletion of child resources, potentially leading to data loss and security risks. | DELETE | FORCE |
| `ssh_authentication_config` |  | false | false | None | None | None |

### git_remote_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `url` | The Git remote's URL. | true | true | Git URL determines the remote repository location and protocol (HTTPS vs SSH) which affects authentication security. | https://github.com/company/repo.git | Empty or invalid URL |
| `default_branch` | The Git remote's default branch name. | true | true | Default branch configuration affects source code management and security controls for repository access. | main | Empty or null default branch |
| `authentication_token_secret_version` | The name of the Secret Manager secret version to use as an authentication token for Git operations. This secret is for assigning with HTTPS only(for SSH use `ssh_authentication_config`). Must be in the format projects/*/secrets/*/versions/*. | false | true | HTTPS authentication tokens stored in Secret Manager provide secure access to Git repositories without exposing credentials. | projects/my-project/secrets/git-token/versions/1 | null or empty when using HTTPS authentication |
| `ssh_authentication_config` | Authentication fields for remote uris using SSH protocol. Structure is [documented below](#nested_git_remote_settings_ssh_authentication_config). | false | true | SSH authentication configuration provides secure access to Git repositories using key-based authentication. | Properly configured with private key and host public key | Missing private key or host public key when using SSH |
| `token_status` | (Output) Indicates the status of the Git access token. https://cloud.google.com/dataform/reference/rest/v1beta1/projects.locations.repositories#TokenStatus | false | false | None | None | None |

### workspace_compilation_overrides Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `default_database` | The default database (Google Cloud project ID). | false | false | None | None | None |
| `schema_suffix` | The suffix that should be appended to all schema (BigQuery dataset ID) names. | false | false | None | None | None |
| `table_prefix` | The prefix that should be prepended to all table names. | false | false | None | None | None |

### ssh_authentication_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `user_private_key_secret_version` | The name of the Secret Manager secret version to use as a ssh private key for Git operations. Must be in the format projects/*/secrets/*/versions/*. | true | true | SSH private keys stored in Secret Manager provide secure authentication for Git repository access. | projects/my-project/secrets/ssh-private-key/versions/1 | null or empty when using SSH authentication |
| `host_public_key` | Content of a public SSH key to verify an identity of a remote Git host. | true | true | Host public key verification prevents man-in-the-middle attacks by ensuring connection to the correct Git server. | ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC... | null or empty when using SSH authentication |
