## 🛡️ Policy Deployment Engine: `artifact_registry_repository`

This section provides a concise policy evaluation for the `artifact_registry_repository` resource in GCP.

Reference: [Terraform Registry – artifact_registry_repository](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `format` | The format of packages that are stored in the repository. Supported formats can be found [here](https://cloud.google.com/artifact-registry/docs/supported-formats). You can only create alpha formats if you are a member of the [alpha user group](https://cloud.google.com/artifact-registry/docs/supported-formats#alpha-access). | true | None | None |
| `repository_id` | The last part of the repository name, for example: "repo1" | true | None | None |
| `description` | The user-provided description of the repository. | false | None | None |
| `labels` | Labels with user-defined metadata. This field may contain up to 64 entries. Label keys and values may be no longer than 63 characters. Label keys must begin with a lowercase letter and may only contain lowercase letters, numeric characters, underscores, and dashes. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `kms_key_name` | The Cloud KMS resource name of the customer managed encryption key that’s used to encrypt the contents of the Repository. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. This value may not be changed after the Repository has been created. | false | None | None |
| `mode` | The mode configures the repository to serve artifacts from different sources. Default value is `STANDARD_REPOSITORY`. Possible values are: `STANDARD_REPOSITORY`, `VIRTUAL_REPOSITORY`, `REMOTE_REPOSITORY`. | false | None | None |
| `cleanup_policy_dry_run` | If true, the cleanup pipeline is prevented from deleting versions in this repository. | false | None | None |
| `location` | The name of the repository's location. In addition to specific regions, special values for multi-region locations are `asia`, `europe`, and `us`. See [here](https://cloud.google.com/artifact-registry/docs/repositories/repo-locations), or use the [google_artifact_registry_locations](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/artifact_registry_locations) data source for possible values. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### docker_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `immutable_tags` | The repository which enabled this flag prevents all tags from being modified, moved or deleted. This does not prevent tags from being created. | false | None | None |

### maven_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allow_snapshot_overwrites` | The repository with this flag will allow publishing the same snapshot versions. | false | None | None |
| `version_policy` | Version policy defines the versions that the registry will accept. Default value is `VERSION_POLICY_UNSPECIFIED`. Possible values are: `VERSION_POLICY_UNSPECIFIED`, `RELEASE`, `SNAPSHOT`. | false | None | None |

### virtual_repository_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `upstream_policies` | Policies that configure the upstream artifacts distributed by the Virtual Repository. Upstream policies cannot be set on a standard repository. Structure is [documented below](#nested_virtual_repository_config_upstream_policies). | false | None | None |

### cleanup_policies Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` |  | none | None | None |
| `action` | Policy action. Possible values are: `DELETE`, `KEEP`. | false | None | None |
| `condition` | Policy condition for matching versions. Structure is [documented below](#nested_cleanup_policies_cleanup_policies_condition). | false | None | None |
| `most_recent_versions` | Policy condition for retaining a minimum number of versions. May only be specified with a Keep action. Structure is [documented below](#nested_cleanup_policies_cleanup_policies_most_recent_versions). | false | None | None |

### remote_repository_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | The description of the remote source. | false | None | None |
| `apt_repository` | Specific settings for an Apt remote repository. Structure is [documented below](#nested_remote_repository_config_apt_repository). | false | None | None |
| `docker_repository` | Specific settings for a Docker remote repository. Structure is [documented below](#nested_remote_repository_config_docker_repository). | false | None | None |
| `maven_repository` | Specific settings for a Maven remote repository. Structure is [documented below](#nested_remote_repository_config_maven_repository). | false | None | None |
| `npm_repository` | Specific settings for an Npm remote repository. Structure is [documented below](#nested_remote_repository_config_npm_repository). | false | None | None |
| `python_repository` | Specific settings for a Python remote repository. Structure is [documented below](#nested_remote_repository_config_python_repository). | false | None | None |
| `yum_repository` | Specific settings for an Yum remote repository. Structure is [documented below](#nested_remote_repository_config_yum_repository). | false | None | None |
| `common_repository` | Specific settings for an Artifact Registory remote repository. Structure is [documented below](#nested_remote_repository_config_common_repository). | false | None | None |
| `upstream_credentials` | The credentials used to access the remote repository. Structure is [documented below](#nested_remote_repository_config_upstream_credentials). | false | None | None |
| `disable_upstream_validation` | If true, the remote repository upstream and upstream credentials will not be validated. | false | None | None |

### vulnerability_scanning_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enablement_config` | This configures whether vulnerability scanning is automatically performed for artifacts pushed to this repository. Possible values are: `INHERITED`, `DISABLED`. | false | None | None |
| `enablement_state` | (Output) This field returns whether scanning is active for this repository. | none | None | None |
| `enablement_state_reason` | (Output) This provides an explanation for the state of scanning on this repository. | none | None | None |

### upstream_policies Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | The user-provided ID of the upstream policy. | false | None | None |
| `repository` | A reference to the repository resource, for example: "projects/p1/locations/us-central1/repository/repo1". | false | None | None |
| `priority` | Entries with a greater priority value take precedence in the pull order. | false | None | None |

### condition Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `tag_state` | Match versions by tag status. Default value is `ANY`. Possible values are: `TAGGED`, `UNTAGGED`, `ANY`. | false | None | None |
| `tag_prefixes` | Match versions by tag prefix. Applied on any prefix match. | false | None | None |
| `version_name_prefixes` | Match versions by version name prefix. Applied on any prefix match. | false | None | None |
| `package_name_prefixes` | Match versions by package prefix. Applied on any prefix match. | false | None | None |
| `older_than` | Match versions older than a duration. | false | None | None |
| `newer_than` | Match versions newer than a duration. | false | None | None |

### most_recent_versions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `package_name_prefixes` | Match versions by package prefix. Applied on any prefix match. | false | None | None |
| `keep_count` | Minimum number of versions to keep. | false | None | None |

### apt_repository Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `public_repository` | One of the publicly available Apt repositories supported by Artifact Registry. Structure is [documented below](#nested_remote_repository_config_apt_repository_public_repository). | false | None | None |

### public_repository Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `repository_base` | A common public repository base for Yum. Possible values are: `CENTOS`, `CENTOS_DEBUG`, `CENTOS_VAULT`, `CENTOS_STREAM`, `ROCKY`, `EPEL`. | true | None | None |
| `repository_path` | Specific repository from the base, e.g. `"pub/rocky/9/BaseOS/x86_64/os"` | true | None | None |

### docker_repository Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `public_repository` | Address of the remote repository. Default value is `DOCKER_HUB`. Possible values are: `DOCKER_HUB`. | false | None | None |
| `custom_repository` | [Deprecated, please use commonRepository instead] Settings for a remote repository with a custom uri. Structure is [documented below](#nested_remote_repository_config_docker_repository_custom_repository). | false | None | None |

### custom_repository Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | Specific uri to the registry, e.g. `"https://pypi.io"` | false | None | None |

### maven_repository Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `public_repository` | Address of the remote repository. Default value is `MAVEN_CENTRAL`. Possible values are: `MAVEN_CENTRAL`. | false | None | None |
| `custom_repository` | [Deprecated, please use commonRepository instead] Settings for a remote repository with a custom uri. Structure is [documented below](#nested_remote_repository_config_maven_repository_custom_repository). | false | None | None |

### npm_repository Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `public_repository` | Address of the remote repository. Default value is `NPMJS`. Possible values are: `NPMJS`. | false | None | None |
| `custom_repository` | [Deprecated, please use commonRepository instead] Settings for a remote repository with a custom uri. Structure is [documented below](#nested_remote_repository_config_npm_repository_custom_repository). | false | None | None |

### python_repository Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `public_repository` | Address of the remote repository. Default value is `PYPI`. Possible values are: `PYPI`. | false | None | None |
| `custom_repository` | [Deprecated, please use commonRepository instead] Settings for a remote repository with a custom uri. Structure is [documented below](#nested_remote_repository_config_python_repository_custom_repository). | false | None | None |

### yum_repository Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `public_repository` | One of the publicly available Yum repositories supported by Artifact Registry. Structure is [documented below](#nested_remote_repository_config_yum_repository_public_repository). | false | None | None |

### common_repository Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | One of: a. Artifact Registry Repository resource, e.g. `projects/UPSTREAM_PROJECT_ID/locations/REGION/repositories/UPSTREAM_REPOSITORY` b. URI to the registry, e.g. `"https://registry-1.docker.io"` c. URI to Artifact Registry Repository, e.g. `"https://REGION-docker.pkg.dev/UPSTREAM_PROJECT_ID/UPSTREAM_REPOSITORY"` | true | None | None |

### upstream_credentials Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username_password_credentials` | Use username and password to access the remote repository. Structure is [documented below](#nested_remote_repository_config_upstream_credentials_username_password_credentials). | false | None | None |

### username_password_credentials Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username` | The username to access the remote repository. | false | None | None |
| `password_secret_version` | The Secret Manager key version that holds the password to access the remote repository. Must be in the format of `projects/{project}/secrets/{secret}/versions/{version}`. | false | None | None |
