## 🛡️ Policy Deployment Engine: `cloudbuild_trigger`

This section provides a concise policy evaluation for the `cloudbuild_trigger` resource in GCP.

Reference: [Terraform Registry – cloudbuild_trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the trigger. Must be unique within the project. | false | None | None |
| `description` | Human-readable description of the trigger. | false | None | None |
| `tags` | Tags for annotation of a BuildTrigger | false | None | None |
| `disabled` | Whether the trigger is disabled or not. If true, the trigger will never result in a build. | false | None | None |
| `substitutions` | Substitutions data for Build resource. | false | None | None |
| `service_account` | The service account used for all user-controlled operations including triggers.patch, triggers.run, builds.create, and builds.cancel. If no service account is set, then the standard Cloud Build service account ([PROJECT_NUM]@system.gserviceaccount.com) will be used instead. Format: projects/{PROJECT_ID}/serviceAccounts/{ACCOUNT_ID_OR_EMAIL} | false | None | None |
| `include_build_logs` | Build logs will be sent back to GitHub as part of the checkrun result.  Values can be INCLUDE_BUILD_LOGS_UNSPECIFIED or INCLUDE_BUILD_LOGS_WITH_STATUS Possible values are: `INCLUDE_BUILD_LOGS_UNSPECIFIED`, `INCLUDE_BUILD_LOGS_WITH_STATUS`. | false | None | None |
| `filename` | Path, from the source root, to a file whose contents is used for the template. Either a filename or build template must be provided. Set this only when using trigger_template or github. When using Pub/Sub, Webhook or Manual set the file name using git_file_source instead. | false | None | None |
| `filter` | A Common Expression Language string. Used only with Pub/Sub and Webhook. | false | None | None |
| `ignored_files` | ignoredFiles and includedFiles are file glob matches using https://golang.org/pkg/path/filepath/#Match extended with support for `**`. If ignoredFiles and changed files are both empty, then they are not used to determine whether or not to trigger a build. If ignoredFiles is not empty, then we ignore any files that match any of the ignored_file globs. If the change has no files that are outside of the ignoredFiles globs, then we do not trigger a build. | false | None | None |
| `included_files` | ignoredFiles and includedFiles are file glob matches using https://golang.org/pkg/path/filepath/#Match extended with support for `**`. If any of the files altered in the commit pass the ignoredFiles filter and includedFiles is empty, then as far as this filter is concerned, we should trigger the build. If any of the files altered in the commit pass the ignoredFiles filter and includedFiles is not empty, then we make sure that at least one of those files matches a includedFiles glob. If not, then we do not trigger a build. | false | None | None |
| `location` | The [Cloud Build location](https://cloud.google.com/build/docs/locations) for the trigger. If not specified, "global" is used. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### git_file_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` | The path of the file, with the repo root as the root of the path. | true | None | None |
| `uri` | The URI of the repo (optional). If unspecified, the repo from which the trigger invocation originated is assumed to be the repo from which to read the specified path. | false | None | None |
| `repository` | The fully qualified resource name of the Repo API repository. The fully qualified resource name of the Repo API repository. If unspecified, the repo from which the trigger invocation originated is assumed to be the repo from which to read the specified path. | false | None | None |
| `repo_type` | The type of the repo, since it may not be explicit from the repo field (e.g from a URL). Values can be UNKNOWN, CLOUD_SOURCE_REPOSITORIES, GITHUB, BITBUCKET_SERVER Possible values are: `UNKNOWN`, `CLOUD_SOURCE_REPOSITORIES`, `GITHUB`, `BITBUCKET_SERVER`. | true | None | None |
| `revision` | The branch, tag, arbitrary ref, or SHA version of the repo to use when resolving the filename (optional). This field respects the same syntax/resolution as described here: https://git-scm.com/docs/gitrevisions If unspecified, the revision from which the trigger invocation originated is assumed to be the revision from which to read the specified path. | false | None | None |
| `github_enterprise_config` | The full resource name of the github enterprise config. Format: projects/{project}/locations/{location}/githubEnterpriseConfigs/{id}. projects/{project}/githubEnterpriseConfigs/{id}. | false | None | None |
| `bitbucket_server_config` | The full resource name of the bitbucket server config. Format: projects/{project}/locations/{location}/bitbucketServerConfigs/{id}. | false | None | None |

### repository_event_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `repository` | The resource name of the Repo API resource. | false | None | None |
| `pull_request` | Contains filter properties for matching Pull Requests. Structure is [documented below](#nested_repository_event_config_pull_request). | false | None | None |
| `push` | Contains filter properties for matching git pushes. Structure is [documented below](#nested_repository_event_config_push). | false | None | None |

### source_to_build Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | The URI of the repo. | false | None | None |
| `repository` | The qualified resource name of the Repo API repository. Either uri or repository can be specified and is required. | false | None | None |
| `ref` | The branch or tag to use. Must start with "refs/" (required). | true | None | None |
| `repo_type` | The type of the repo, since it may not be explicit from the repo field (e.g from a URL). Values can be UNKNOWN, CLOUD_SOURCE_REPOSITORIES, GITHUB, BITBUCKET_SERVER Possible values are: `UNKNOWN`, `CLOUD_SOURCE_REPOSITORIES`, `GITHUB`, `BITBUCKET_SERVER`. | true | None | None |
| `github_enterprise_config` | The full resource name of the github enterprise config. Format: projects/{project}/locations/{location}/githubEnterpriseConfigs/{id}. projects/{project}/githubEnterpriseConfigs/{id}. | false | None | None |
| `bitbucket_server_config` | The full resource name of the bitbucket server config. Format: projects/{project}/locations/{location}/bitbucketServerConfigs/{id}. | false | None | None |

### trigger_template Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | ID of the project that owns the Cloud Source Repository. If omitted, the project ID requesting the build is assumed. | false | None | None |
| `repo_name` | Name of the Cloud Source Repository. If omitted, the name "default" is assumed. | false | None | None |
| `dir` | Directory, relative to the source root, in which to run the build. This must be a relative path. If a step's dir is specified and is an absolute path, this value is ignored for that step's execution. | false | None | None |
| `invert_regex` | Only trigger a build if the revision regex does NOT match the revision regex. | false | None | None |
| `branch_name` | Name of the branch to build. Exactly one a of branch name, tag, or commit SHA must be provided. This field is a regular expression. | false | None | None |
| `tag_name` | Name of the tag to build. Exactly one of a branch name, tag, or commit SHA must be provided. This field is a regular expression. | false | None | None |
| `commit_sha` | Explicit commit SHA to build. Exactly one of a branch name, tag, or commit SHA must be provided. | false | None | None |

### github Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `owner` | Owner of the repository. For example: The owner for https://github.com/googlecloudplatform/cloud-builders is "googlecloudplatform". | false | None | None |
| `name` | Name of the repository. For example: The name for https://github.com/googlecloudplatform/cloud-builders is "cloud-builders". | false | None | None |
| `pull_request` | filter to match changes in pull requests. Specify only one of `pull_request` or `push`. Structure is [documented below](#nested_github_pull_request). | false | None | None |
| `push` | filter to match changes in refs, like branches or tags. Specify only one of `pull_request` or `push`. Structure is [documented below](#nested_github_push). | false | None | None |
| `enterprise_config_resource_name` | The resource name of the github enterprise config that should be applied to this installation. For example: "projects/{$projectId}/locations/{$locationId}/githubEnterpriseConfigs/{$configId}" | false | None | None |

### bitbucket_server_trigger_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `repo_slug` | Slug of the repository. A repository slug is a URL-friendly version of a repository name, automatically generated by Bitbucket for use in the URL. For example, if the repository name is 'test repo', in the URL it would become 'test-repo' as in https://mybitbucket.server/projects/TEST/repos/test-repo. | true | None | None |
| `project_key` | Key of the project that the repo is in. For example: The key for https://mybitbucket.server/projects/TEST/repos/test-repo is "TEST". | true | None | None |
| `bitbucket_server_config_resource` | The Bitbucket server config resource that this trigger config maps to. | true | None | None |
| `pull_request` | Filter to match changes in pull requests. Structure is [documented below](#nested_bitbucket_server_trigger_config_pull_request). | false | None | None |
| `push` | Filter to match changes in refs like branches, tags. Structure is [documented below](#nested_bitbucket_server_trigger_config_push). | false | None | None |

### pubsub_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `subscription` | (Output) Output only. Name of the subscription. | none | None | None |
| `topic` | The name of the topic from which this subscription is receiving messages. | true | None | None |
| `service_account_email` | Service account that will make the push request. | false | None | None |
| `state` | (Output) Potential issues with the underlying Pub/Sub subscription configuration. Only populated on get requests. | none | None | None |

### webhook_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret` | Resource name for the secret required as a URL parameter. | true | None | None |
| `state` | (Output) Potential issues with the underlying Pub/Sub subscription configuration. Only populated on get requests. | none | None | None |

### approval_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `approval_required` | Whether or not approval is needed. If this is set on a build, it will become pending when run, and will need to be explicitly approved to start. | false | None | None |

### build Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source` | The location of the source files to build. One of `storageSource` or `repoSource` must be provided. Structure is [documented below](#nested_build_source). | false | None | None |
| `tags` | Tags for annotation of a Build. These are not docker tags. | false | None | None |
| `images` | A list of images to be pushed upon the successful completion of all build steps. The images are pushed using the builder service account's credentials. The digests of the pushed images will be stored in the Build resource's results field. If any of the images fail to be pushed, the build status is marked FAILURE. | false | None | None |
| `substitutions` | Substitutions data for Build resource. | false | None | None |
| `queue_ttl` | TTL in queue for this build. If provided and the build is enqueued longer than this value, the build will expire and the build status will be EXPIRED. The TTL starts ticking from createTime. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | None | None |
| `logs_bucket` | Google Cloud Storage bucket where logs should be written. Logs file names will be of the format ${logsBucket}/log-${build_id}.txt. | false | None | None |
| `timeout` | Amount of time that this build should be allowed to run, to second granularity. If this amount of time elapses, work on the build will cease and the build status will be TIMEOUT. This timeout must be equal to or greater than the sum of the timeouts for build steps within the build. The expected format is the number of seconds followed by s. Default time is ten minutes (600s). | false | None | None |
| `secret` | Secrets to decrypt using Cloud Key Management Service. Structure is [documented below](#nested_build_secret). | false | None | None |
| `available_secrets` | Secrets and secret environment variables. Structure is [documented below](#nested_build_available_secrets). | false | None | None |
| `step` | The operations to be performed on the workspace. Structure is [documented below](#nested_build_step). | true | None | None |
| `artifacts` | Artifacts produced by the build that should be uploaded upon successful completion of all build steps. Structure is [documented below](#nested_build_artifacts). | false | None | None |
| `options` | Special options for this build. Structure is [documented below](#nested_build_options). | false | None | None |

### pull_request Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `branch` | Regex of branches to match. The syntax of the regular expressions accepted is the syntax accepted by RE2 and described at https://github.com/google/re2/wiki/Syntax | true | None | None |
| `invert_regex` | If true, branches that do NOT match the git_ref will trigger a build. | false | None | None |
| `comment_control` | Configure builds to run whether a repository owner or collaborator need to comment /gcbrun. Possible values are: `COMMENTS_DISABLED`, `COMMENTS_ENABLED`, `COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY`. | false | None | None |

### push Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `branch` | Regex of branches to match.  Specify only one of branch or tag. | false | None | None |
| `tag` | Regex of tags to match.  Specify only one of branch or tag. | false | None | None |
| `invert_regex` | When true, only trigger a build if the revision regex does NOT match the gitRef regex. | false | None | None |

### source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `storage_source` | Location of the source in an archive file in Google Cloud Storage. Structure is [documented below](#nested_build_source_storage_source). | false | None | None |
| `repo_source` | Location of the source in a Google Cloud Source Repository. Structure is [documented below](#nested_build_source_repo_source). | false | None | None |

### storage_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` | Google Cloud Storage bucket containing the source. | true | None | None |
| `object` | Google Cloud Storage object containing the source. This object must be a gzipped archive file (.tar.gz) containing source to build. | true | None | None |
| `generation` | Google Cloud Storage generation for the object. If the generation is omitted, the latest generation will be used | false | None | None |

### repo_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | ID of the project that owns the Cloud Source Repository. If omitted, the project ID requesting the build is assumed. | false | None | None |
| `repo_name` | Name of the Cloud Source Repository. | true | None | None |
| `dir` | Directory, relative to the source root, in which to run the build. This must be a relative path. If a step's dir is specified and is an absolute path, this value is ignored for that step's execution. | false | None | None |
| `invert_regex` | Only trigger a build if the revision regex does NOT match the revision regex. | false | None | None |
| `substitutions` | Substitutions to use in a triggered build. Should only be used with triggers.run | false | None | None |
| `branch_name` | Regex matching branches to build. Exactly one a of branch name, tag, or commit SHA must be provided. The syntax of the regular expressions accepted is the syntax accepted by RE2 and described at https://github.com/google/re2/wiki/Syntax | false | None | None |
| `tag_name` | Regex matching tags to build. Exactly one a of branch name, tag, or commit SHA must be provided. The syntax of the regular expressions accepted is the syntax accepted by RE2 and described at https://github.com/google/re2/wiki/Syntax | false | None | None |
| `commit_sha` | Explicit commit SHA to build. Exactly one a of branch name, tag, or commit SHA must be provided. | false | None | None |

### secret Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_name` | Cloud KMS key name to use to decrypt these envs. | true | None | None |
| `secret_env` | Map of environment variable name to its encrypted value. Secret environment variables must be unique across all of a build's secrets, and must be used by at least one build step. Values can be at most 64 KB in size. There can be at most 100 secret values across all of a build's secrets. | false | None | None |

### available_secrets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_manager` | Pairs a secret environment variable with a SecretVersion in Secret Manager. Structure is [documented below](#nested_build_available_secrets_secret_manager). | true | None | None |

### secret_manager Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `version_name` | Resource name of the SecretVersion. In format: projects/*/secrets/*/versions/* | true | None | None |
| `env` | Environment variable name to associate with the secret. Secret environment variables must be unique across all of a build's secrets, and must be used by at least one build step. | true | None | None |

### step Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the container image that will run this particular build step. If the image is available in the host's Docker daemon's cache, it will be run directly. If not, the host will attempt to pull the image first, using the builder service account's credentials if necessary. The Docker daemon's cache will already have the latest versions of all of the officially supported build steps (see https://github.com/GoogleCloudPlatform/cloud-builders for images and examples). The Docker daemon will also have cached many of the layers for some popular images, like "ubuntu", "debian", but they will be refreshed at the time you attempt to use them. If you built an image in a previous build step, it will be stored in the host's Docker daemon's cache and is available to use as the name for a later build step. | true | None | None |
| `args` | A list of arguments that will be presented to the step when it is started. If the image used to run the step's container has an entrypoint, the args are used as arguments to that entrypoint. If the image does not define an entrypoint, the first element in args is used as the entrypoint, and the remainder will be used as arguments. | false | None | None |
| `env` | A list of environment variable definitions to be used when running a step. The elements are of the form "KEY=VALUE" for the environment variable "KEY" being given the value "VALUE". | false | None | None |
| `id` | Unique identifier for this build step, used in `wait_for` to reference this build step as a dependency. | false | None | None |
| `entrypoint` | Entrypoint to be used instead of the build step image's default entrypoint. If unset, the image's default entrypoint is used | false | None | None |
| `dir` | Working directory to use when running this step's container. If this value is a relative path, it is relative to the build's working directory. If this value is absolute, it may be outside the build's working directory, in which case the contents of the path may not be persisted across build step executions, unless a `volume` for that path is specified. If the build specifies a `RepoSource` with `dir` and a step with a `dir`, which specifies an absolute path, the `RepoSource` `dir` is ignored for the step's execution. | false | None | None |
| `secret_env` | A list of environment variables which are encrypted using a Cloud Key Management Service crypto key. These values must be specified in the build's `Secret`. | false | None | None |
| `timeout` | Time limit for executing this build step. If not defined, the step has no time limit and will be allowed to continue to run until either it completes or the build itself times out. | false | None | None |
| `timing` | Output only. Stores timing information for executing this build step. | false | None | None |
| `volumes` | List of volumes to mount into the build step. Each volume is created as an empty volume prior to execution of the build step. Upon completion of the build, volumes and their contents are discarded. Using a named volume in only one step is not valid as it is indicative of a build request with an incorrect configuration. Structure is [documented below](#nested_build_step_step_volumes). | false | None | None |
| `wait_for` | The ID(s) of the step(s) that this build step depends on. This build step will not start until all the build steps in `wait_for` have completed successfully. If `wait_for` is empty, this build step will start when all previous build steps in the `Build.Steps` list have completed successfully. | false | None | None |
| `script` | A shell script to be executed in the step. When script is provided, the user cannot specify the entrypoint or args. | false | None | None |
| `allow_failure` | Allow this build step to fail without failing the entire build. If false, the entire build will fail if this step fails. Otherwise, the build will succeed, but this step will still have a failure status. Error information will be reported in the `failureDetail` field. `allowExitCodes` takes precedence over this field. | false | None | None |
| `allow_exit_codes` | Allow this build step to fail without failing the entire build if and only if the exit code is one of the specified codes. If `allowFailure` is also specified, this field will take precedence. | false | None | None |

### volumes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the volume to mount. Volume names must be unique per build step and must be valid names for Docker volumes. Each named volume must be used by at least two build steps. | false | None | None |
| `path` | Path at which to mount the volume. Paths must be absolute and cannot conflict with other volume paths on the same build step or with certain reserved volume paths. | false | None | None |

### artifacts Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `images` | A list of images to be pushed upon the successful completion of all build steps. The images will be pushed using the builder service account's credentials. The digests of the pushed images will be stored in the Build resource's results field. If any of the images fail to be pushed, the build is marked FAILURE. | false | None | None |
| `objects` | A list of objects to be uploaded to Cloud Storage upon successful completion of all build steps. Files in the workspace matching specified paths globs will be uploaded to the Cloud Storage location using the builder service account's credentials. The location and generation of the uploaded objects will be stored in the Build resource's results field. If any objects fail to be pushed, the build is marked FAILURE. Structure is [documented below](#nested_build_artifacts_objects). | false | None | None |
| `maven_artifacts` | A Maven artifact to upload to Artifact Registry upon successful completion of all build steps. The location and generation of the uploaded objects will be stored in the Build resource's results field. If any objects fail to be pushed, the build is marked FAILURE. Structure is [documented below](#nested_build_artifacts_maven_artifacts). | false | None | None |
| `python_packages` | Python package to upload to Artifact Registry upon successful completion of all build steps. A package can encapsulate multiple objects to be uploaded to a single repository. The location and generation of the uploaded objects will be stored in the Build resource's results field. If any objects fail to be pushed, the build is marked FAILURE. Structure is [documented below](#nested_build_artifacts_python_packages). | false | None | None |
| `npm_packages` | Npm package to upload to Artifact Registry upon successful completion of all build steps. The location and generation of the uploaded objects will be stored in the Build resource's results field. If any objects fail to be pushed, the build is marked FAILURE. Structure is [documented below](#nested_build_artifacts_npm_packages). | false | None | None |

### objects Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Cloud Storage bucket and optional object path, in the form "gs://bucket/path/to/somewhere/". Files in the workspace matching any path pattern will be uploaded to Cloud Storage with this location as a prefix. | false | None | None |
| `paths` | Path globs used to match files in the build's workspace. | false | None | None |
| `timing` | (Output) Output only. Stores timing information for pushing all artifact objects. Structure is [documented below](#nested_build_artifacts_objects_timing). The `timing` block contains: | none | None | None |
| `start_time` | Start of time span. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | false | None | None |
| `end_time` | End of time span. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | false | None | None |

### maven_artifacts Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `repository` | Artifact Registry repository, in the form "https://$REGION-maven.pkg.dev/$PROJECT/$REPOSITORY" Artifact in the workspace specified by path will be uploaded to Artifact Registry with this location as a prefix. | false | None | None |
| `path` | Path to an artifact in the build's workspace to be uploaded to Artifact Registry. This can be either an absolute path, e.g. /workspace/my-app/target/my-app-1.0.SNAPSHOT.jar or a relative path from /workspace, e.g. my-app/target/my-app-1.0.SNAPSHOT.jar. | false | None | None |
| `artifact_id` | Maven artifactId value used when uploading the artifact to Artifact Registry. | false | None | None |
| `group_id` | Maven groupId value used when uploading the artifact to Artifact Registry. | false | None | None |
| `version` | Maven version value used when uploading the artifact to Artifact Registry. | false | None | None |

### python_packages Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `repository` | Artifact Registry repository, in the form "https://$REGION-python.pkg.dev/$PROJECT/$REPOSITORY" Files in the workspace matching any path pattern will be uploaded to Artifact Registry with this location as a prefix. | false | None | None |
| `paths` | Path globs used to match files in the build's workspace. For Python/ Twine, this is usually dist/*, and sometimes additionally an .asc file. | false | None | None |

### npm_packages Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `repository` | Artifact Registry repository, in the form "https://$REGION-npm.pkg.dev/$PROJECT/$REPOSITORY" Npm package in the workspace specified by path will be zipped and uploaded to Artifact Registry with this location as a prefix. | false | None | None |
| `package_path` | Path to the package.json. e.g. workspace/path/to/package | false | None | None |

### options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source_provenance_hash` | Requested hash for SourceProvenance. Each value may be one of: `NONE`, `SHA256`, `MD5`. | false | None | None |
| `requested_verify_option` | Requested verifiability options. Possible values are: `NOT_VERIFIED`, `VERIFIED`. | false | None | None |
| `machine_type` | Compute Engine machine type on which to run the build. | false | None | None |
| `disk_size_gb` | Requested disk size for the VM that runs the build. Note that this is NOT "disk free"; some of the space will be used by the operating system and build utilities. Also note that this is the minimum disk size that will be allocated for the build -- the build may run with a larger disk than requested. At present, the maximum disk size is 1000GB; builds that request more than the maximum are rejected with an error. | false | None | None |
| `substitution_option` | Option to specify behavior when there is an error in the substitution checks. NOTE this is always set to ALLOW_LOOSE for triggered builds and cannot be overridden in the build configuration file. Possible values are: `MUST_MATCH`, `ALLOW_LOOSE`. | false | None | None |
| `dynamic_substitutions` | Option to specify whether or not to apply bash style string operations to the substitutions. NOTE this is always enabled for triggered builds and cannot be overridden in the build configuration file. | false | None | None |
| `log_streaming_option` | Option to define build log streaming behavior to Google Cloud Storage. Possible values are: `STREAM_DEFAULT`, `STREAM_ON`, `STREAM_OFF`. | false | None | None |
| `worker_pool` | Option to specify a WorkerPool for the build. Format projects/{project}/workerPools/{workerPool} This field is experimental. | false | None | None |
| `logging` | Option to specify the logging mode, which determines if and where build logs are stored. Possible values are: `LOGGING_UNSPECIFIED`, `LEGACY`, `GCS_ONLY`, `STACKDRIVER_ONLY`, `CLOUD_LOGGING_ONLY`, `NONE`. | false | None | None |
| `env` | A list of global environment variable definitions that will exist for all build steps in this build. If a variable is defined in both globally and in a build step, the variable will use the build step value. The elements are of the form "KEY=VALUE" for the environment variable "KEY" being given the value "VALUE". | false | None | None |
| `secret_env` | A list of global environment variables, which are encrypted using a Cloud Key Management Service crypto key. These values must be specified in the build's Secret. These variables will be available to all build steps in this build. | false | None | None |
| `volumes` | Global list of volumes to mount for ALL build steps Each volume is created as an empty volume prior to starting the build process. Upon completion of the build, volumes and their contents are discarded. Global volume names and paths cannot conflict with the volumes defined a build step. Using a global volume in a build with only one step is not valid as it is indicative of a build request with an incorrect configuration. Structure is [documented below](#nested_build_options_volumes). | false | None | None |
