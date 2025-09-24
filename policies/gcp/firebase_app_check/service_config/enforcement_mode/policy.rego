package terraform.gcp.security.firebase_app_check.service_config.enforcement_mode

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_app_check.service_config.vars

conditions := [
    [
        {"situation_description" : "App Check enforcement is not enabled.",
         "remedies":[ "Set enforcement_mode to 'ENFORCED'."]},
        {
            "condition": "Test if enforcement_mode is 'ENFORCED'",
            "attribute_path" : ["enforcement_mode"],
            "values" : ["ENFORCED"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details