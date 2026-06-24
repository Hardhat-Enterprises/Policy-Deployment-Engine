package terraform.gcp.security.apigee.google_apigee_instance.access_logging_config_enabled

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_instance.vars

conditions := [
    [
        {
            "situation_description": "Apigee Instance does not have access logging enabled",
            "remedies": [
                "Add an access_logging_config block to the resource",
                "Set enabled = true within access_logging_config"
            ]
        },
        {
            "condition": "Check if access logging is enabled",
            "attribute_path": ["access_logging_config", 0, "enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
