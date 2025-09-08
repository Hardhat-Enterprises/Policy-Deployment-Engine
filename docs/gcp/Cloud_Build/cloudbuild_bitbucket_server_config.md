## 🛡️ Policy Deployment Engine: `cloudbuild_bitbucket_server_config`

This section provides a concise policy evaluation for the `cloudbuild_bitbucket_server_config` resource in GCP.

Reference: [Terraform Registry – cloudbuild_bitbucket_server_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_bitbucket_server_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `host_uri` | Immutable. The URI of the Bitbucket Server host. Once this field has been set, it cannot be changed. If you need to change it, please create another BitbucketServerConfig. | true | None | None |
| `username` | Username of the account Cloud Build will use on Bitbucket Server. | true | None | None |
| `api_key` | Immutable. API Key that will be attached to webhook. Once this field has been set, it cannot be changed. Changing this field will result in deleting/ recreating the resource. | true | None | None |
| `config_id` | The ID to use for the BitbucketServerConfig, which will become the final component of the BitbucketServerConfig's resource name. | true | None | None |
| `location` | The location of this bitbucket server config. | true | None | None |
| `peered_network` | The network to be used when reaching out to the Bitbucket Server instance. The VPC network must be enabled for private service connection. This should be set if the Bitbucket Server instance is hosted on-premises and not reachable by public internet. If this field is left empty, no network peering will occur and calls to the Bitbucket Server instance will be made over the public internet. Must be in the format projects/{project}/global/networks/{network}, where {project} is a project number or id and {network} is the name of a VPC network in the project. | false | None | None |
| `ssl_ca` | SSL certificate to use for requests to Bitbucket Server. The format should be PEM format but the extension can be one of .pem, .cer, or .crt. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### secrets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `admin_access_token_version_name` | The resource name for the admin access token's secret version. | true | None | None |
| `read_access_token_version_name` | The resource name for the read access token's secret version. | true | None | None |
| `webhook_secret_version_name` | Immutable. The resource name for the webhook secret's secret version. Once this field has been set, it cannot be changed. Changing this field will result in deleting/ recreating the resource. | true | None | None |

### connected_repositories Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_key` | Identifier for the project storing the repository. | true | None | None |
| `repo_slug` | Identifier for the repository. | true | None | None |
