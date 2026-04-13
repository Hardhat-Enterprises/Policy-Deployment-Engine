package terraform.gcp.security.gemini.google_gemini_code_repository_index.disable_force_destroy
import data.terraform.helpers
import data.terraform.gcp.security.gemini.google_gemini_code_repository_index.vars
conditions := [
    [
    {"situation_description" : "Force Destroy setting not set to False",
    "remedies":[ "Set force_destroy to false"]},
    {
        "condition": "Test if force_destroy is set to false",
        "attribute_path" : ["force_destroy"],
        "values" : [false], 
        "policy_type" : "whitelist" 
    }
    ]
]
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details