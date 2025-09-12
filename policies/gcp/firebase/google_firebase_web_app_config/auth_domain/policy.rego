package terraform.gcp.security.firebase.google_firebase_web_app_config.auth_domain
import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.google_firebase_web_app_config.vars


conditions := [
    [
    {"situation_description" : "Firebase web app config has missing or invalid auth domain",
    "remedies":[ "Configure auth_domain to end with '.firebaseapp.com'", "Ensure auth_domain is properly set in Firebase web app configuration"]},
    {
        "condition": "Check if auth_domain is missing or doesn't end with '.firebaseapp.com'",
        "attribute_path" : ["auth_domain"],
        "values" : [".firebaseapp.com"],
        "policy_type" : "pattern whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
