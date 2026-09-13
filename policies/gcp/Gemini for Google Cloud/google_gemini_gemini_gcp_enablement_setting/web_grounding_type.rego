package terraform.gcp.security.gemini.google_gemini_gemini_gcp_enablement_setting.web_grounding_type

import data.terraform.helpers
import data.terraform.gcp.security.gemini.google_gemini_gemini_gcp_enablement_setting.vars

conditions := [
    [
        {"situation_description" : "Resource web grounding type is not compliant.",
        "remedies":[ "Set web_grounding_type to WEB_GROUNDING_FOR_ENTERPRISE."]},
        {
            "condition": "Check if web_grounding_type is compliant",
            "attribute_path" : ["web_grounding_type"], 
            "values" : ["WEB_GROUNDING_FOR_ENTERPRISE"], 
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
