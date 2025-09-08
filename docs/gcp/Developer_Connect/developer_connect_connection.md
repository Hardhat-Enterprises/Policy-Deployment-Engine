## 🛡️ Policy Deployment Engine: `developer_connect_connection`

This section provides a concise policy evaluation for the `developer_connect_connection` resource in GCP.

Reference: [Terraform Registry – developer_connect_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/developer_connect_connection)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | None | None |
| `connection_id` | Required. Id of the requesting object If auto-generating Id server-side, remove this field and connection_id from the method_signature of Create RPC | true | None | None |
| `labels` | Optional. Labels as key value pairs **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `etag` | Optional. This checksum is computed by the server based on the value of other fields, and may be sent on update and delete requests to ensure the client has an up-to-date value before proceeding. | false | None | None |
| `disabled` | Optional. If disabled is set to true, functionality is disabled for this connection. Repository based API methods and webhooks processing for repositories in this connection will be disabled. | false | None | None |
| `annotations` | Optional. Allows clients to store small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### github_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `installation_uri` | (Output) Output only. The URI to navigate to in order to manage the installation associated with this GitHubConfig. | none | None | None |
| `github_app` | Required. Immutable. The GitHub Application that was installed to the GitHub user or organization. Possible values: GIT_HUB_APP_UNSPECIFIED DEVELOPER_CONNECT FIREBASE | true | None | None |
| `authorizer_credential` | Represents an OAuth token of the account that authorized the Connection, and associated metadata. Structure is [documented below](#nested_github_config_authorizer_credential). | false | None | None |
| `app_installation_id` | Optional. GitHub App installation id. | false | None | None |

### github_enterprise_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `app_slug` | (Output) Output only. The URL-friendly name of the GitHub App. | none | None | None |
| `private_key_secret_version` | Optional. SecretManager resource containing the private key of the GitHub App, formatted as `projects/*/secrets/*/versions/*`. | false | None | None |
| `installation_uri` | (Output) Output only. The URI to navigate to in order to manage the installation associated with this GitHubEnterpriseConfig. | none | None | None |
| `service_directory_config` | ServiceDirectoryConfig represents Service Directory configuration for a connection. Structure is [documented below](#nested_github_enterprise_config_service_directory_config). | false | None | None |
| `server_version` | (Output) Output only. GitHub Enterprise version installed at the host_uri. | none | None | None |
| `ssl_ca_certificate` | Optional. SSL certificate to use for requests to GitHub Enterprise. | false | None | None |
| `host_uri` | Required. The URI of the GitHub Enterprise host this connection is for. | true | None | None |
| `app_id` | Optional. ID of the GitHub App created from the manifest. | false | None | None |
| `webhook_secret_secret_version` | Optional. SecretManager resource containing the webhook secret of the GitHub App, formatted as `projects/*/secrets/*/versions/*`. | false | None | None |
| `app_installation_id` | Optional. ID of the installation of the GitHub App. | false | None | None |

### gitlab_enterprise_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `authorizer_credential` | Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_gitlab_enterprise_config_authorizer_credential). | true | None | None |
| `service_directory_config` | ServiceDirectoryConfig represents Service Directory configuration for a connection. Structure is [documented below](#nested_gitlab_enterprise_config_service_directory_config). | false | None | None |
| `ssl_ca_certificate` | Optional. SSL Certificate Authority certificate to use for requests to GitLab Enterprise instance. | false | None | None |
| `server_version` | (Output) Output only. Version of the GitLab Enterprise server running on the `host_uri`. | none | None | None |
| `host_uri` | Required. The URI of the GitLab Enterprise host this connection is for. | true | None | None |
| `webhook_secret_secret_version` | Required. Immutable. SecretManager resource containing the webhook secret of a GitLab project, formatted as `projects/*/secrets/*/versions/*`. This is used to validate webhooks. | true | None | None |
| `read_authorizer_credential` | Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_gitlab_enterprise_config_read_authorizer_credential). | true | None | None |

### bitbucket_cloud_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `workspace` | Required. The Bitbucket Cloud Workspace ID to be connected to Google Cloud Platform. | true | None | None |
| `webhook_secret_secret_version` | Required. Immutable. SecretManager resource containing the webhook secret used to verify webhook events, formatted as `projects/*/secrets/*/versions/*`. This is used to validate and create webhooks. | true | None | None |
| `read_authorizer_credential` | Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_bitbucket_cloud_config_read_authorizer_credential). | true | None | None |
| `authorizer_credential` | Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_bitbucket_cloud_config_authorizer_credential). | true | None | None |

### bitbucket_data_center_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `webhook_secret_secret_version` | Required. Immutable. SecretManager resource containing the webhook secret used to verify webhook events, formatted as `projects/*/secrets/*/versions/*`. This is used to validate webhooks. | true | None | None |
| `read_authorizer_credential` | Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_bitbucket_data_center_config_read_authorizer_credential). | true | None | None |
| `authorizer_credential` | Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_bitbucket_data_center_config_authorizer_credential). | true | None | None |
| `service_directory_config` | ServiceDirectoryConfig represents Service Directory configuration for a connection. Structure is [documented below](#nested_bitbucket_data_center_config_service_directory_config). | false | None | None |
| `ssl_ca_certificate` | Optional. SSL certificate authority to trust when making requests to Bitbucket Data Center. | false | None | None |
| `server_version` | (Output) Output only. Version of the Bitbucket Data Center server running on the `host_uri`. | none | None | None |
| `host_uri` | Required. The URI of the Bitbucket Data Center host this connection is for. | true | None | None |

### gitlab_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `webhook_secret_secret_version` | Required. Immutable. SecretManager resource containing the webhook secret of a GitLab project, formatted as `projects/*/secrets/*/versions/*`. This is used to validate webhooks. | true | None | None |
| `read_authorizer_credential` | Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_gitlab_config_read_authorizer_credential). | true | None | None |
| `authorizer_credential` | Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_gitlab_config_authorizer_credential). | true | None | None |

### crypto_key_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key_reference` | Required. The name of the key which is used to encrypt/decrypt customer data. For key in Cloud KMS, the key should be in the format of `projects/*/locations/*/keyRings/*/cryptoKeys/*`. | true | None | None |

### authorizer_credential Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `oauth_token_secret_version` | Required. A SecretManager resource containing the OAuth token that authorizes the connection. Format: `projects/*/secrets/*/versions/*`. | true | None | None |
| `username` | (Output) Output only. The username associated with this token. | none | None | None |
| `user_token_secret_version` | Required. A SecretManager resource containing the user token that authorizes the Developer Connect connection. Format: `projects/*/secrets/*/versions/*`. | true | None | None |

### service_directory_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service` | Required. The Service Directory service name. Format: projects/{project}/locations/{location}/namespaces/{namespace}/services/{service}. | true | None | None |

### read_authorizer_credential Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `user_token_secret_version` | Required. A SecretManager resource containing the user token that authorizes the Developer Connect connection. Format: `projects/*/secrets/*/versions/*`. | true | None | None |
| `username` | (Output) Output only. The username associated with this token. | none | None | None |
