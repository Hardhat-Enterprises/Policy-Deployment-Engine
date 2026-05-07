package terraform.gcp.security.cloud_composer.google_composer_environment.env_variable_restriction

import data.terraform.helpers
import data.terraform.gcp.security.cloud_composer.google_composer_environment.vars

conditions := [

    [
        {
            "situation_description": "The Cloud Composer environment contains sensitive or restricted environment variables.",
            "remedies": [
                "Avoid storing secrets in environment variables.",
                "Use Secret Manager or secure alternatives."
            ]
        },
        {
            "condition": "Check for sensitive variable names",
            "attribute_path": ["config", 0, "software_config", 0,  "env_variables", "DB_PASSWORD"],
            "values": [
                "DB_PASSWORD"
            ],
            "policy_type": "blacklist"
        }
    ]

]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details