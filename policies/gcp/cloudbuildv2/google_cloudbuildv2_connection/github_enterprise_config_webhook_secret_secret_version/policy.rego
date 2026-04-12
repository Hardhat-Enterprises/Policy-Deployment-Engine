package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.github_enterprise_config_webhook_secret_secret_version

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars



conditions := [
    [
        {
            "situation_description" : "Prevent Terraform from disabling Cloud Build v2 connections",
            "remedies":["Set disabled to false"]
        },
        {
            "condition": "Set disabled to false",
            "attribute_path" : ["disabled"],
            "values" : [true],
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details