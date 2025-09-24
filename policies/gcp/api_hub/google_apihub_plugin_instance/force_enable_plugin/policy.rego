package terraform.gcp.security.api_hub.google_apihub_plugin_instance.force_enable_plugin

import data.terraform.gcp.helpers
import data.terraform.gcp.security.api_hub.google_apihub_plugin_instance.vars

conditions := [
    [
        {"situation_description" : "Plugin is disabled",
        "remedies":[ "Enable plugin with disable=false"]},
        {
            "condition": "Not allowed to disable plugin",
            "attribute_path" : ["disable"],
            "values" : [false],
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details