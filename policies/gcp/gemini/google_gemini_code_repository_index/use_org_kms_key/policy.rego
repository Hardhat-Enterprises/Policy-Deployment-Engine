package terraform.gcp.security.gemini.google_gemini_code_repository_index.use_org_kms_key

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gemini.google_gemini_code_repository_index.vars

conditions := [
    [
        {"situation_description" : "Resource kms key is not compliant.",
        "remedies":[ "Set kms key to an approved one only."]},
        {
            "condition": "Check if kms_key is compliant",
            "attribute_path" : ["kms_key"], 
            "values" : ["projects/projectExample/locations/locationExample/keyRings/keyRingExample/cryptoKeys/cryptoKeyExample"], 
            "policy_type" : "whitelist" 
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details