package terraform.gcp.security.firebase.firestore_rules.restricted_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.firestore_rules.vars

conditions := [
    [
    {
        "situation_description" : "Firestore rules allow open read or write access",
        "remedies":[ "Update Firestore rules to require authentication for read/write" ]
    },
    {
        "condition": "Check if rules contain 'allow read, write: if true'",
        "attribute_path" : ["values", "source", "files", 0, "content"],
        "values" : ["allow read, write: if true"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
