## 🛡️ Policy Deployment Engine: `cloudbuildv2_connection`

This section provides a concise policy evaluation for the `cloudbuildv2_connection` resource in GCP.

Reference: [Terraform Registry – cloudbuildv2_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuildv2_connection)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Immutable. The resource name of the connection. | true | false | None | None | None |
| `location` | The location for the resource | true | true | The location should be restricted to approved regions to ensure compliance with data residency, latency, and organisational policies. | australia-southeast2 | us-central1 |
| `github_config` | Configuration for connections to github.com. Structure is [documented below](#nested_github_config). | false | false | None | None | None |
| `github_enterprise_config` | Configuration for connections to an instance of GitHub Enterprise. Structure is [documented below](#nested_github_enterprise_config). | false | false | None | None | None |
| `gitlab_config` | Configuration for connections to gitlab.com or an instance of GitLab Enterprise. Structure is [documented below](#nested_gitlab_config). | false | false | None | None | None |
| `bitbucket_data_center_config` | Configuration for connections to Bitbucket Data Center. Structure is [documented below](#nested_bitbucket_data_center_config). | false | false | None | None | None |
| `bitbucket_cloud_config` | Configuration for connections to Bitbucket Cloud. Structure is [documented below](#nested_bitbucket_cloud_config). | false | false | None | None | None |
| `disabled` | If disabled is set to true, functionality is disabled for this connection. Repository based API methods and webhooks processing for repositories in this connection will be disabled. | false | false | None | None | None |
| `annotations` | Allows clients to store small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `authorizer_credential` |  | false | false | None | None | None |
| `service_directory_config` |  | false | false | None | None | None |
| `read_authorizer_credential` |  | false | false | None | None | None |

### github_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `authorizer_credential` | OAuth credential of the account that authorized the Cloud Build GitHub App. It is recommended to use a robot account instead of a human user account. The OAuth token must be tied to the Cloud Build GitHub App. Structure is [documented below](#nested_github_config_authorizer_credential). | false | true | The OAuth token used in the authorizer credential must be securely stored in an approved secret version to ensure that only authorized GitHub App integrations can access repositories and prevent exposure of sensitive credentials. | projects/my-project-c/secrets/oauth-token/versions/1 | projects/my-project-nc/secrets/oauth-token/versions/1 |
| `app_installation_id` | GitHub App installation id. | false | false | The GitHub App installation ID should be restricted to approved values to ensure only authorized GitHub integrations are used, preventing unauthorized repository access or misconfigured connections. | None | None |

### github_enterprise_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `host_uri` | Required. The URI of the GitHub Enterprise host this connection is for. | true | true | The host URI should point to a trusted and approved GitHub Enterprise instance to prevent connections to unauthorized or malicious endpoints. | https://ghe.example.com | https://bad.example.com |
| `app_id` | Id of the GitHub App created from the manifest. | false | false | None | None | None |
| `app_slug` | The URL-friendly name of the GitHub App. | false | false | The app slug should match the approved GitHub Enterprise App identifier to ensure the correct application is integrated. | None | None |
| `private_key_secret_version` | SecretManager resource containing the private key of the GitHub App, formatted as `projects/*/secrets/*/versions/*`. | false | true | The private key must be stored in a secure and approved secret version to protect authentication credentials and prevent unauthorized access. | projects/c/secrets/private-key/versions/1 | private-key-version-1 |
| `webhook_secret_secret_version` | SecretManager resource containing the webhook secret of the GitHub App, formatted as `projects/*/secrets/*/versions/*`. | false | true | The webhook secret must be securely stored and validated to ensure webhook events are authenticated and protected from tampering or unauthorized triggers. | projects/my-project-c/secrets/webhook-secret/versions/1 | projects/my-project-nc/secrets/webhook-secret/versions/1 |
| `app_installation_id` | ID of the installation of the GitHub App. | false | false | The app installation ID should be restricted to approved values to ensure only authorized GitHub Enterprise installations are used. | None | None |
| `service_directory_config` | Configuration for using Service Directory to privately connect to a GitHub Enterprise server. This should only be set if the GitHub Enterprise server is hosted on-premises and not reachable by public internet. If this field is left empty, calls to the GitHub Enterprise server will be made over the public internet. Structure is [documented below](#nested_github_enterprise_config_service_directory_config). | false | false | None | None | None |
| `ssl_ca` | SSL certificate to use for requests to GitHub Enterprise. | false | false | The ssl_ca must reference a trusted and approved certificate authority to ensure secure TLS communication with GitHub Enterprise and prevent man-in-the-middle attacks. | approved-ca-cert | unapproved-ca-cert |

### gitlab_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `host_uri` | The URI of the GitLab Enterprise host this connection is for. If not specified, the default value is https://gitlab.com. | false | false | None | None | None |
| `webhook_secret_secret_version` | Required. Immutable. SecretManager resource containing the webhook secret of a GitLab Enterprise project, formatted as `projects/*/secrets/*/versions/*`. | true | false | None | None | None |
| `read_authorizer_credential` | Required. A GitLab personal access token with the minimum `read_api` scope access. Structure is [documented below](#nested_gitlab_config_read_authorizer_credential). | true | false | None | None | None |
| `authorizer_credential` | Required. A GitLab personal access token with the `api` scope access. Structure is [documented below](#nested_gitlab_config_authorizer_credential). | true | false | None | None | None |
| `service_directory_config` | Configuration for using Service Directory to privately connect to a GitLab Enterprise server. This should only be set if the GitLab Enterprise server is hosted on-premises and not reachable by public internet. If this field is left empty, calls to the GitLab Enterprise server will be made over the public internet. Structure is [documented below](#nested_gitlab_config_service_directory_config). | false | false | None | None | None |
| `ssl_ca` | SSL certificate to use for requests to GitLab Enterprise. | false | false | None | None | None |
| `server_version` | (Output) Output only. Version of the GitLab Enterprise server running on the `host_uri`. | false | false | None | None | None |

### bitbucket_data_center_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `host_uri` | The URI of the Bitbucket Data Center host this connection is for. | true | false | None | None | None |
| `webhook_secret_secret_version` | Required. Immutable. SecretManager resource containing the webhook secret used to verify webhook events, formatted as `projects/*/secrets/*/versions/*`. | true | true | The webhook secret must be stored in a secure secret version to ensure that incoming webhook requests are authenticated and protected from tampering or unauthorized triggering of build pipelines. | projects/my-project-c/secrets/webhook-secret/versions/1 | projects/my-project-nc/secrets/webhook-secret/versions/1 |
| `read_authorizer_credential` | Required. A http access token with the `REPO_READ` access. Structure is [documented below](#nested_bitbucket_data_center_config_read_authorizer_credential). | true | true | This credential must reference an approved secret version to ensure only trusted tokens with REPO_READ permissions are used, preventing unauthorized access to repositories. | projects/my-project-c/secrets/read-token/versions/1 | projects/my-project-nc/secrets/read-token/versions/1 |
| `authorizer_credential` | Required. A http access token with the `REPO_ADMIN` scope access. Structure is [documented below](#nested_bitbucket_data_center_config_authorizer_credential). | true | true | The authorizer credential holds a high-privilege REPO_ADMIN access token stored in Secret Manager. Using unapproved secret versions may expose the connection to unauthorized repository access or credential misuse. | projects/my-project-c/secrets/admin-token/versions/1 | projects/my-project-nc/secrets/admin-token/versions/1 |
| `service_directory_config` | Configuration for using Service Directory to privately connect to a Bitbucket Data Center. This should only be set if the Bitbucket Data Center is hosted on-premises and not reachable by public internet. If this field is left empty, calls to the Bitbucket Data Center will be made over the public internet. Structure is [documented below](#nested_bitbucket_data_center_config_service_directory_config). | false | true | Using Service Directory ensures private and secure connectivity to Bitbucket Data Center, reducing exposure to public internet traffic and minimizing the risk of unauthorized access or interception. | projects/my-project-c/locations/australia-southeast2/namespaces/default/services/bitbucket-service | wrong-format |
| `ssl_ca` | SSL certificate to use for requests to the Bitbucket Data Center. | false | true | The ssl_ca ensures that connections to Bitbucket Data Center are verified using a trusted certificate authority, preventing man-in-the-middle attacks and ensuring secure communication. | approved-ca-cert | unapproved-ca-cert |
| `server_version` | (Output) Output only. Version of the Bitbucket Data Center running on the `host_uri`. | false | false | None | None | None |

### bitbucket_cloud_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `workspace` | The Bitbucket Cloud Workspace ID to be connected to Google Cloud Platform. | true | false | None | None | None |
| `webhook_secret_secret_version` | Required. Immutable. SecretManager resource containing the webhook secret used to verify webhook events, formatted as `projects/*/secrets/*/versions/*`. | true | true | Webhook secrets must be restricted to approved versions stored securely in Secret Manager to prevent unauthorized access and ensure trusted communication between Bitbucket and Cloud Build. | projects/my-project-c/secrets/webhook-secret/versions/1 | projects/my-project-nc/secrets/webhook-secret/versions/1 |
| `read_authorizer_credential` | Required. An access token with the `repository` access. It can be either a workspace, project or repository access token. It's recommended to use a system account to generate the credentials. Structure is [documented below](#nested_bitbucket_cloud_config_read_authorizer_credential). | true | true | This credential must be securely referenced and validated to ensure only authorized tokens with appropriate permissions are used for repository access. | projects/my-project-c/secrets/read-token/versions/1 | projects/my-project-nc/secrets/read-token/versions/1 |
| `authorizer_credential` | Required. An access token with the `webhook`, `repository`, `repository:admin` and `pullrequest` scope access. It can be either a workspace, project or repository access token. It's recommended to use a system account to generate these credentials. Structure is [documented below](#nested_bitbucket_cloud_config_authorizer_credential). | true | false | None | None | None |

### authorizer_credential Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `oauth_token_secret_version` | A SecretManager resource containing the OAuth token that authorizes the Cloud Build connection. Format: `projects/*/secrets/*/versions/*`. | false | false | None | None | None |
| `username` | (Output) Output only. The username associated to this token. | false | false | None | None | None |
| `user_token_secret_version` | Required. A SecretManager resource containing the user token that authorizes the Cloud Build connection. Format: `projects/*/secrets/*/versions/*`. | true | false | None | None | None |

### service_directory_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service` | Required. The Service Directory service name. Format: projects/{project}/locations/{location}/namespaces/{namespace}/services/{service}. | true | false | None | None | None |

### read_authorizer_credential Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `user_token_secret_version` | Required. A SecretManager resource containing the user token that authorizes the Cloud Build connection. Format: `projects/*/secrets/*/versions/*`. | true | false | None | None | None |
| `username` | (Output) Output only. The username associated to this token. | false | false | None | None | None |
