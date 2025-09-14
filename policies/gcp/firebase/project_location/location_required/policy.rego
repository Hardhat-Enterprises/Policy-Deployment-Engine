package terraform.gcp.security.firebase.project_location.location_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.project_location.vars

conditions := [
    [
    {
        "situation_description" : "Firebase project does not have a location set",
        "remedies":[ "Set the location_id attribute in the Firebase project" ]
    },
    {
        "condition": "Check if location_id is defined",
        "attribute_path" : ["location_id"],
        "values" : [],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
