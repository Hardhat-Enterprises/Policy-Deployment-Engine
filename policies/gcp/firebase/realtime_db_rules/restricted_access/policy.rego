package terraform.gcp.security.firebase.realtime_db_rules.restricted_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.realtime_db_rules.vars

conditions := [
    [
    {
        "situation_description" : "Realtime Database rules allow public access",
        "remedies":[ "Update database rules to require authentication for read/write" ]
    },
    {
        "condition": "Check if rules contain ''.read'': true or ''.write'': true'",
        "attribute_path" : ["rules"],
        "values" : ["{\".read\": true, \".write\": true}"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
