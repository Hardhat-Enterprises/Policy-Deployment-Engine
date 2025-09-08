## 🛡️ Policy Deployment Engine: `cloudbuildv2_connection`

This section provides a concise policy evaluation for the `cloudbuildv2_connection` resource in GCP.

Reference: [Terraform Registry – cloudbuildv2_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuildv2_connection)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Immutable. The resource name of the connection. | true | None | None |
| `location` | The location for the resource | true | None | None |
| `disabled` | If disabled is set to true, functionality is disabled for this connection. Repository based API methods and webhooks processing for repositories in this connection will be disabled. | false | None | None |
| `annotations` | Allows clients to store small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### github_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `authorizer_credential` | OAuth credential of the account that authorized the Cloud Build GitHub App. It is recommended to use a robot account instead of a human user account. The OAuth token must be tied to the Cloud Build GitHub App. Structure is [documented below](#nested_github_config_authorizer_credential). | false | None | None |
| `app_installation_id` | GitHub App installation id. | false | None | None |

### github_enterprise_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `host_uri` | Required. The URI of the GitHub Enterprise host this connection is for. | true | None | None |
| `app_id` | Id of the GitHub App created from the manifest. | false | None | None |
| `app_slug` | The URL-friendly name of the GitHub App. | false | None | None |
| `private_key_secret_version` | SecretManager resource containing the private key of the GitHub App, formatted as `projects/*/secrets/*/versions/*`. | false | None | None |
| `webhook_secret_secret_version` | SecretManager resource containing the webhook secret of the GitHub App, formatted as `projects/*/secrets/*/versions/*`. | false | None | None |
| `app_installation_id` | ID of the installation of the GitHub App. | false | None | None |
| `service_directory_config` | Configuration for using Service Directory to privately connect to a GitHub Enterprise server. This should only be set if the GitHub Enterprise server is hosted on-premises and not reachable by public internet. If this field is left empty, calls to the GitHub Enterprise server will be made over the public internet. Structure is [documented below](#nested_github_enterprise_config_service_directory_config). | false | None | None |
| `ssl_ca` | SSL certificate to use for requests to GitHub Enterprise. | false | None | None |

### gitlab_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `host_uri` | The URI of the GitLab Enterprise host this connection is for. If not specified, the default value is https://gitlab.com. | false | None | None |
| `webhook_secret_secret_version` | Required. Immutable. SecretManager resource containing the webhook secret of a GitLab Enterprise project, formatted as `projects/*/secrets/*/versions/*`. | true | None | None |
| `read_authorizer_credential` | Required. A GitLab personal access token with the minimum `read_api` scope access. Structure is [documented below](#nested_gitlab_config_read_authorizer_credential). | true | None | None |
| `authorizer_credential` | Required. A GitLab personal access token with the `api` scope access. Structure is [documented below](#nested_gitlab_config_authorizer_credential). | true | None | None |
| `service_directory_config` | Configuration for using Service Directory to privately connect to a GitLab Enterprise server. This should only be set if the GitLab Enterprise server is hosted on-premises and not reachable by public internet. If this field is left empty, calls to the GitLab Enterprise server will be made over the public internet. Structure is [documented below](#nested_gitlab_config_service_directory_config). | false | None | None |
| `ssl_ca` | SSL certificate to use for requests to GitLab Enterprise. | false | None | None |
| `server_version` | (Output) Output only. Version of the GitLab Enterprise server running on the `host_uri`. | none | None | None |

### bitbucket_data_center_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `host_uri` | The URI of the Bitbucket Data Center host this connection is for. | true | None | None |
| `webhook_secret_secret_version` | Required. Immutable. SecretManager resource containing the webhook secret used to verify webhook events, formatted as `projects/*/secrets/*/versions/*`. | true | None | None |
| `read_authorizer_credential` | Required. A http access token with the `REPO_READ` access. Structure is [documented below](#nested_bitbucket_data_center_config_read_authorizer_credential). | true | None | None |
| `authorizer_credential` | Required. A http access token with the `REPO_ADMIN` scope access. Structure is [documented below](#nested_bitbucket_data_center_config_authorizer_credential). | true | None | None |
| `service_directory_config` | Configuration for using Service Directory to privately connect to a Bitbucket Data Center. This should only be set if the Bitbucket Data Center is hosted on-premises and not reachable by public internet. If this field is left empty, calls to the Bitbucket Data Center will be made over the public internet. Structure is [documented below](#nested_bitbucket_data_center_config_service_directory_config). | false | None | None |
| `ssl_ca` | SSL certificate to use for requests to the Bitbucket Data Center. | false | None | None |
| `server_version` | (Output) Output only. Version of the Bitbucket Data Center running on the `host_uri`. | none | None | None |

### bitbucket_cloud_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `workspace` | The Bitbucket Cloud Workspace ID to be connected to Google Cloud Platform. | true | None | None |
| `webhook_secret_secret_version` | Required. Immutable. SecretManager resource containing the webhook secret used to verify webhook events, formatted as `projects/*/secrets/*/versions/*`. | true | None | None |
| `read_authorizer_credential` | Required. An access token with the `repository` access. It can be either a workspace, project or repository access token. It's recommended to use a system account to generate the credentials. Structure is [documented below](#nested_bitbucket_cloud_config_read_authorizer_credential). | true | None | None |
| `authorizer_credential` | Required. An access token with the `webhook`, `repository`, `repository:admin` and `pullrequest` scope access. It can be either a workspace, project or repository access token. It's recommended to use a system account to generate these credentials. Structure is [documented below](#nested_bitbucket_cloud_config_authorizer_credential). | true | None | None |

### authorizer_credential Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `oauth_token_secret_version` | A SecretManager resource containing the OAuth token that authorizes the Cloud Build connection. Format: `projects/*/secrets/*/versions/*`. | false | None | None |
| `username` | (Output) Output only. The username associated to this token. | none | None | None |
| `user_token_secret_version` | Required. A SecretManager resource containing the user token that authorizes the Cloud Build connection. Format: `projects/*/secrets/*/versions/*`. | true | None | None |

### service_directory_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service` | Required. The Service Directory service name. Format: projects/{project}/locations/{location}/namespaces/{namespace}/services/{service}. | true | None | None |

### read_authorizer_credential Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `user_token_secret_version` | Required. A SecretManager resource containing the user token that authorizes the Cloud Build connection. Format: `projects/*/secrets/*/versions/*`. | true | None | None |
| `username` | (Output) Output only. The username associated to this token. | none | None | None |
