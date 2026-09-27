package terraform.gcp.security.gemini.google_gemini_code_repository_index.kms_key
import data.terraform.helpers
import data.terraform.gcp.security.gemini.google_gemini_code_repository_index.vars

conditions := [
    [
        {"situation_description" : "Resource kms key is not compliant.",
        "remedies":[ "Set kms key to an approved one only."]},
        {
            "condition": "Check if kms_key is compliant",
            "attribute_path" : ["kms_key"], 
            "values" : ["", "null", "Anything Else"], 
            "policy_type" : "blacklist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
