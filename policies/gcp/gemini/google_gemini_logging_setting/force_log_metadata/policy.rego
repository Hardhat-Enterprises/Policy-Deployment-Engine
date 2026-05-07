package terraform.gcp.security.gemini.google_gemini_logging_setting.force_log_metadata

import data.terraform.helpers
import data.terraform.gcp.security.google_gemini_logging_setting.vars

conditions := [
    [
        {"situation_description" : "Resource enable customer data sharing is not compliant.",
        "remedies":[ "Set log_metadata to true."]},
        {
            "condition": "Check if log_metadata is compliant",
            "attribute_path" : ["log_metadata"], 
            "values" : [true], 
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details