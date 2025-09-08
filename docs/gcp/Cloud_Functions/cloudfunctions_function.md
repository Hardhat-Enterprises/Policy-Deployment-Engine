## 🛡️ Policy Deployment Engine: `cloudfunctions_function`

This section provides a concise policy evaluation for the `cloudfunctions_function` resource in GCP.

Reference: [Terraform Registry – cloudfunctions_function](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `runtime` | Eg. `"nodejs20"`, `"python39"`, `"dotnet3"`, `"go116"`, `"java11"`, `"ruby30"`, `"php74"`, etc. Check the [official doc](https://cloud.google.com/functions/docs/concepts/exec#runtimes) for the up-to-date list. - - - | none | None | None |
| `description` |  | none | None | None |
| `available_memory_mb` |  | none | None | None |
| `timeout` |  | none | None | None |
| `entry_point` |  | none | None | None |
| `trigger_http` |  | none | None | None |
| `https_trigger_security_level` | * `SECURE_ALWAYS` Requests for a URL that match this handler that do not use HTTPS are automatically redirected to the HTTPS URL with the same path. Query parameters are reserved for the redirect. * `SECURE_OPTIONAL` Both HTTP and HTTPS requests with URLs that match the handler succeed without redirects. The application can examine the request to determine which protocol was used and respond accordingly. | none | None | None |
| `ingress_settings` |  | none | None | None |
| `labels` | **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource. | none | None | None |
| `terraform_labels` | The combination of labels configured directly on the resource and default labels configured on the provider. | none | None | None |
| `effective_labels` | All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. | none | None | None |
| `service_account_email` |  | none | None | None |
| `build_service_account` |  | none | None | None |
| `environment_variables` |  | none | None | None |
| `build_environment_variables` |  | none | None | None |
| `build_worker_pool` |  | none | None | None |
| `vpc_connector` |  | none | None | None |
| `vpc_connector_egress_settings` |  | none | None | None |
| `source_archive_bucket` |  | none | None | None |
| `source_archive_object` |  | none | None | None |
| `docker_registry` |  | none | None | None |
| `docker_repository` |  | none | None | None |
| `kms_key_name` | If specified, you must also provide an artifact registry repository using the `docker_repository` field that was created with the same KMS crypto key. Before deploying, please complete all pre-requisites described in https://cloud.google.com/functions/docs/securing/cmek#granting_service_accounts_access_to_the_key | none | None | None |
| `max_instances` |  | none | None | None |
| `min_instances` |  | none | None | None |
| `automatic_update_policy` |  | none | None | None |

### event_trigger Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `event_type` | See the documentation on [calling Cloud Functions](https://cloud.google.com/functions/docs/calling/) for a full reference of accepted triggers. | none | None | None |
| `resource` | which to observe events. For example, `"myBucket"` or `"projects/my-project/topics/my-topic"` | none | None | None |
| `failure_policy` |  | none | None | None |

### source_repository Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `url` | * To refer to a specific commit: `https://source.developers.google.com/projects/*/repos/*/revisions/*/paths/*` * To refer to a moveable alias (branch): `https://source.developers.google.com/projects/*/repos/*/moveable-aliases/*/paths/*`. To refer to HEAD, use the `master` moveable alias. * To refer to a specific fixed alias (tag): `https://source.developers.google.com/projects/*/repos/*/fixed-aliases/*/paths/*` | none | None | None |

### secret_environment_variables Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` |  | none | None | None |
| `project_id` |  | none | None | None |
| `secret` |  | none | None | None |
| `version` |  | none | None | None |

### secret_volumes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mount_path` |  | none | None | None |
| `project_id` |  | none | None | None |
| `secret` |  | none | None | None |
| `versions` |  | none | None | None |

### on_deploy_update_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `runtime_version` |  | none | None | None |

### failure_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `retry` |  | none | None | None |

### versions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` |  | none | None | None |
| `version` |  | none | None | None |
