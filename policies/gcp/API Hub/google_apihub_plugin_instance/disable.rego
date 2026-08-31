package terraform.gcp.security.api_hub.google_apihub_plugin_instance.disable

import data.terraform.helpers
import data.terraform.gcp.security.api_hub.google_apihub_plugin_instance.vars

conditions := [
    [
        {"situation_description" : "The API Hub plugin instance is disabled, so the monitoring and governance checks it provides stop running while the plugin stays deployed and unnoticed.",
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
details := summary.details
