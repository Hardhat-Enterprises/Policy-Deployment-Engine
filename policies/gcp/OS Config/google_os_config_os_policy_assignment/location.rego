package terraform.gcp.security.os_config.google_os_config_os_policy_assignment.location
import data.terraform.helpers
import data.terraform.gcp.security.os_config.google_os_config_os_policy_assignment.vars

conditions := [
    [
    {"situation_description" : "OS Config OS policy assignment is created in an unapproved location.",
    "remedies":["Use an approved location for the OS policy assignment (data residency)."]},
    {
        "condition": "Location must be in the approved list.",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1", "australia-southeast2"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
