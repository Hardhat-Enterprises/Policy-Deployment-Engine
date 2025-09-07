## 🛡️ Policy Deployment Engine: `cloudbuild_trigger`

This section provides a concise policy evaluation for the `cloudbuild_trigger` resource in GCP.

Reference: [Terraform Registry – cloudbuild_trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger)

---

## 1. Argument Reference

### `name`
- Description: (Optional) Name of the trigger. Must be unique within the project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Human-readable description of the trigger.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) Tags for annotation of a BuildTrigger
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Whether the trigger is disabled or not. If true, the trigger will never result in a build.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `substitutions`
- Description: (Optional) Substitutions data for Build resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) The service account used for all user-controlled operations including triggers.patch, triggers.run, builds.create, and builds.cancel. If no service account is set, then the standard Cloud Build service account ([PROJECT_NUM]@system.gserviceaccount.com) will be used instead. Format: projects/{PROJECT_ID}/serviceAccounts/{ACCOUNT_ID_OR_EMAIL}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_build_logs`
- Description: (Optional) Build logs will be sent back to GitHub as part of the checkrun result.  Values can be INCLUDE_BUILD_LOGS_UNSPECIFIED or INCLUDE_BUILD_LOGS_WITH_STATUS Possible values are: `INCLUDE_BUILD_LOGS_UNSPECIFIED`, `INCLUDE_BUILD_LOGS_WITH_STATUS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filename`
- Description: (Optional) Path, from the source root, to a file whose contents is used for the template. Either a filename or build template must be provided. Set this only when using trigger_template or github. When using Pub/Sub, Webhook or Manual set the file name using git_file_source instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Optional) A Common Expression Language string. Used only with Pub/Sub and Webhook.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `git_file_source`
- Description: (Optional) The file source describing the local or remote Build template. Structure is [documented below](#nested_git_file_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository_event_config`
- Description: (Optional) The configuration of a trigger that creates a build whenever an event from Repo API is received. Structure is [documented below](#nested_repository_event_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_to_build`
- Description: (Optional) The repo and ref of the repository from which to build. This field is used only for those triggers that do not respond to SCM events. Triggers that respond to such events build source at whatever commit caused the event. This field is currently only used by Webhook, Pub/Sub, Manual, and Cron triggers. One of `trigger_template`, `github`, `pubsub_config` `webhook_config` or `source_to_build` must be provided. Structure is [documented below](#nested_source_to_build).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignored_files`
- Description: (Optional) ignoredFiles and includedFiles are file glob matches using https://golang.org/pkg/path/filepath/#Match extended with support for `**`. If ignoredFiles and changed files are both empty, then they are not used to determine whether or not to trigger a build. If ignoredFiles is not empty, then we ignore any files that match any of the ignored_file globs. If the change has no files that are outside of the ignoredFiles globs, then we do not trigger a build.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_files`
- Description: (Optional) ignoredFiles and includedFiles are file glob matches using https://golang.org/pkg/path/filepath/#Match extended with support for `**`. If any of the files altered in the commit pass the ignoredFiles filter and includedFiles is empty, then as far as this filter is concerned, we should trigger the build. If any of the files altered in the commit pass the ignoredFiles filter and includedFiles is not empty, then we make sure that at least one of those files matches a includedFiles glob. If not, then we do not trigger a build.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trigger_template`
- Description: (Optional) Template describing the types of source changes to trigger a build. Branch and tag names in trigger templates are interpreted as regular expressions. Any branch or tag change that matches that regular expression will trigger a build. One of `trigger_template`, `github`, `pubsub_config`, `webhook_config` or `source_to_build` must be provided. Structure is [documented below](#nested_trigger_template).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `github`
- Description: (Optional) Describes the configuration of a trigger that creates a build whenever a GitHub event is received. One of `trigger_template`, `github`, `pubsub_config` or `webhook_config` must be provided. Structure is [documented below](#nested_github).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bitbucket_server_trigger_config`
- Description: (Optional) BitbucketServerTriggerConfig describes the configuration of a trigger that creates a build whenever a Bitbucket Server event is received. Structure is [documented below](#nested_bitbucket_server_trigger_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pubsub_config`
- Description: (Optional) PubsubConfig describes the configuration of a trigger that creates a build whenever a Pub/Sub message is published. One of `trigger_template`, `github`, `pubsub_config` `webhook_config` or `source_to_build` must be provided. Structure is [documented below](#nested_pubsub_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook_config`
- Description: (Optional) WebhookConfig describes the configuration of a trigger that creates a build whenever a webhook is sent to a trigger's webhook URL. One of `trigger_template`, `github`, `pubsub_config` `webhook_config` or `source_to_build` must be provided. Structure is [documented below](#nested_webhook_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `approval_config`
- Description: (Optional) Configuration for manual approval to start a build invocation of this BuildTrigger. Builds created by this trigger will require approval before they execute. Any user with a Cloud Build Approver role for the project can approve a build. Structure is [documented below](#nested_approval_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `build`
- Description: (Optional) Contents of the build template. Either a filename or build template must be provided. Structure is [documented below](#nested_build).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The [Cloud Build location](https://cloud.google.com/build/docs/locations) for the trigger. If not specified, "global" is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_git_file_source"></a>The `git_file_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) The path of the file, with the repo root as the root of the path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) The URI of the repo (optional). If unspecified, the repo from which the trigger invocation originated is assumed to be the repo from which to read the specified path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Optional) The fully qualified resource name of the Repo API repository. The fully qualified resource name of the Repo API repository. If unspecified, the repo from which the trigger invocation originated is assumed to be the repo from which to read the specified path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repo_type`
- Description: (Required) The type of the repo, since it may not be explicit from the repo field (e.g from a URL). Values can be UNKNOWN, CLOUD_SOURCE_REPOSITORIES, GITHUB, BITBUCKET_SERVER Possible values are: `UNKNOWN`, `CLOUD_SOURCE_REPOSITORIES`, `GITHUB`, `BITBUCKET_SERVER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `revision`
- Description: (Optional) The branch, tag, arbitrary ref, or SHA version of the repo to use when resolving the filename (optional). This field respects the same syntax/resolution as described here: https://git-scm.com/docs/gitrevisions If unspecified, the revision from which the trigger invocation originated is assumed to be the revision from which to read the specified path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `github_enterprise_config`
- Description: (Optional) The full resource name of the github enterprise config. Format: projects/{project}/locations/{location}/githubEnterpriseConfigs/{id}. projects/{project}/githubEnterpriseConfigs/{id}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bitbucket_server_config`
- Description: (Optional) The full resource name of the bitbucket server config. Format: projects/{project}/locations/{location}/bitbucketServerConfigs/{id}. <a name="nested_repository_event_config"></a>The `repository_event_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Optional) The resource name of the Repo API resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pull_request`
- Description: (Optional) Contains filter properties for matching Pull Requests. Structure is [documented below](#nested_repository_event_config_pull_request).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `push`
- Description: (Optional) Contains filter properties for matching git pushes. Structure is [documented below](#nested_repository_event_config_push). <a name="nested_repository_event_config_pull_request"></a>The `pull_request` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `branch`
- Description: (Optional) Regex of branches to match. The syntax of the regular expressions accepted is the syntax accepted by RE2 and described at https://github.com/google/re2/wiki/Syntax
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `invert_regex`
- Description: (Optional) If true, branches that do NOT match the git_ref will trigger a build.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `comment_control`
- Description: (Optional) Configure builds to run whether a repository owner or collaborator need to comment `/gcbrun`. Possible values are: `COMMENTS_DISABLED`, `COMMENTS_ENABLED`, `COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY`. <a name="nested_repository_event_config_push"></a>The `push` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `branch`
- Description: (Optional) Regex of branches to match. The syntax of the regular expressions accepted is the syntax accepted by RE2 and described at https://github.com/google/re2/wiki/Syntax
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag`
- Description: (Optional) Regex of tags to match. The syntax of the regular expressions accepted is the syntax accepted by RE2 and described at https://github.com/google/re2/wiki/Syntax
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `invert_regex`
- Description: (Optional) If true, only trigger a build if the revision regex does NOT match the git_ref regex. <a name="nested_source_to_build"></a>The `source_to_build` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Optional) The URI of the repo.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Optional) The qualified resource name of the Repo API repository. Either uri or repository can be specified and is required.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ref`
- Description: (Required) The branch or tag to use. Must start with "refs/" (required).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repo_type`
- Description: (Required) The type of the repo, since it may not be explicit from the repo field (e.g from a URL). Values can be UNKNOWN, CLOUD_SOURCE_REPOSITORIES, GITHUB, BITBUCKET_SERVER Possible values are: `UNKNOWN`, `CLOUD_SOURCE_REPOSITORIES`, `GITHUB`, `BITBUCKET_SERVER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `github_enterprise_config`
- Description: (Optional) The full resource name of the github enterprise config. Format: projects/{project}/locations/{location}/githubEnterpriseConfigs/{id}. projects/{project}/githubEnterpriseConfigs/{id}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bitbucket_server_config`
- Description: (Optional) The full resource name of the bitbucket server config. Format: projects/{project}/locations/{location}/bitbucketServerConfigs/{id}. <a name="nested_trigger_template"></a>The `trigger_template` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) ID of the project that owns the Cloud Source Repository. If omitted, the project ID requesting the build is assumed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repo_name`
- Description: (Optional) Name of the Cloud Source Repository. If omitted, the name "default" is assumed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dir`
- Description: (Optional) Directory, relative to the source root, in which to run the build. This must be a relative path. If a step's dir is specified and is an absolute path, this value is ignored for that step's execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `invert_regex`
- Description: (Optional) Only trigger a build if the revision regex does NOT match the revision regex.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `branch_name`
- Description: (Optional) Name of the branch to build. Exactly one a of branch name, tag, or commit SHA must be provided. This field is a regular expression.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag_name`
- Description: (Optional) Name of the tag to build. Exactly one of a branch name, tag, or commit SHA must be provided. This field is a regular expression.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `commit_sha`
- Description: (Optional) Explicit commit SHA to build. Exactly one of a branch name, tag, or commit SHA must be provided. <a name="nested_github"></a>The `github` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `owner`
- Description: (Optional) Owner of the repository. For example: The owner for https://github.com/googlecloudplatform/cloud-builders is "googlecloudplatform".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the repository. For example: The name for https://github.com/googlecloudplatform/cloud-builders is "cloud-builders".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pull_request`
- Description: (Optional) filter to match changes in pull requests. Specify only one of `pull_request` or `push`. Structure is [documented below](#nested_github_pull_request).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `push`
- Description: (Optional) filter to match changes in refs, like branches or tags. Specify only one of `pull_request` or `push`. Structure is [documented below](#nested_github_push).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enterprise_config_resource_name`
- Description: (Optional) The resource name of the github enterprise config that should be applied to this installation. For example: "projects/{$projectId}/locations/{$locationId}/githubEnterpriseConfigs/{$configId}" <a name="nested_github_pull_request"></a>The `pull_request` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `branch`
- Description: (Required) Regex of branches to match.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `comment_control`
- Description: (Optional) Whether to block builds on a "/gcbrun" comment from a repository owner or collaborator. Possible values are: `COMMENTS_DISABLED`, `COMMENTS_ENABLED`, `COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `invert_regex`
- Description: (Optional) If true, branches that do NOT match the git_ref will trigger a build. <a name="nested_github_push"></a>The `push` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `invert_regex`
- Description: (Optional) When true, only trigger a build if the revision regex does NOT match the git_ref regex.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `branch`
- Description: (Optional) Regex of branches to match.  Specify only one of branch or tag.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag`
- Description: (Optional) Regex of tags to match.  Specify only one of branch or tag. <a name="nested_bitbucket_server_trigger_config"></a>The `bitbucket_server_trigger_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repo_slug`
- Description: (Required) Slug of the repository. A repository slug is a URL-friendly version of a repository name, automatically generated by Bitbucket for use in the URL. For example, if the repository name is 'test repo', in the URL it would become 'test-repo' as in https://mybitbucket.server/projects/TEST/repos/test-repo.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_key`
- Description: (Required) Key of the project that the repo is in. For example: The key for https://mybitbucket.server/projects/TEST/repos/test-repo is "TEST".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bitbucket_server_config_resource`
- Description: (Required) The Bitbucket server config resource that this trigger config maps to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pull_request`
- Description: (Optional) Filter to match changes in pull requests. Structure is [documented below](#nested_bitbucket_server_trigger_config_pull_request).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `push`
- Description: (Optional) Filter to match changes in refs like branches, tags. Structure is [documented below](#nested_bitbucket_server_trigger_config_push). <a name="nested_bitbucket_server_trigger_config_pull_request"></a>The `pull_request` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `branch`
- Description: (Required) Regex of branches to match. The syntax of the regular expressions accepted is the syntax accepted by RE2 and described at https://github.com/google/re2/wiki/Syntax
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `comment_control`
- Description: (Optional) Configure builds to run whether a repository owner or collaborator need to comment /gcbrun. Possible values are: `COMMENTS_DISABLED`, `COMMENTS_ENABLED`, `COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `invert_regex`
- Description: (Optional) If true, branches that do NOT match the git_ref will trigger a build. <a name="nested_bitbucket_server_trigger_config_push"></a>The `push` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `invert_regex`
- Description: (Optional) When true, only trigger a build if the revision regex does NOT match the gitRef regex.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `branch`
- Description: (Optional) Regex of branches to match.  Specify only one of branch or tag.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag`
- Description: (Optional) Regex of tags to match.  Specify only one of branch or tag. <a name="nested_pubsub_config"></a>The `pubsub_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subscription`
- Description: (Output) Output only. Name of the subscription.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topic`
- Description: (Required) The name of the topic from which this subscription is receiving messages.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: (Optional) Service account that will make the push request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) Potential issues with the underlying Pub/Sub subscription configuration. Only populated on get requests. <a name="nested_webhook_config"></a>The `webhook_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret`
- Description: (Required) Resource name for the secret required as a URL parameter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) Potential issues with the underlying Pub/Sub subscription configuration. Only populated on get requests. <a name="nested_approval_config"></a>The `approval_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `approval_required`
- Description: (Optional) Whether or not approval is needed. If this is set on a build, it will become pending when run, and will need to be explicitly approved to start. <a name="nested_build"></a>The `build` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: (Optional) The location of the source files to build. One of `storageSource` or `repoSource` must be provided. Structure is [documented below](#nested_build_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) Tags for annotation of a Build. These are not docker tags.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `images`
- Description: (Optional) A list of images to be pushed upon the successful completion of all build steps. The images are pushed using the builder service account's credentials. The digests of the pushed images will be stored in the Build resource's results field. If any of the images fail to be pushed, the build status is marked FAILURE.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `substitutions`
- Description: (Optional) Substitutions data for Build resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `queue_ttl`
- Description: (Optional) TTL in queue for this build. If provided and the build is enqueued longer than this value, the build will expire and the build status will be EXPIRED. The TTL starts ticking from createTime. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logs_bucket`
- Description: (Optional) Google Cloud Storage bucket where logs should be written. Logs file names will be of the format ${logsBucket}/log-${build_id}.txt.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: (Optional) Amount of time that this build should be allowed to run, to second granularity. If this amount of time elapses, work on the build will cease and the build status will be TIMEOUT. This timeout must be equal to or greater than the sum of the timeouts for build steps within the build. The expected format is the number of seconds followed by s. Default time is ten minutes (600s).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret`
- Description: (Optional) Secrets to decrypt using Cloud Key Management Service. Structure is [documented below](#nested_build_secret).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `available_secrets`
- Description: (Optional) Secrets and secret environment variables. Structure is [documented below](#nested_build_available_secrets).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `step`
- Description: (Required) The operations to be performed on the workspace. Structure is [documented below](#nested_build_step).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifacts`
- Description: (Optional) Artifacts produced by the build that should be uploaded upon successful completion of all build steps. Structure is [documented below](#nested_build_artifacts).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `options`
- Description: (Optional) Special options for this build. Structure is [documented below](#nested_build_options). <a name="nested_build_source"></a>The `source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_source`
- Description: (Optional) Location of the source in an archive file in Google Cloud Storage. Structure is [documented below](#nested_build_source_storage_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repo_source`
- Description: (Optional) Location of the source in a Google Cloud Source Repository. Structure is [documented below](#nested_build_source_repo_source). <a name="nested_build_source_storage_source"></a>The `storage_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) Google Cloud Storage bucket containing the source.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: (Required) Google Cloud Storage object containing the source. This object must be a gzipped archive file (.tar.gz) containing source to build.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation`
- Description: (Optional) Google Cloud Storage generation for the object. If the generation is omitted, the latest generation will be used <a name="nested_build_source_repo_source"></a>The `repo_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) ID of the project that owns the Cloud Source Repository. If omitted, the project ID requesting the build is assumed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repo_name`
- Description: (Required) Name of the Cloud Source Repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dir`
- Description: (Optional) Directory, relative to the source root, in which to run the build. This must be a relative path. If a step's dir is specified and is an absolute path, this value is ignored for that step's execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `invert_regex`
- Description: (Optional) Only trigger a build if the revision regex does NOT match the revision regex.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `substitutions`
- Description: (Optional) Substitutions to use in a triggered build. Should only be used with triggers.run
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `branch_name`
- Description: (Optional) Regex matching branches to build. Exactly one a of branch name, tag, or commit SHA must be provided. The syntax of the regular expressions accepted is the syntax accepted by RE2 and described at https://github.com/google/re2/wiki/Syntax
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag_name`
- Description: (Optional) Regex matching tags to build. Exactly one a of branch name, tag, or commit SHA must be provided. The syntax of the regular expressions accepted is the syntax accepted by RE2 and described at https://github.com/google/re2/wiki/Syntax
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `commit_sha`
- Description: (Optional) Explicit commit SHA to build. Exactly one a of branch name, tag, or commit SHA must be provided. <a name="nested_build_secret"></a>The `secret` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Required) Cloud KMS key name to use to decrypt these envs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_env`
- Description: (Optional) Map of environment variable name to its encrypted value. Secret environment variables must be unique across all of a build's secrets, and must be used by at least one build step. Values can be at most 64 KB in size. There can be at most 100 secret values across all of a build's secrets. <a name="nested_build_available_secrets"></a>The `available_secrets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_manager`
- Description: (Required) Pairs a secret environment variable with a SecretVersion in Secret Manager. Structure is [documented below](#nested_build_available_secrets_secret_manager). <a name="nested_build_available_secrets_secret_manager"></a>The `secret_manager` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version_name`
- Description: (Required) Resource name of the SecretVersion. In format: projects/*/secrets/*/versions/*
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `env`
- Description: (Required) Environment variable name to associate with the secret. Secret environment variables must be unique across all of a build's secrets, and must be used by at least one build step. <a name="nested_build_step"></a>The `step` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the container image that will run this particular build step. If the image is available in the host's Docker daemon's cache, it will be run directly. If not, the host will attempt to pull the image first, using the builder service account's credentials if necessary. The Docker daemon's cache will already have the latest versions of all of the officially supported build steps (see https://github.com/GoogleCloudPlatform/cloud-builders for images and examples). The Docker daemon will also have cached many of the layers for some popular images, like "ubuntu", "debian", but they will be refreshed at the time you attempt to use them. If you built an image in a previous build step, it will be stored in the host's Docker daemon's cache and is available to use as the name for a later build step.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) A list of arguments that will be presented to the step when it is started. If the image used to run the step's container has an entrypoint, the args are used as arguments to that entrypoint. If the image does not define an entrypoint, the first element in args is used as the entrypoint, and the remainder will be used as arguments.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `env`
- Description: (Optional) A list of environment variable definitions to be used when running a step. The elements are of the form "KEY=VALUE" for the environment variable "KEY" being given the value "VALUE".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Optional) Unique identifier for this build step, used in `wait_for` to reference this build step as a dependency.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entrypoint`
- Description: (Optional) Entrypoint to be used instead of the build step image's default entrypoint. If unset, the image's default entrypoint is used
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dir`
- Description: (Optional) Working directory to use when running this step's container. If this value is a relative path, it is relative to the build's working directory. If this value is absolute, it may be outside the build's working directory, in which case the contents of the path may not be persisted across build step executions, unless a `volume` for that path is specified. If the build specifies a `RepoSource` with `dir` and a step with a `dir`, which specifies an absolute path, the `RepoSource` `dir` is ignored for the step's execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_env`
- Description: (Optional) A list of environment variables which are encrypted using a Cloud Key Management Service crypto key. These values must be specified in the build's `Secret`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: (Optional) Time limit for executing this build step. If not defined, the step has no time limit and will be allowed to continue to run until either it completes or the build itself times out.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timing`
- Description: (Optional) Output only. Stores timing information for executing this build step.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volumes`
- Description: (Optional) List of volumes to mount into the build step. Each volume is created as an empty volume prior to execution of the build step. Upon completion of the build, volumes and their contents are discarded. Using a named volume in only one step is not valid as it is indicative of a build request with an incorrect configuration. Structure is [documented below](#nested_build_step_step_volumes).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `wait_for`
- Description: (Optional) The ID(s) of the step(s) that this build step depends on. This build step will not start until all the build steps in `wait_for` have completed successfully. If `wait_for` is empty, this build step will start when all previous build steps in the `Build.Steps` list have completed successfully.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script`
- Description: (Optional) A shell script to be executed in the step. When script is provided, the user cannot specify the entrypoint or args.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_failure`
- Description: (Optional) Allow this build step to fail without failing the entire build. If false, the entire build will fail if this step fails. Otherwise, the build will succeed, but this step will still have a failure status. Error information will be reported in the `failureDetail` field. `allowExitCodes` takes precedence over this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_exit_codes`
- Description: (Optional) Allow this build step to fail without failing the entire build if and only if the exit code is one of the specified codes. If `allowFailure` is also specified, this field will take precedence. <a name="nested_build_step_step_volumes"></a>The `volumes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the volume to mount. Volume names must be unique per build step and must be valid names for Docker volumes. Each named volume must be used by at least two build steps.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) Path at which to mount the volume. Paths must be absolute and cannot conflict with other volume paths on the same build step or with certain reserved volume paths. <a name="nested_build_artifacts"></a>The `artifacts` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `images`
- Description: (Optional) A list of images to be pushed upon the successful completion of all build steps. The images will be pushed using the builder service account's credentials. The digests of the pushed images will be stored in the Build resource's results field. If any of the images fail to be pushed, the build is marked FAILURE.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `objects`
- Description: (Optional) A list of objects to be uploaded to Cloud Storage upon successful completion of all build steps. Files in the workspace matching specified paths globs will be uploaded to the Cloud Storage location using the builder service account's credentials. The location and generation of the uploaded objects will be stored in the Build resource's results field. If any objects fail to be pushed, the build is marked FAILURE. Structure is [documented below](#nested_build_artifacts_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maven_artifacts`
- Description: (Optional) A Maven artifact to upload to Artifact Registry upon successful completion of all build steps. The location and generation of the uploaded objects will be stored in the Build resource's results field. If any objects fail to be pushed, the build is marked FAILURE. Structure is [documented below](#nested_build_artifacts_maven_artifacts).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `python_packages`
- Description: (Optional) Python package to upload to Artifact Registry upon successful completion of all build steps. A package can encapsulate multiple objects to be uploaded to a single repository. The location and generation of the uploaded objects will be stored in the Build resource's results field. If any objects fail to be pushed, the build is marked FAILURE. Structure is [documented below](#nested_build_artifacts_python_packages).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `npm_packages`
- Description: (Optional) Npm package to upload to Artifact Registry upon successful completion of all build steps. The location and generation of the uploaded objects will be stored in the Build resource's results field. If any objects fail to be pushed, the build is marked FAILURE. Structure is [documented below](#nested_build_artifacts_npm_packages). <a name="nested_build_artifacts_objects"></a>The `objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) Cloud Storage bucket and optional object path, in the form "gs://bucket/path/to/somewhere/". Files in the workspace matching any path pattern will be uploaded to Cloud Storage with this location as a prefix.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `paths`
- Description: (Optional) Path globs used to match files in the build's workspace.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timing`
- Description: (Output) Output only. Stores timing information for pushing all artifact objects. Structure is [documented below](#nested_build_artifacts_objects_timing). <a name="nested_build_artifacts_objects_timing"></a>The `timing` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Optional) Start of time span. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_time`
- Description: (Optional) End of time span. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". <a name="nested_build_artifacts_maven_artifacts"></a>The `maven_artifacts` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Optional) Artifact Registry repository, in the form "https://$REGION-maven.pkg.dev/$PROJECT/$REPOSITORY" Artifact in the workspace specified by path will be uploaded to Artifact Registry with this location as a prefix.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) Path to an artifact in the build's workspace to be uploaded to Artifact Registry. This can be either an absolute path, e.g. /workspace/my-app/target/my-app-1.0.SNAPSHOT.jar or a relative path from /workspace, e.g. my-app/target/my-app-1.0.SNAPSHOT.jar.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `artifact_id`
- Description: (Optional) Maven artifactId value used when uploading the artifact to Artifact Registry.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_id`
- Description: (Optional) Maven groupId value used when uploading the artifact to Artifact Registry.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Maven version value used when uploading the artifact to Artifact Registry. <a name="nested_build_artifacts_python_packages"></a>The `python_packages` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Optional) Artifact Registry repository, in the form "https://$REGION-python.pkg.dev/$PROJECT/$REPOSITORY" Files in the workspace matching any path pattern will be uploaded to Artifact Registry with this location as a prefix.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `paths`
- Description: (Optional) Path globs used to match files in the build's workspace. For Python/ Twine, this is usually dist/*, and sometimes additionally an .asc file. <a name="nested_build_artifacts_npm_packages"></a>The `npm_packages` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Optional) Artifact Registry repository, in the form "https://$REGION-npm.pkg.dev/$PROJECT/$REPOSITORY" Npm package in the workspace specified by path will be zipped and uploaded to Artifact Registry with this location as a prefix.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `package_path`
- Description: (Optional) Path to the package.json. e.g. workspace/path/to/package <a name="nested_build_options"></a>The `options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_provenance_hash`
- Description: (Optional) Requested hash for SourceProvenance. Each value may be one of: `NONE`, `SHA256`, `MD5`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `requested_verify_option`
- Description: (Optional) Requested verifiability options. Possible values are: `NOT_VERIFIED`, `VERIFIED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: (Optional) Compute Engine machine type on which to run the build.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_size_gb`
- Description: (Optional) Requested disk size for the VM that runs the build. Note that this is NOT "disk free"; some of the space will be used by the operating system and build utilities. Also note that this is the minimum disk size that will be allocated for the build -- the build may run with a larger disk than requested. At present, the maximum disk size is 1000GB; builds that request more than the maximum are rejected with an error.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `substitution_option`
- Description: (Optional) Option to specify behavior when there is an error in the substitution checks. NOTE this is always set to ALLOW_LOOSE for triggered builds and cannot be overridden in the build configuration file. Possible values are: `MUST_MATCH`, `ALLOW_LOOSE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dynamic_substitutions`
- Description: (Optional) Option to specify whether or not to apply bash style string operations to the substitutions. NOTE this is always enabled for triggered builds and cannot be overridden in the build configuration file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_streaming_option`
- Description: (Optional) Option to define build log streaming behavior to Google Cloud Storage. Possible values are: `STREAM_DEFAULT`, `STREAM_ON`, `STREAM_OFF`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `worker_pool`
- Description: (Optional) Option to specify a WorkerPool for the build. Format projects/{project}/workerPools/{workerPool} This field is experimental.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging`
- Description: (Optional) Option to specify the logging mode, which determines if and where build logs are stored. Possible values are: `LOGGING_UNSPECIFIED`, `LEGACY`, `GCS_ONLY`, `STACKDRIVER_ONLY`, `CLOUD_LOGGING_ONLY`, `NONE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `env`
- Description: (Optional) A list of global environment variable definitions that will exist for all build steps in this build. If a variable is defined in both globally and in a build step, the variable will use the build step value. The elements are of the form "KEY=VALUE" for the environment variable "KEY" being given the value "VALUE".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_env`
- Description: (Optional) A list of global environment variables, which are encrypted using a Cloud Key Management Service crypto key. These values must be specified in the build's Secret. These variables will be available to all build steps in this build.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volumes`
- Description: (Optional) Global list of volumes to mount for ALL build steps Each volume is created as an empty volume prior to starting the build process. Upon completion of the build, volumes and their contents are discarded. Global volume names and paths cannot conflict with the volumes defined a build step. Using a global volume in a build with only one step is not valid as it is indicative of a build request with an incorrect configuration. Structure is [documented below](#nested_build_options_volumes). <a name="nested_build_options_volumes"></a>The `volumes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the volume to mount. Volume names must be unique per build step and must be valid names for Docker volumes. Each named volume must be used by at least two build steps.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) Path at which to mount the volume. Paths must be absolute and cannot conflict with other volume paths on the same build step or with certain reserved volume paths.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
