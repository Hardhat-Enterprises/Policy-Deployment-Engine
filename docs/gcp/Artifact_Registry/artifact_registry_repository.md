## 🛡️ Policy Deployment Engine: `artifact_registry_repository`

This section provides a concise policy evaluation for the `artifact_registry_repository` resource in GCP.

Reference: [Terraform Registry – artifact_registry_repository](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `format` | The format of packages that are stored in the repository. Supported formats can be found [here](https://cloud.google.com/artifact-registry/docs/supported-formats). You can only create alpha formats if you are a member of the [alpha user group](https://cloud.google.com/artifact-registry/docs/supported-formats#alpha-access). | true | true | The approved_formats policy whitelists DOCKER, MAVEN, NPM, and PYTHON only. | ['DOCKER', 'MAVEN', 'NPM', 'PYTHON'] | ['APT', 'GO', 'KFP'] |
| `repository_id` | The last part of the repository name, for example: "repo1" | true | false | None | None | None |
| `description` | The user-provided description of the repository. | false | false | None | None | None |
| `labels` | Labels with user-defined metadata. This field may contain up to 64 entries. Label keys and values may be no longer than 63 characters. Label keys must begin with a lowercase letter and may only contain lowercase letters, numeric characters, underscores, and dashes. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `kms_key_name` | The Cloud KMS resource name of the customer managed encryption key that’s used to encrypt the contents of the Repository. Has the form: `projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key`. This value may not be changed after the Repository has been created. | false | true | Two policies apply: cmek_required requires kms_key_name to be set, and approved_cmek_keys restricts it to approved CMEK path patterns and approved project/location/key identifiers. | projects/project-2/locations/australia-southeast1/keyRings/platform-ring/cryptoKeys/repo-key | ['null', '', 'kms-key', 'projects/other-project/locations/europe-west1/keyRings/test/cryptoKeys/key1'] |
| `docker_config` | Docker repository config contains repository level configuration for the repositories of docker type. Structure is [documented below](#nested_docker_config). | false | false | None | None | None |
| `maven_config` | MavenRepositoryConfig is maven related repository details. Provides additional configuration details for repositories of the maven format type. Structure is [documented below](#nested_maven_config). | false | false | None | None | None |
| `mode` | The mode configures the repository to serve artifacts from different sources. Default value is `STANDARD_REPOSITORY`. Possible values are: `STANDARD_REPOSITORY`, `VIRTUAL_REPOSITORY`, `REMOTE_REPOSITORY`. | false | true | The approved_modes policy whitelists STANDARD_REPOSITORY, REMOTE_REPOSITORY, and VIRTUAL_REPOSITORY only. | ['STANDARD_REPOSITORY', 'REMOTE_REPOSITORY', 'VIRTUAL_REPOSITORY'] | ['UNKNOWN_MODE', 'PROXY_REPOSITORY'] |
| `virtual_repository_config` | Configuration specific for a Virtual Repository. Structure is [documented below](#nested_virtual_repository_config). | false | false | None | None | None |
| `cleanup_policies` | Cleanup policies for this repository. Cleanup policies indicate when certain package versions can be automatically deleted. Map keys are policy IDs supplied by users during policy creation. They must unique within a repository and be under 128 characters in length. Structure is [documented below](#nested_cleanup_policies). | false | false | None | None | None |
| `remote_repository_config` | Configuration specific for a Remote Repository. Structure is [documented below](#nested_remote_repository_config). | false | false | None | None | None |
| `cleanup_policy_dry_run` | If true, the cleanup pipeline is prevented from deleting versions in this repository. | false | true | The cleanup_policy_guardrails policy requires cleanup_policy_dry_run to be true. | true | false |
| `vulnerability_scanning_config` | Configuration for vulnerability scanning of artifacts stored in this repository. Structure is [documented below](#nested_vulnerability_scanning_config). | false | false | None | None | None |
| `location` | The name of the repository's location. In addition to specific regions, special values for multi-region locations are `asia`, `europe`, and `us`. See [here](https://cloud.google.com/artifact-registry/docs/repositories/repo-locations), or use the [google_artifact_registry_locations](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/artifact_registry_locations) data source for possible values. | false | true | The approved_locations policy whitelists only australia-southeast1-a/b/c and australia-southeast2-a/b/c. | ['australia-southeast1-a', 'australia-southeast2-b'] | ['us-central1', 'europe-west1', 'asia'] |
| `project` | If it is not provided, the provider project is used. | true | false | None | None | None |
| `upstream_policies` |  | false | false | None | None | None |
| `condition` |  | false | false | None | None | None |
| `most_recent_versions` |  | false | false | None | None | None |
| `apt_repository` |  | false | false | None | None | None |
| `public_repository` |  | false | false | None | None | None |
| `docker_repository` |  | false | false | None | None | None |
| `custom_repository` |  | false | false | None | None | None |
| `maven_repository` |  | false | false | None | None | None |
| `npm_repository` |  | false | false | None | None | None |
| `python_repository` |  | false | false | None | None | None |
| `yum_repository` |  | false | false | None | None | None |
| `common_repository` |  | false | false | None | None | None |
| `upstream_credentials` |  | false | false | None | None | None |
| `username_password_credentials` |  | false | false | None | None | None |

### docker_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `immutable_tags` | The repository which enabled this flag prevents all tags from being modified, moved or deleted. This does not prevent tags from being created. | false | true | The docker_immutable_tags policy requires immutable_tags = true when format is DOCKER. | true | false |

### maven_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `allow_snapshot_overwrites` | The repository with this flag will allow publishing the same snapshot versions. | false | true | The maven_snapshot_overwrite_disallowed policy blocks allow_snapshot_overwrites = true when format is MAVEN. | false | true |
| `version_policy` | Version policy defines the versions that the registry will accept. Default value is `VERSION_POLICY_UNSPECIFIED`. Possible values are: `VERSION_POLICY_UNSPECIFIED`, `RELEASE`, `SNAPSHOT`. | false | false | None | None | None |

### virtual_repository_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `upstream_policies` | Policies that configure the upstream artifacts distributed by the Virtual Repository. Upstream policies cannot be set on a standard repository. Structure is [documented below](#nested_virtual_repository_config_upstream_policies). | false | true | The virtual_upstream_priority_range policy requires upstream_policies.priority to stay within 1 to 100 when mode is VIRTUAL_REPOSITORY. | ['1', '50', '100'] | ['0', '101'] |

### cleanup_policies Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` |  | true | false | None | None | None |
| `action` | Policy action. Possible values are: `DELETE`, `KEEP`. | false | true | The cleanup_policy_guardrails policy forbids DELETE rules targeting TAGGED artifacts and expects KEEP policies to retain at least 3 recent versions. | DELETE with condition.tag_state = UNTAGGED or KEEP with most_recent_versions.keep_count >= 3 | DELETE with condition.tag_state = TAGGED or KEEP with most_recent_versions.keep_count < 3 |
| `condition` | Policy condition for matching versions. Structure is [documented below](#nested_cleanup_policies_cleanup_policies_condition). | false | true | Your guardrail policy specifically checks condition.tag_state for DELETE policies and blocks TAGGED artifacts from matching deletion. | UNTAGGED | TAGGED |
| `most_recent_versions` | Policy condition for retaining a minimum number of versions. May only be specified with a Keep action. Structure is [documented below](#nested_cleanup_policies_cleanup_policies_most_recent_versions). | false | true | Your guardrail policy requires KEEP policies to retain at least 3 recent versions via most_recent_versions.keep_count. | ['3', '10'] | ['1', '2'] |

### remote_repository_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `description` | The description of the remote source. | false | false | None | None | None |
| `apt_repository` | Specific settings for an Apt remote repository. Structure is [documented below](#nested_remote_repository_config_apt_repository). | false | false | None | None | None |
| `docker_repository` | Specific settings for a Docker remote repository. Structure is [documented below](#nested_remote_repository_config_docker_repository). | false | false | None | None | None |
| `maven_repository` | Specific settings for a Maven remote repository. Structure is [documented below](#nested_remote_repository_config_maven_repository). | false | false | None | None | None |
| `npm_repository` | Specific settings for an Npm remote repository. Structure is [documented below](#nested_remote_repository_config_npm_repository). | false | false | None | None | None |
| `python_repository` | Specific settings for a Python remote repository. Structure is [documented below](#nested_remote_repository_config_python_repository). | false | false | None | None | None |
| `yum_repository` | Specific settings for an Yum remote repository. Structure is [documented below](#nested_remote_repository_config_yum_repository). | false | false | None | None | None |
| `common_repository` | Specific settings for an Artifact Registory remote repository. Structure is [documented below](#nested_remote_repository_config_common_repository). | false | true | The approved_remote_upstreams policy allows only approved upstream Artifact Registry URIs for REMOTE_REPOSITORY mode. | ['https://us-central1-docker.pkg.dev/trusted-project/base-images', 'https://australia-southeast1-docker.pkg.dev/shared-artifacts/approved-upstream'] | ['https://docker.io/library', 'https://europe-west1-docker.pkg.dev/unknown-project/test'] |
| `upstream_credentials` | The credentials used to access the remote repository. Structure is [documented below](#nested_remote_repository_config_upstream_credentials). | false | false | None | None | None |
| `disable_upstream_validation` | If true, the remote repository upstream and upstream credentials will not be validated. | false | true | The remote_upstream_validation_required policy blocks disable_upstream_validation = true for REMOTE_REPOSITORY mode. | false | true |

### vulnerability_scanning_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enablement_config` | This configures whether vulnerability scanning is automatically performed for artifacts pushed to this repository. Possible values are: `INHERITED`, `DISABLED`. | false | true | The vulnerability_scanning_enabled policy requires enablement_config to resolve to INHERITED rather than DISABLED. | INHERITED | DISABLED |
| `enablement_state` | (Output) This field returns whether scanning is active for this repository. | false | false | None | None | None |
| `enablement_state_reason` | (Output) This provides an explanation for the state of scanning on this repository. | false | false | None | None | None |

### upstream_policies Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | The user-provided ID of the upstream policy. | false | false | None | None | None |
| `repository` | A reference to the repository resource, for example: "projects/p1/locations/us-central1/repository/repo1". | false | false | None | None | None |
| `priority` | Entries with a greater priority value take precedence in the pull order. | false | true | The virtual_upstream_priority_range policy requires priority to stay within 1 to 100. | [1, 50, 100] | [0, 101] |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `tag_state` | Match versions by tag status. Default value is `ANY`. Possible values are: `TAGGED`, `UNTAGGED`, `ANY`. | false | true | The cleanup_policy_guardrails policy blocks DELETE cleanup rules from using tag_state = TAGGED. | ['UNTAGGED', 'ANY'] | TAGGED |
| `tag_prefixes` | Match versions by tag prefix. Applied on any prefix match. | false | false | None | None | None |
| `version_name_prefixes` | Match versions by version name prefix. Applied on any prefix match. | false | false | None | None | None |
| `package_name_prefixes` | Match versions by package prefix. Applied on any prefix match. | false | false | None | None | None |
| `older_than` | Match versions older than a duration. | false | false | None | None | None |
| `newer_than` | Match versions newer than a duration. | false | false | None | None | None |

### most_recent_versions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `package_name_prefixes` | Match versions by package prefix. Applied on any prefix match. | false | false | None | None | None |
| `keep_count` | Minimum number of versions to keep. | false | true | The cleanup_policy_guardrails policy enforces a keep_count range of 3 to 100 for the checked KEEP policy. | ['3', '5', '100'] | ['1', '2', '101'] |

### apt_repository Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `public_repository` | One of the publicly available Apt repositories supported by Artifact Registry. Structure is [documented below](#nested_remote_repository_config_apt_repository_public_repository). | false | false | None | None | None |

### public_repository Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `repository_base` | A common public repository base for Yum. Possible values are: `CENTOS`, `CENTOS_DEBUG`, `CENTOS_VAULT`, `CENTOS_STREAM`, `ROCKY`, `EPEL`. | true | false | None | None | None |
| `repository_path` | Specific repository from the base, e.g. `"pub/rocky/9/BaseOS/x86_64/os"` | true | false | None | None | None |

### docker_repository Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `public_repository` | Address of the remote repository. Default value is `DOCKER_HUB`. Possible values are: `DOCKER_HUB`. | false | false | None | None | None |
| `custom_repository` | [Deprecated, please use commonRepository instead] Settings for a remote repository with a custom uri. Structure is [documented below](#nested_remote_repository_config_docker_repository_custom_repository). | false | false | None | None | None |

### custom_repository Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `uri` | Specific uri to the registry, e.g. `"https://pypi.io"` | false | false | None | None | None |

### maven_repository Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `public_repository` | Address of the remote repository. Default value is `MAVEN_CENTRAL`. Possible values are: `MAVEN_CENTRAL`. | false | false | None | None | None |
| `custom_repository` | [Deprecated, please use commonRepository instead] Settings for a remote repository with a custom uri. Structure is [documented below](#nested_remote_repository_config_maven_repository_custom_repository). | false | false | None | None | None |

### npm_repository Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `public_repository` | Address of the remote repository. Default value is `NPMJS`. Possible values are: `NPMJS`. | false | false | None | None | None |
| `custom_repository` | [Deprecated, please use commonRepository instead] Settings for a remote repository with a custom uri. Structure is [documented below](#nested_remote_repository_config_npm_repository_custom_repository). | false | false | None | None | None |

### python_repository Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `public_repository` | Address of the remote repository. Default value is `PYPI`. Possible values are: `PYPI`. | false | false | None | None | None |
| `custom_repository` | [Deprecated, please use commonRepository instead] Settings for a remote repository with a custom uri. Structure is [documented below](#nested_remote_repository_config_python_repository_custom_repository). | false | false | None | None | None |

### yum_repository Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `public_repository` | One of the publicly available Yum repositories supported by Artifact Registry. Structure is [documented below](#nested_remote_repository_config_yum_repository_public_repository). | false | false | None | None | None |

### common_repository Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `uri` | One of: a. Artifact Registry Repository resource, e.g. `projects/UPSTREAM_PROJECT_ID/locations/REGION/repositories/UPSTREAM_REPOSITORY` b. URI to the registry, e.g. `"https://registry-1.docker.io"` c. URI to Artifact Registry Repository, e.g. `"https://REGION-docker.pkg.dev/UPSTREAM_PROJECT_ID/UPSTREAM_REPOSITORY"` | true | true | The approved_remote_upstreams policy allows only approved URI patterns and approved region/project/repository combinations. | ['https://us-central1-docker.pkg.dev/trusted-project/base-images', 'https://australia-southeast1-docker.pkg.dev/shared-artifacts/approved-upstream'] | ['https://registry-1.docker.io"', 'https://europe-west1-docker.pkg.dev/random/repo'] |

### upstream_credentials Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `username_password_credentials` | Use username and password to access the remote repository. Structure is [documented below](#nested_remote_repository_config_upstream_credentials_username_password_credentials). | false | false | None | None | None |

### username_password_credentials Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `username` | The username to access the remote repository. | false | false | None | None | None |
| `password_secret_version` | The Secret Manager key version that holds the password to access the remote repository. Must be in the format of `projects/{project}/secrets/{secret}/versions/{version}`. | false | false | None | None | None |
