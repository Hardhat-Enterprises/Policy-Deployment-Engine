package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.private_key_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Ensure GitHub Enterprise private key secret version uses the required Secret Manager format",
            "remedies": ["Use private_key_secret_version in the format projects/*/secrets/*/versions/*"]
        },
        {
            "condition": "private_key_secret_version must use approved Secret Manager path format",
            "attribute_path": ["github_enterprise_config", 0, "private_key_secret_version"],
            "values": [
                "projects/*/secrets/*/versions/*",
                [
                    ["my-project-c"],  
                    ["private-key"],   
                    ["1"]             
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details