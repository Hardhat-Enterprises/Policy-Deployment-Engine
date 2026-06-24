package terraform.gcp.security.cloud_composer.google_composer_user_workloads_config_map.region

import data.terraform.helpers
import data.terraform.gcp.security.cloud_composer.google_composer_user_workloads_config_map.vars

conditions := [

    [
        {
            "situation_description": "The environment is deployed in a region not supported by your organization.",
            "remedies": [
                "Use a supported region like 'us-central1' or 'europe-west1'.",
                "Consult Cloud Composer documentation for available regions."
            ]
        },
        {
            "condition": "Check if region is not in the allowed whitelist",
            "attribute_path": ["region"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
