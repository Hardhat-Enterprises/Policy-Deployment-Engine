## 🛡️ Policy Deployment Engine: `cloudbuildv2_connection`

This section provides a concise policy evaluation for the `cloudbuildv2_connection` resource in GCP.

Reference: [Terraform Registry – cloudbuildv2_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuildv2_connection)

---

## 1. Argument Reference

### `name`
- Description: (Required) Immutable. The resource name of the connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `github_config`
- Description: (Optional) Configuration for connections to github.com. Structure is [documented below](#nested_github_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `github_enterprise_config`
- Description: (Optional) Configuration for connections to an instance of GitHub Enterprise. Structure is [documented below](#nested_github_enterprise_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gitlab_config`
- Description: (Optional) Configuration for connections to gitlab.com or an instance of GitLab Enterprise. Structure is [documented below](#nested_gitlab_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bitbucket_data_center_config`
- Description: (Optional) Configuration for connections to Bitbucket Data Center. Structure is [documented below](#nested_bitbucket_data_center_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bitbucket_cloud_config`
- Description: (Optional) Configuration for connections to Bitbucket Cloud. Structure is [documented below](#nested_bitbucket_cloud_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) If disabled is set to true, functionality is disabled for this connection. Repository based API methods and webhooks processing for repositories in this connection will be disabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Allows clients to store small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_github_config"></a>The `github_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorizer_credential`
- Description: (Optional) OAuth credential of the account that authorized the Cloud Build GitHub App. It is recommended to use a robot account instead of a human user account. The OAuth token must be tied to the Cloud Build GitHub App. Structure is [documented below](#nested_github_config_authorizer_credential).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_installation_id`
- Description: (Optional) GitHub App installation id. <a name="nested_github_config_authorizer_credential"></a>The `authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth_token_secret_version`
- Description: (Optional) A SecretManager resource containing the OAuth token that authorizes the Cloud Build connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated to this token. <a name="nested_github_enterprise_config"></a>The `github_enterprise_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_uri`
- Description: (Required) Required. The URI of the GitHub Enterprise host this connection is for.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_id`
- Description: (Optional) Id of the GitHub App created from the manifest.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_slug`
- Description: (Optional) The URL-friendly name of the GitHub App.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_key_secret_version`
- Description: (Optional) SecretManager resource containing the private key of the GitHub App, formatted as `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook_secret_secret_version`
- Description: (Optional) SecretManager resource containing the webhook secret of the GitHub App, formatted as `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_installation_id`
- Description: (Optional) ID of the installation of the GitHub App.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_directory_config`
- Description: (Optional) Configuration for using Service Directory to privately connect to a GitHub Enterprise server. This should only be set if the GitHub Enterprise server is hosted on-premises and not reachable by public internet. If this field is left empty, calls to the GitHub Enterprise server will be made over the public internet. Structure is [documented below](#nested_github_enterprise_config_service_directory_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_ca`
- Description: (Optional) SSL certificate to use for requests to GitHub Enterprise. <a name="nested_github_enterprise_config_service_directory_config"></a>The `service_directory_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) Required. The Service Directory service name. Format: projects/{project}/locations/{location}/namespaces/{namespace}/services/{service}. <a name="nested_gitlab_config"></a>The `gitlab_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_uri`
- Description: (Optional) The URI of the GitLab Enterprise host this connection is for. If not specified, the default value is https://gitlab.com.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook_secret_secret_version`
- Description: (Required) Required. Immutable. SecretManager resource containing the webhook secret of a GitLab Enterprise project, formatted as `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_authorizer_credential`
- Description: (Required) Required. A GitLab personal access token with the minimum `read_api` scope access. Structure is [documented below](#nested_gitlab_config_read_authorizer_credential).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorizer_credential`
- Description: (Required) Required. A GitLab personal access token with the `api` scope access. Structure is [documented below](#nested_gitlab_config_authorizer_credential).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_directory_config`
- Description: (Optional) Configuration for using Service Directory to privately connect to a GitLab Enterprise server. This should only be set if the GitLab Enterprise server is hosted on-premises and not reachable by public internet. If this field is left empty, calls to the GitLab Enterprise server will be made over the public internet. Structure is [documented below](#nested_gitlab_config_service_directory_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_ca`
- Description: (Optional) SSL certificate to use for requests to GitLab Enterprise.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_version`
- Description: (Output) Output only. Version of the GitLab Enterprise server running on the `host_uri`. <a name="nested_gitlab_config_read_authorizer_credential"></a>The `read_authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the user token that authorizes the Cloud Build connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated to this token. <a name="nested_gitlab_config_authorizer_credential"></a>The `authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the user token that authorizes the Cloud Build connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated to this token. <a name="nested_gitlab_config_service_directory_config"></a>The `service_directory_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) Required. The Service Directory service name. Format: projects/{project}/locations/{location}/namespaces/{namespace}/services/{service}. <a name="nested_bitbucket_data_center_config"></a>The `bitbucket_data_center_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_uri`
- Description: (Required) The URI of the Bitbucket Data Center host this connection is for.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook_secret_secret_version`
- Description: (Required) Required. Immutable. SecretManager resource containing the webhook secret used to verify webhook events, formatted as `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_authorizer_credential`
- Description: (Required) Required. A http access token with the `REPO_READ` access. Structure is [documented below](#nested_bitbucket_data_center_config_read_authorizer_credential).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorizer_credential`
- Description: (Required) Required. A http access token with the `REPO_ADMIN` scope access. Structure is [documented below](#nested_bitbucket_data_center_config_authorizer_credential).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_directory_config`
- Description: (Optional) Configuration for using Service Directory to privately connect to a Bitbucket Data Center. This should only be set if the Bitbucket Data Center is hosted on-premises and not reachable by public internet. If this field is left empty, calls to the Bitbucket Data Center will be made over the public internet. Structure is [documented below](#nested_bitbucket_data_center_config_service_directory_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_ca`
- Description: (Optional) SSL certificate to use for requests to the Bitbucket Data Center.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_version`
- Description: (Output) Output only. Version of the Bitbucket Data Center running on the `host_uri`. <a name="nested_bitbucket_data_center_config_read_authorizer_credential"></a>The `read_authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the user token that authorizes the Cloud Build connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated to this token. <a name="nested_bitbucket_data_center_config_authorizer_credential"></a>The `authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the user token that authorizes the Cloud Build connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated to this token. <a name="nested_bitbucket_data_center_config_service_directory_config"></a>The `service_directory_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) Required. The Service Directory service name. Format: projects/{project}/locations/{location}/namespaces/{namespace}/services/{service}. <a name="nested_bitbucket_cloud_config"></a>The `bitbucket_cloud_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workspace`
- Description: (Required) The Bitbucket Cloud Workspace ID to be connected to Google Cloud Platform.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook_secret_secret_version`
- Description: (Required) Required. Immutable. SecretManager resource containing the webhook secret used to verify webhook events, formatted as `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_authorizer_credential`
- Description: (Required) Required. An access token with the `repository` access. It can be either a workspace, project or repository access token. It's recommended to use a system account to generate the credentials. Structure is [documented below](#nested_bitbucket_cloud_config_read_authorizer_credential).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorizer_credential`
- Description: (Required) Required. An access token with the `webhook`, `repository`, `repository:admin` and `pullrequest` scope access. It can be either a workspace, project or repository access token. It's recommended to use a system account to generate these credentials. Structure is [documented below](#nested_bitbucket_cloud_config_authorizer_credential). <a name="nested_bitbucket_cloud_config_read_authorizer_credential"></a>The `read_authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the user token that authorizes the Cloud Build connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated to this token. <a name="nested_bitbucket_cloud_config_authorizer_credential"></a>The `authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the user token that authorizes the Cloud Build connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated to this token.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
