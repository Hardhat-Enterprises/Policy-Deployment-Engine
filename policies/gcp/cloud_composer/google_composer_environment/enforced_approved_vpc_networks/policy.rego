package terraform.gcp.security.cloud_composer.google_composer_environment.enforced_approved_vpc_networks

import data.terraform.helpers
import data.terraform.gcp.security.cloud_composer.google_composer_environment.vars

conditions := [

    [
        {
            "situation_description": "Composer environment is using VPC network that is not approved by organization.",
            "remedies": [
                "Use an approved VPC network from the organization’s whitelist.",
                "Refer to Cloud Composer 3 documentation for specifying node_config.network."
            ]
        },
        {
            "condition": "Check if network is not in the allowed whitelist",
            "attribute_path": ["config", 0 , "node_config", 0 , "network"],
            "values": ["projects/my-project/global/networks/approved-network-1",
                       "projects/my-project/global/networks/approved-network-2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details