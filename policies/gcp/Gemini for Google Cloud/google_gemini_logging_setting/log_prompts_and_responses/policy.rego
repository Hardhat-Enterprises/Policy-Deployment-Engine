package terraform.gcp.security.gemini.google_gemini_logging_setting.log_prompts_and_responses

import data.terraform.helpers
import data.terraform.gcp.security.google_gemini_logging_setting.vars

conditions := [
    [
        {"situation_description" : "Resource log prompts and responses is not compliant.",
        "remedies":[ "Set log_prompts_and_responses to true."]},
        {
            "condition": "Check if log_metadata is compliant",
            "attribute_path" : ["log_prompts_and_responses"], 
            "values" : [true], 
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details
