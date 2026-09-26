package terraform.gcp.security.gemini.google_gemini_code_repository_index.location
import data.terraform.helpers
import data.terraform.gcp.security.gemini.google_gemini_code_repository_index.vars

conditions := [
    [
        {"situation_description" : "Resource location is not compliant.",
        "remedies":[ "Set location to an approved one only."]},
        {
            "condition": "Check if location is allowed",
            "attribute_path" : ["location"], 
            "values" : ["australia-southeast1", "australia-southeast2"], 
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details