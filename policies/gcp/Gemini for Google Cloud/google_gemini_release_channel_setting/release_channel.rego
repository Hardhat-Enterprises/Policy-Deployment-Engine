package terraform.gcp.security.gemini.google_gemini_release_channel_setting.release_channel

import data.terraform.helpers
import data.terraform.gcp.security.gemini.google_gemini_release_channel_setting.vars

conditions := [
    [
        {"situation_description" : "Resource release channel is not compliant.",
        "remedies":[ "Set release_channel to STABLE."]},
        {
            "condition": "Check if release_channel is compliant",
            "attribute_path" : ["release_channel"], 
            "values" : ["STABLE"], 
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
