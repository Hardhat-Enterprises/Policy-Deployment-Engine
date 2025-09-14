package terraform.gcp.security.firebase.hosting_https.https_only

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.hosting_https.vars

conditions := [
    [
    {
        "situation_description" : "Firebase Hosting site does not enforce HTTPS",
        "remedies":[ "Set require_ssl to true to enforce HTTPS" ]
    },
    {
        "condition": "Check if require_ssl is true",
        "attribute_path" : ["require_ssl"],
        "values" : [true],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
