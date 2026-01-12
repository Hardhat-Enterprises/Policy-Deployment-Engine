package terraform.gcp.security.gemini.google_gemini_data_sharing_with_google_setting.disable_preview_data_sharing

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gemini.google_gemini_data_sharing_with_google_setting.vars

conditions := [
    [
        {"situation_description" : "Resource enable preview data sharing is not compliant.",
        "remedies":[ "Set enable_preview_data_sharing to false."]},
        {
            "condition": "Check if enable_preview_data_sharing is compliant",
            "attribute_path" : ["enable_preview_data_sharing"], 
            "values" : [false], 
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details