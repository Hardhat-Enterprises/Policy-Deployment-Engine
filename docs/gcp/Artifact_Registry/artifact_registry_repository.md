## 🛡️ Policy Deployment Engine: `artifact_registry_repository`

This section provides a concise policy evaluation for the `artifact_registry_repository` resource in GCP.

Reference: [Terraform Registry – artifact_registry_repository](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository)

---

## 1. Argument Reference

### `format`
- Description: (Required) The format of packages that are stored in the repository. Supported formats can be found [here](https://cloud.google.com/artifact-registry/docs/supported-formats). You can only create alpha formats if you are a member of the [alpha user group](https://cloud.google.com/artifact-registry/docs/supported-formats#alpha-access).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository_id`
- Description: (Required) The last part of the repository name, for example: "repo1"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The user-provided description of the repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels with user-defined metadata. This field may contain up to 64 entries. Label keys and values may be no longer than 63 characters. Label keys must begin with a lowercase letter and may only contain lowercase letters, numeric characters, underscores, and dashes. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The Cloud KMS resource name of the customer managed encryption key that’s used to encrypt the contents of the Repository. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. This value may not be changed after the Repository has been created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `docker_config`
- Description: (Optional) Docker repository config contains repository level configuration for the repositories of docker type. Structure is [documented below](#nested_docker_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maven_config`
- Description: (Optional) MavenRepositoryConfig is maven related repository details. Provides additional configuration details for repositories of the maven format type. Structure is [documented below](#nested_maven_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) The mode configures the repository to serve artifacts from different sources. Default value is `STANDARD_REPOSITORY`. Possible values are: `STANDARD_REPOSITORY`, `VIRTUAL_REPOSITORY`, `REMOTE_REPOSITORY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `virtual_repository_config`
- Description: (Optional) Configuration specific for a Virtual Repository. Structure is [documented below](#nested_virtual_repository_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cleanup_policies`
- Description: (Optional) Cleanup policies for this repository. Cleanup policies indicate when certain package versions can be automatically deleted. Map keys are policy IDs supplied by users during policy creation. They must unique within a repository and be under 128 characters in length. Structure is [documented below](#nested_cleanup_policies).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remote_repository_config`
- Description: (Optional) Configuration specific for a Remote Repository. Structure is [documented below](#nested_remote_repository_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cleanup_policy_dry_run`
- Description: (Optional) If true, the cleanup pipeline is prevented from deleting versions in this repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vulnerability_scanning_config`
- Description: (Optional) Configuration for vulnerability scanning of artifacts stored in this repository. Structure is [documented below](#nested_vulnerability_scanning_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The name of the repository's location. In addition to specific regions, special values for multi-region locations are `asia`, `europe`, and `us`. See [here](https://cloud.google.com/artifact-registry/docs/repositories/repo-locations), or use the [google_artifact_registry_locations](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/artifact_registry_locations) data source for possible values.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_docker_config"></a>The `docker_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `immutable_tags`
- Description: (Optional) The repository which enabled this flag prevents all tags from being modified, moved or deleted. This does not prevent tags from being created. <a name="nested_maven_config"></a>The `maven_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_snapshot_overwrites`
- Description: (Optional) The repository with this flag will allow publishing the same snapshot versions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version_policy`
- Description: (Optional) Version policy defines the versions that the registry will accept. Default value is `VERSION_POLICY_UNSPECIFIED`. Possible values are: `VERSION_POLICY_UNSPECIFIED`, `RELEASE`, `SNAPSHOT`. <a name="nested_virtual_repository_config"></a>The `virtual_repository_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `upstream_policies`
- Description: (Optional) Policies that configure the upstream artifacts distributed by the Virtual Repository. Upstream policies cannot be set on a standard repository. Structure is [documented below](#nested_virtual_repository_config_upstream_policies). <a name="nested_virtual_repository_config_upstream_policies"></a>The `upstream_policies` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Optional) The user-provided ID of the upstream policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Optional) A reference to the repository resource, for example: "projects/p1/locations/us-central1/repository/repo1".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `priority`
- Description: (Optional) Entries with a greater priority value take precedence in the pull order. <a name="nested_cleanup_policies"></a>The `cleanup_policies` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Optional) Policy action. Possible values are: `DELETE`, `KEEP`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: (Optional) Policy condition for matching versions. Structure is [documented below](#nested_cleanup_policies_cleanup_policies_condition).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `most_recent_versions`
- Description: (Optional) Policy condition for retaining a minimum number of versions. May only be specified with a Keep action. Structure is [documented below](#nested_cleanup_policies_cleanup_policies_most_recent_versions). <a name="nested_cleanup_policies_cleanup_policies_condition"></a>The `condition` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag_state`
- Description: (Optional) Match versions by tag status. Default value is `ANY`. Possible values are: `TAGGED`, `UNTAGGED`, `ANY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag_prefixes`
- Description: (Optional) Match versions by tag prefix. Applied on any prefix match.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version_name_prefixes`
- Description: (Optional) Match versions by version name prefix. Applied on any prefix match.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `package_name_prefixes`
- Description: (Optional) Match versions by package prefix. Applied on any prefix match.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `older_than`
- Description: (Optional) Match versions older than a duration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `newer_than`
- Description: (Optional) Match versions newer than a duration. <a name="nested_cleanup_policies_cleanup_policies_most_recent_versions"></a>The `most_recent_versions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `package_name_prefixes`
- Description: (Optional) Match versions by package prefix. Applied on any prefix match.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `keep_count`
- Description: (Optional) Minimum number of versions to keep. <a name="nested_remote_repository_config"></a>The `remote_repository_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of the remote source.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `apt_repository`
- Description: (Optional) Specific settings for an Apt remote repository. Structure is [documented below](#nested_remote_repository_config_apt_repository).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `docker_repository`
- Description: (Optional) Specific settings for a Docker remote repository. Structure is [documented below](#nested_remote_repository_config_docker_repository).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maven_repository`
- Description: (Optional) Specific settings for a Maven remote repository. Structure is [documented below](#nested_remote_repository_config_maven_repository).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `npm_repository`
- Description: (Optional) Specific settings for an Npm remote repository. Structure is [documented below](#nested_remote_repository_config_npm_repository).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `python_repository`
- Description: (Optional) Specific settings for a Python remote repository. Structure is [documented below](#nested_remote_repository_config_python_repository).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `yum_repository`
- Description: (Optional) Specific settings for an Yum remote repository. Structure is [documented below](#nested_remote_repository_config_yum_repository).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `common_repository`
- Description: (Optional) Specific settings for an Artifact Registory remote repository. Structure is [documented below](#nested_remote_repository_config_common_repository).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `upstream_credentials`
- Description: (Optional) The credentials used to access the remote repository. Structure is [documented below](#nested_remote_repository_config_upstream_credentials).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_upstream_validation`
- Description: (Optional) If true, the remote repository upstream and upstream credentials will not be validated. <a name="nested_remote_repository_config_apt_repository"></a>The `apt_repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_repository`
- Description: (Optional) One of the publicly available Apt repositories supported by Artifact Registry. Structure is [documented below](#nested_remote_repository_config_apt_repository_public_repository). <a name="nested_remote_repository_config_apt_repository_public_repository"></a>The `public_repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository_base`
- Description: (Required) A common public repository base for Apt, e.g. `"debian/dists/stable"` Possible values are: `DEBIAN`, `UBUNTU`, `DEBIAN_SNAPSHOT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository_path`
- Description: (Required) Specific repository from the base. <a name="nested_remote_repository_config_docker_repository"></a>The `docker_repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_repository`
- Description: (Optional) Address of the remote repository. Default value is `DOCKER_HUB`. Possible values are: `DOCKER_HUB`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_repository`
- Description: (Optional) [Deprecated, please use commonRepository instead] Settings for a remote repository with a custom uri. Structure is [documented below](#nested_remote_repository_config_docker_repository_custom_repository). <a name="nested_remote_repository_config_docker_repository_custom_repository"></a>The `custom_repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) Specific uri to the registry, e.g. `"https://registry-1.docker.io"` <a name="nested_remote_repository_config_maven_repository"></a>The `maven_repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_repository`
- Description: (Optional) Address of the remote repository. Default value is `MAVEN_CENTRAL`. Possible values are: `MAVEN_CENTRAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_repository`
- Description: (Optional) [Deprecated, please use commonRepository instead] Settings for a remote repository with a custom uri. Structure is [documented below](#nested_remote_repository_config_maven_repository_custom_repository). <a name="nested_remote_repository_config_maven_repository_custom_repository"></a>The `custom_repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) Specific uri to the registry, e.g. `"https://repo.maven.apache.org/maven2"` <a name="nested_remote_repository_config_npm_repository"></a>The `npm_repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_repository`
- Description: (Optional) Address of the remote repository. Default value is `NPMJS`. Possible values are: `NPMJS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_repository`
- Description: (Optional) [Deprecated, please use commonRepository instead] Settings for a remote repository with a custom uri. Structure is [documented below](#nested_remote_repository_config_npm_repository_custom_repository). <a name="nested_remote_repository_config_npm_repository_custom_repository"></a>The `custom_repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) Specific uri to the registry, e.g. `"https://registry.npmjs.org"` <a name="nested_remote_repository_config_python_repository"></a>The `python_repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_repository`
- Description: (Optional) Address of the remote repository. Default value is `PYPI`. Possible values are: `PYPI`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_repository`
- Description: (Optional) [Deprecated, please use commonRepository instead] Settings for a remote repository with a custom uri. Structure is [documented below](#nested_remote_repository_config_python_repository_custom_repository). <a name="nested_remote_repository_config_python_repository_custom_repository"></a>The `custom_repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) Specific uri to the registry, e.g. `"https://pypi.io"` <a name="nested_remote_repository_config_yum_repository"></a>The `yum_repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_repository`
- Description: (Optional) One of the publicly available Yum repositories supported by Artifact Registry. Structure is [documented below](#nested_remote_repository_config_yum_repository_public_repository). <a name="nested_remote_repository_config_yum_repository_public_repository"></a>The `public_repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository_base`
- Description: (Required) A common public repository base for Yum. Possible values are: `CENTOS`, `CENTOS_DEBUG`, `CENTOS_VAULT`, `CENTOS_STREAM`, `ROCKY`, `EPEL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository_path`
- Description: (Required) Specific repository from the base, e.g. `"pub/rocky/9/BaseOS/x86_64/os"` <a name="nested_remote_repository_config_common_repository"></a>The `common_repository` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) One of: a. Artifact Registry Repository resource, e.g. `projects/UPSTREAM_PROJECT_ID/locations/REGION/repositories/UPSTREAM_REPOSITORY` b. URI to the registry, e.g. `"https://registry-1.docker.io"` c. URI to Artifact Registry Repository, e.g. `"https://REGION-docker.pkg.dev/UPSTREAM_PROJECT_ID/UPSTREAM_REPOSITORY"` <a name="nested_remote_repository_config_upstream_credentials"></a>The `upstream_credentials` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username_password_credentials`
- Description: (Optional) Use username and password to access the remote repository. Structure is [documented below](#nested_remote_repository_config_upstream_credentials_username_password_credentials). <a name="nested_remote_repository_config_upstream_credentials_username_password_credentials"></a>The `username_password_credentials` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Optional) The username to access the remote repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password_secret_version`
- Description: (Optional) The Secret Manager key version that holds the password to access the remote repository. Must be in the format of `projects/{project}/secrets/{secret}/versions/{version}`. <a name="nested_vulnerability_scanning_config"></a>The `vulnerability_scanning_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enablement_config`
- Description: (Optional) This configures whether vulnerability scanning is automatically performed for artifacts pushed to this repository. Possible values are: `INHERITED`, `DISABLED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enablement_state`
- Description: (Output) This field returns whether scanning is active for this repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enablement_state_reason`
- Description: (Output) This provides an explanation for the state of scanning on this repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
