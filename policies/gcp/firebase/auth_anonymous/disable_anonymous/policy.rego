package terraform.gcp.security.firebase.auth_anonymous.disable_anonymous

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.auth_anonymous.vars

conditions := [
    [
    {
        "situation_description" : "Anonymous sign-in is enabled for Firebase Authentication",
        "remedies":[ "Disable anonymous sign-in to enforce authentication through approved providers" ]
    },
    {
        "condition": "Check if allow_anonymous is false",
        "attribute_path" : ["allow_anonymous"],
        "values" : [false],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
