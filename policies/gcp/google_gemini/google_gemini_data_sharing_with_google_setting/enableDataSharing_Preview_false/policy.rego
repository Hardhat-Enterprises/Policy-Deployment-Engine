package terraform.gcp.security.google_gemini.google_gemini_data_sharing_with_google_setting.enableDataSharing_Preview_false
import data.terraform.gcp.helpers
import data.terraform.gcp.google_gemini.google_gemini_data_sharing_with_google_setting.vars

conditions := [
    [
    {"situation_description" : "Data Sharing & Preview setting not set to False",
    "remedies":[ "Change the setting to False"]},
    {
        "condition": "Test if enable_data_sharing is not set to False",
        "attribute_path" : ["enable_data_sharing"],
        "values" : [false],
        "policy_type" : "whitelist" 
    },
    {
        "condition": "Test if enable_preview_data_sharing is not set to False",
        "attribute_path" : ["enable_preview_data_sharing"],
        "values" : [false],
        "policy_type" : "whitelist" 
    }
    ]
]
message := helpers.get_multi_summary(conditions, vars.variables).message
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details