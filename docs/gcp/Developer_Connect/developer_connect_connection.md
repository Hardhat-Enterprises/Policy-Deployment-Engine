## 🛡️ Policy Deployment Engine: `developer_connect_connection`

This section provides a concise policy evaluation for the `developer_connect_connection` resource in GCP.

Reference: [Terraform Registry – developer_connect_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/developer_connect_connection)

---

## 1. Argument Reference

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_id`
- Description: (Required) Required. Id of the requesting object If auto-generating Id server-side, remove this field and connection_id from the method_signature of Create RPC
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

### `labels`
- Description: (Optional) Optional. Labels as key value pairs **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `etag`
- Description: (Optional) Optional. This checksum is computed by the server based on the value of other fields, and may be sent on update and delete requests to ensure the client has an up-to-date value before proceeding.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gitlab_enterprise_config`
- Description: (Optional) Configuration for connections to an instance of GitLab Enterprise. Structure is [documented below](#nested_gitlab_enterprise_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bitbucket_cloud_config`
- Description: (Optional) Configuration for connections to an instance of Bitbucket Cloud. Structure is [documented below](#nested_bitbucket_cloud_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bitbucket_data_center_config`
- Description: (Optional) Configuration for connections to an instance of Bitbucket Data Center. Structure is [documented below](#nested_bitbucket_data_center_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Optional. If disabled is set to true, functionality is disabled for this connection. Repository based API methods and webhooks processing for repositories in this connection will be disabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Optional. Allows clients to store small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gitlab_config`
- Description: (Optional) Configuration for connections to gitlab.com. Structure is [documented below](#nested_gitlab_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `crypto_key_config`
- Description: (Optional) The crypto key configuration. This field is used by the Customer-managed encryption keys (CMEK) feature. Structure is [documented below](#nested_crypto_key_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_github_config"></a>The `github_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `installation_uri`
- Description: (Output) Output only. The URI to navigate to in order to manage the installation associated with this GitHubConfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `github_app`
- Description: (Required) Required. Immutable. The GitHub Application that was installed to the GitHub user or organization. Possible values: GIT_HUB_APP_UNSPECIFIED DEVELOPER_CONNECT FIREBASE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorizer_credential`
- Description: (Optional) Represents an OAuth token of the account that authorized the Connection, and associated metadata. Structure is [documented below](#nested_github_config_authorizer_credential).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_installation_id`
- Description: (Optional) Optional. GitHub App installation id. <a name="nested_github_config_authorizer_credential"></a>The `authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the OAuth token that authorizes the connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated with this token. <a name="nested_github_enterprise_config"></a>The `github_enterprise_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_slug`
- Description: (Output) Output only. The URL-friendly name of the GitHub App.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_key_secret_version`
- Description: (Optional) Optional. SecretManager resource containing the private key of the GitHub App, formatted as `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `installation_uri`
- Description: (Output) Output only. The URI to navigate to in order to manage the installation associated with this GitHubEnterpriseConfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_directory_config`
- Description: (Optional) ServiceDirectoryConfig represents Service Directory configuration for a connection. Structure is [documented below](#nested_github_enterprise_config_service_directory_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_version`
- Description: (Output) Output only. GitHub Enterprise version installed at the host_uri.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_ca_certificate`
- Description: (Optional) Optional. SSL certificate to use for requests to GitHub Enterprise.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_uri`
- Description: (Required) Required. The URI of the GitHub Enterprise host this connection is for.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_id`
- Description: (Optional) Optional. ID of the GitHub App created from the manifest.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook_secret_secret_version`
- Description: (Optional) Optional. SecretManager resource containing the webhook secret of the GitHub App, formatted as `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_installation_id`
- Description: (Optional) Optional. ID of the installation of the GitHub App. <a name="nested_github_enterprise_config_service_directory_config"></a>The `service_directory_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) Required. The Service Directory service name. Format: projects/{project}/locations/{location}/namespaces/{namespace}/services/{service}. <a name="nested_gitlab_enterprise_config"></a>The `gitlab_enterprise_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorizer_credential`
- Description: (Required) Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_gitlab_enterprise_config_authorizer_credential).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_directory_config`
- Description: (Optional) ServiceDirectoryConfig represents Service Directory configuration for a connection. Structure is [documented below](#nested_gitlab_enterprise_config_service_directory_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_ca_certificate`
- Description: (Optional) Optional. SSL Certificate Authority certificate to use for requests to GitLab Enterprise instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_version`
- Description: (Output) Output only. Version of the GitLab Enterprise server running on the `host_uri`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_uri`
- Description: (Required) Required. The URI of the GitLab Enterprise host this connection is for.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook_secret_secret_version`
- Description: (Required) Required. Immutable. SecretManager resource containing the webhook secret of a GitLab project, formatted as `projects/*/secrets/*/versions/*`. This is used to validate webhooks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_authorizer_credential`
- Description: (Required) Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_gitlab_enterprise_config_read_authorizer_credential). <a name="nested_gitlab_enterprise_config_authorizer_credential"></a>The `authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the user token that authorizes the Developer Connect connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated with this token. <a name="nested_gitlab_enterprise_config_service_directory_config"></a>The `service_directory_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) Required. The Service Directory service name. Format: projects/{project}/locations/{location}/namespaces/{namespace}/services/{service}. <a name="nested_gitlab_enterprise_config_read_authorizer_credential"></a>The `read_authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the user token that authorizes the Developer Connect connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated with this token. <a name="nested_bitbucket_cloud_config"></a>The `bitbucket_cloud_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workspace`
- Description: (Required) Required. The Bitbucket Cloud Workspace ID to be connected to Google Cloud Platform.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook_secret_secret_version`
- Description: (Required) Required. Immutable. SecretManager resource containing the webhook secret used to verify webhook events, formatted as `projects/*/secrets/*/versions/*`. This is used to validate and create webhooks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_authorizer_credential`
- Description: (Required) Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_bitbucket_cloud_config_read_authorizer_credential).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorizer_credential`
- Description: (Required) Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_bitbucket_cloud_config_authorizer_credential). <a name="nested_bitbucket_cloud_config_read_authorizer_credential"></a>The `read_authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the user token that authorizes the Developer Connect connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated with this token. <a name="nested_bitbucket_cloud_config_authorizer_credential"></a>The `authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the user token that authorizes the Developer Connect connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated with this token. <a name="nested_bitbucket_data_center_config"></a>The `bitbucket_data_center_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook_secret_secret_version`
- Description: (Required) Required. Immutable. SecretManager resource containing the webhook secret used to verify webhook events, formatted as `projects/*/secrets/*/versions/*`. This is used to validate webhooks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_authorizer_credential`
- Description: (Required) Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_bitbucket_data_center_config_read_authorizer_credential).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorizer_credential`
- Description: (Required) Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_bitbucket_data_center_config_authorizer_credential).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_directory_config`
- Description: (Optional) ServiceDirectoryConfig represents Service Directory configuration for a connection. Structure is [documented below](#nested_bitbucket_data_center_config_service_directory_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_ca_certificate`
- Description: (Optional) Optional. SSL certificate authority to trust when making requests to Bitbucket Data Center.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_version`
- Description: (Output) Output only. Version of the Bitbucket Data Center server running on the `host_uri`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_uri`
- Description: (Required) Required. The URI of the Bitbucket Data Center host this connection is for. <a name="nested_bitbucket_data_center_config_read_authorizer_credential"></a>The `read_authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the user token that authorizes the Developer Connect connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated with this token. <a name="nested_bitbucket_data_center_config_authorizer_credential"></a>The `authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated with this token.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the user token that authorizes the Developer Connect connection. Format: `projects/*/secrets/*/versions/*`. <a name="nested_bitbucket_data_center_config_service_directory_config"></a>The `service_directory_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) Required. The Service Directory service name. Format: projects/{project}/locations/{location}/namespaces/{namespace}/services/{service}. <a name="nested_gitlab_config"></a>The `gitlab_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook_secret_secret_version`
- Description: (Required) Required. Immutable. SecretManager resource containing the webhook secret of a GitLab project, formatted as `projects/*/secrets/*/versions/*`. This is used to validate webhooks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_authorizer_credential`
- Description: (Required) Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_gitlab_config_read_authorizer_credential).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorizer_credential`
- Description: (Required) Represents a personal access token that authorized the Connection, and associated metadata. Structure is [documented below](#nested_gitlab_config_authorizer_credential). <a name="nested_gitlab_config_read_authorizer_credential"></a>The `read_authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the user token that authorizes the Developer Connect connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated with this token. <a name="nested_gitlab_config_authorizer_credential"></a>The `authorizer_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_token_secret_version`
- Description: (Required) Required. A SecretManager resource containing the user token that authorizes the Developer Connect connection. Format: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Output) Output only. The username associated with this token. <a name="nested_crypto_key_config"></a>The `crypto_key_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_reference`
- Description: (Required) Required. The name of the key which is used to encrypt/decrypt customer data. For key in Cloud KMS, the key should be in the format of `projects/*/locations/*/keyRings/*/cryptoKeys/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
