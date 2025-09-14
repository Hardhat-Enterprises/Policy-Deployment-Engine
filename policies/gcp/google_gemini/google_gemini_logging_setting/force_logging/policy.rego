package terraform.gcp.security.google_gemini.google_gemini_data_sharing_with_google_setting.location
import data.terraform.gcp.google_gemini.google_gemini_data_sharing_with_google_setting.vars

conditions := [
    [
    {"situation_description" : "Logging not set to approved setting",
    "remedies":[ "Change log_prompts_and_responses is set to approved setting"]},
    {
        "condition": "Test if log_prompts_and_responses is set to true",
        "attribute_path" : ["log_prompts_and_responses"],
        "values" : [true],
        "policy_type" : "whitelist" 
    }
    ]
]
message := helpers.get_multi_summary(conditions, vars.variables).message
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details