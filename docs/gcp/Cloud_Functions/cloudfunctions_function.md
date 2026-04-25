## 🛡️ Policy Deployment Engine: `cloudfunctions_function`

This section provides a concise policy evaluation for the `cloudfunctions_function` resource in GCP.

Reference: [Terraform Registry – cloudfunctions_function](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | A user-defined name of the function. Function names must be unique globally. | true | false | Name has no impact on the security of the resource or data contained. | None | None |
| `runtime` | Eg. `"nodejs20"`, `"python39"`, `"dotnet3"`, `"go116"`, `"java11"`, `"ruby30"`, `"php74"`, etc. Check the [official doc](https://cloud.google.com/functions/docs/concepts/exec#runtimes) for the up-to-date list. - - - | true | true | Only fully supporterd runtimes should be used ensuring there are no vulnerabilities, outdated libraries and not decomissioned or depreciate | Nodejs20 | Nodejs10 |
| `description` | Description of the function. | false | false | Description has no impact on the security of the resource or data contained. | None | None |
| `available_memory_mb` | Memory (in MB), available to the function. | false | true | How much memory the cloud function get effects performance, can cause crashes which can lead to security risks | 512 | 4444 |
| `timeout` |  Timeout (in seconds) for the function. | false | true | A timeout value being too short or too long can leave the cloud function vulnerable | 80 | 600 |
| `entry_point` | Name of the function that will be executed when the Google Cloud Function is triggered. | false | false | entry_point name has no impact on the security of the resource or the data contained | None | None |
| `event_trigger` | A source that fires events in response to a condition in another service. | false | false | event_trigger cannot be used with trigger http, which a policy has been written for | None | None |
| `trigger_http` |  | false | false | None | None | None |
| `https_trigger_security_level` | * `SECURE_ALWAYS` Requests for a URL that match this handler that do not use HTTPS are automatically redirected to the HTTPS URL with the same path. Query parameters are reserved for the redirect. * `SECURE_OPTIONAL` Both HTTP and HTTPS requests with URLs that match the handler succeed without redirects. The application can examine the request to determine which protocol was used and respond accordingly. | false | true | http trigger security level should always be enforced | SECURE_ALWAYS | SECURE_OPTIONAL |
| `ingress_settings` |  String value that controls what traffic can reach the function. | false | true | allowing internal traffic prevents untrusted access to the GCP environment | ALLOW_INTERNAL_ONLY | ALLOW_ALL |
| `labels` | **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource. | false | false | labels has no impact on the security of the resource or the data contained | None | None |
| `terraform_labels` | The combination of labels configured directly on the resource and default labels configured on the provider. | false | false | terraform labels has no impact on the security of the resource or the data contained | None | None |
| `effective_labels` | All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. | false | false | labels has no impact on the security of the resource or the data contained | None | None |
| `service_account_email` | If provided, the self-provided service account to run the function with. | false | false | None | None | None |
| `build_service_account` | If provided, the self-provided service account to use to build the function | false | false | A provided email to build the service account has no impact on the security of the resource or the data contained | None | None |
| `environment_variables` |  A set of key/value environment variable pairs to assign to the function. | false | false | environment variabls pairs being assigned has no impact on the security of the resource or the data contained | None | None |
| `build_environment_variables` | A set of key/value environment variable pairs available during build time. | false | false | if environment vaiablea are not being used, there is no reason to build the environment variables | None | None |
| `build_worker_pool` | Name of the Cloud Build Custom Worker Pool that should be used to build the function. | false | false | Naming the cloud build custom worker pool has no impact on the security of the resource or the data contained | None | None |
| `vpc_connector` | The VPC Network Connector that this cloud function can connect to | false | false | The VPC connector has no impact on the security of the resource or the data contained | australia-southeast1 | us-central1 |
| `vpc_connector_egress_settings` | The egress settings for the connector, controlling what traffic is diverted through it. | false | true | Allowing all extneral traffic to go through VPC connector can cause security risks such as data breaching | PRIVATE_RANGES_ONLY | ALL_TRAFFIC |
| `source_archive_bucket` | The GCS bucket containing the zip archive which contains the function. | false | false | The bucket containing the zip archive has no impact on the security of the resource or the data contained | None | None |
| `source_archive_object` | The source archive object (file) in archive bucket. | false | false | The source achive file has no impact on the security of the resource or the data contained | None | None |
| `source_repository` | Cannot be set alongside `source_archive_bucket` or `source_archive_object`. Structure is [documented below](#nested_source_repository). It must match the pattern `projects/{project}/locations/{location}/repositories/{repository}`.* | false | true | The source repository does not have an impact on the security of the resource or the data contained | None | None |
| `docker_registry` |  Docker Registry to use for storing the function's Docker images | false | true | CONTAINER_REGISTRY has been depreciated and can therefore cause security risks to the resource and its data | None | None |
| `docker_repository` |  | false | false | docker registry will be automatically set to artifact registry to prevent security risks to the resource and its data | None | None |
| `kms_key_name` | If specified, you must also provide an artifact registry repository using the `docker_repository` field that was created with the same KMS crypto key. Before deploying, please complete all pre-requisites described in https://cloud.google.com/functions/docs/securing/cmek#granting_service_accounts_access_to_the_key | false | false | A docker repository field needs to be set for kms key name to be active and therefor does not pose security risks to the resource and its data | None | None |
| `max_instances` | The limit on the maximum number of function instances that may coexist at a given time. | false | true | Too many instances can result in exaustion and open security risks | 50 | 150 |
| `min_instances` | he limit on the minimum number of function instances that may coexist at a given time. | false | false | A minimum number of instances has no impact on the security of the resource or the data contained only maximum | None | None |
| `secret_environment_variables` |  Secret environment variables | false | false | secret environment variables have no impact on the security of the resource or the data contained. | None | None |
| `secret_volumes` | Secret volumes configuration.  | false | false | Secret volumes have no impact on the security of the resource or the data contained.  | None | None |
| `automatic_update_policy` | Security patches are applied automatically to the runtime without requiring the function to be redeployed | false | true | automatic updates can patch security misconfigurations and therefore protect the security of the resource or the data contained |  | automatic_update_policy = true |
| `on_deploy_update_policy` | Security patches are only applied when a function is redeployed. | false | false | can not be used with automatic update policy | None | None |
| `failure_policy` |  | false | true |  | None | None |
| `versions` | List of secret versions to mount for this secret | false | false | secret versions have no impact on the security of the resource or the data contained. | None | None |

### event_trigger Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `event_type` | See the documentation on [calling Cloud Functions](https://cloud.google.com/functions/docs/calling/) for a full reference of accepted triggers. | true | false | event_trigger cannot be used with trigger http, which a policy has been written for | None | None |
| `resource` | which to observe events. For example, `"myBucket"` or `"projects/my-project/topics/my-topic"` | true | false | event_trigger cannot be used with trigger http, which a policy has been written for | None | None |
| `failure_policy` | Specifies policy for failed executions | false | false | event_trigger cannot be used with trigger http, which a policy has been written for | None | None |

### source_repository Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `url` | * To refer to a specific commit: `https://source.developers.google.com/projects/*/repos/*/revisions/*/paths/*` * To refer to a moveable alias (branch): `https://source.developers.google.com/projects/*/repos/*/moveable-aliases/*/paths/*`. To refer to HEAD, use the `master` moveable alias. * To refer to a specific fixed alias (tag): `https://source.developers.google.com/projects/*/repos/*/fixed-aliases/*/paths/*` | true | false | The URL points to user defined repositories, projects and revisions, the security of source repository will relate back to the region it resides in | None | None |

### secret_environment_variables Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` |  | true | false |  Name of the environment variable has no impact on the security of the resource or the data contained. | None | None |
| `project_id` |  | false | false |  A project ID has no impact on the security of the resource or the data contained. | None | None |
| `secret` |  | true | false | An ID of a secret has no impact on the security of the resource or the data contained. | None | None |
| `version` |  | true | false | Secret environment variables are not implemented and therefroe the version of the secret has no impact on the security of the resource or the data contained. | None | None |

### secret_volumes Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mount_path` | The path within the container to mount the secret volume. | true | false | Secret volumes are not configured and therefore mount paths have no impact on the security of the resource or the data contained. | None | None |
| `project_id` | Project identifier | false | false | Secret volumes are not configured and therefore project ID have no impact on the security of the resource or the data contained. | None | None |
| `secret` | ID of the secret in secret manager | true | false | Secret volumes are not configured and therefore secrets have no impact on the security of the resource or the data contained. | None | None |
| `versions` | List of secret versions to mount for this secret. | false | false | Secret volumes are not configured and therefore versions have no impact on the security of the resource or the data contained. | None | None |

### on_deploy_update_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `runtime_version` |  The runtime version which was used during latest function deployment. | false | false | because automatic update policy is functioning, on deploy update policy cannot and therefore runtime version does not apose security threats to the resource or the data contained | None | None |

### failure_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `retry` | Whether the function should be retried on failure. | true | true | If a function fails, it should try to be restarted to ensure data is not lost or corrupted | true | false |

### versions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | Relative path of the file under the mount path where the secret value for this version will be fetched and made available. | true | false | descriptions of secret versions have no impact on the security of the resource or the data contained. | None | None |
| `version` |  Version of the secret  | true | false | The version of secrets have no impact on the security of the resource or the data contained. | None | None |
