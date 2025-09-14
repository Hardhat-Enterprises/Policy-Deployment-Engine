package terraform.gcp.security.google_gemini.google_gemini_data_sharing_with_google_setting.location
import data.terraform.gcp.google_gemini.google_gemini_data_sharing_with_google_setting.vars

conditions := [
    [
    {"situation_description" : "Location not approved",
    "remedies":[ "Change the location to approved region"]},
    {
        "condition": "Test if location is not set to Australian region",
        "attribute_path" : ["parent"],
        "values" : ["australia-southeast1, australia-southeast2"],
        "policy_type" : "whitelist" 
    }
    ]
]
message := helpers.get_multi_summary(conditions, vars.variables).message
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details