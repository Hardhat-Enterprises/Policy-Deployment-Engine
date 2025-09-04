package terraform.gcp.security.api_hub.google_apihub_plugin.force_value_type_secret

import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_hub.google_apihub_plugin.vars

conditions := [
    [
        {"situation_description" : "Check value_type matches whitelist",
        "remedies":[ "Use valid value type in config template"]},
        {
            "condition": "Value type not set to allowed types in additional config template",
            "attribute_path" : ["config_template",0,"additional_config_template",0,"value_type"],
            "values" : ["SECRET"],
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details