package terraform.gcp.security.cloud_functions.google_cloudfunctions_function.https_trigger_security_level
import data.terraform.helpers
import data.terraform.gcp.security.cloud_functions.google_cloudfunctions_function.vars


conditions := [
    [
    {"situation_description" : "Cloud function is not enforcing a secure HTTPS trigger level ",
    "remedies":[ "change https trigger security level to SECURE_ALWAYS"]},
    {
        "condition": "Test https trigger security level is set to SECURE_ALWAYS ",
        "attribute_path" : ["https_trigger_security_level"],
        "values" : ["SECURE_OPTIONAL"],
        "policy_type" : "blacklist"
    }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details