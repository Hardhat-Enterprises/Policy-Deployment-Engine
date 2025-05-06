package terraform.gcp.security.cloud_buildv2.connection.oauth_token_secret_version

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.connection.vars

scenarios_list := [
	[
  	{
    "situation_description": "OAuth token secret version must be from an approved location",
    "remedies": ["Use only approved oauth_token_secret_version paths"]
	},
	{
    "condition": "Invalid oauth_token_secret_version value",
    "attribute_path": ["github_config",0, "authorizer_credential", 0, "oauth_token_secret_version"],
    "values": ["projects/demo/secrets/github-token/versions/1"],
    "policy_type": "whitelist"
  	}
	]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)
message := summary.message
details := summary.details
