## 🛡️ Policy Deployment Engine: `cloudbuild_bitbucket_server_config`

This section provides a concise policy evaluation for the `cloudbuild_bitbucket_server_config` resource in GCP.

Reference: [Terraform Registry – cloudbuild_bitbucket_server_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_bitbucket_server_config)

---

## 1. Argument Reference

### `host_uri`
- Description: (Required) Immutable. The URI of the Bitbucket Server host. Once this field has been set, it cannot be changed. If you need to change it, please create another BitbucketServerConfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secrets`
- Description: (Required) Secret Manager secrets needed by the config. Structure is [documented below](#nested_secrets).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) Username of the account Cloud Build will use on Bitbucket Server.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_key`
- Description: (Required) Immutable. API Key that will be attached to webhook. Once this field has been set, it cannot be changed. Changing this field will result in deleting/ recreating the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config_id`
- Description: (Required) The ID to use for the BitbucketServerConfig, which will become the final component of the BitbucketServerConfig's resource name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of this bitbucket server config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connected_repositories`
- Description: (Optional) Connected Bitbucket Server repositories for this config. Structure is [documented below](#nested_connected_repositories).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peered_network`
- Description: (Optional) The network to be used when reaching out to the Bitbucket Server instance. The VPC network must be enabled for private service connection. This should be set if the Bitbucket Server instance is hosted on-premises and not reachable by public internet. If this field is left empty, no network peering will occur and calls to the Bitbucket Server instance will be made over the public internet. Must be in the format projects/{project}/global/networks/{network}, where {project} is a project number or id and {network} is the name of a VPC network in the project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_ca`
- Description: (Optional) SSL certificate to use for requests to Bitbucket Server. The format should be PEM format but the extension can be one of .pem, .cer, or .crt.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_secrets"></a>The `secrets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `admin_access_token_version_name`
- Description: (Required) The resource name for the admin access token's secret version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_access_token_version_name`
- Description: (Required) The resource name for the read access token's secret version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook_secret_version_name`
- Description: (Required) Immutable. The resource name for the webhook secret's secret version. Once this field has been set, it cannot be changed. Changing this field will result in deleting/ recreating the resource. <a name="nested_connected_repositories"></a>The `connected_repositories` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_key`
- Description: (Required) Identifier for the project storing the repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repo_slug`
- Description: (Required) Identifier for the repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
