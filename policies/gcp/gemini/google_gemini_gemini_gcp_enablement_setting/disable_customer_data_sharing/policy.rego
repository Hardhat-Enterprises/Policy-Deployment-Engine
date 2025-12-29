package terraform.gcp.security.gemini.google_gemini_gemini_gcp_enablement_setting.disable_customer_data_sharing

import data.terraform.helpers
import data.terraform.gcp.security.gemini.google_gemini_gemini_gcp_enablement_setting.vars

conditions := [
    [
        {"situation_description" : "Resource enable customer data sharing is not compliant.",
        "remedies":[ "Set enable_customer_data_sharing to false."]},
        {
            "condition": "Check if enable_customer_data_sharing is compliant",
            "attribute_path" : ["enable_customer_data_sharing"], 
            "values" : [false], 
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details