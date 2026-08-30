package terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.build_config_environment_variables

import data.terraform.helpers
import data.terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.vars


conditions := [
[
    {
        "situation_description": "Environment_variables contains only BUILD_CONFIG_TEST,SERVICE_CONFIG_TEST,SERVICE_CONFIG_DIFF_TEST  not any api key , db password any other values",
        "remedies": [
            "Ensure the Environment_variables includes correct values"
        ],
        "condition": "Environment_variables contains only BUILD_CONFIG_TEST,SERVICE_CONFIG_TEST,SERVICE_CONFIG_DIFF_TEST  not any api key , db password any other values",
        "attribute_path": ["build_config", 0,"environment_variables"],
        "values": ["BUILD_CONFIG_TEST","SERVICE_CONFIG_TEST","SERVICE_CONFIG_DIFF_TEST"],
        "policy_type": "whitelist"
    }
]
]

# Generate message and details
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
