package terraform.gcp.security.os_config.guest_policies.os_type_targeting
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config.guest_policies.os_type_targeting.vars

# This policy ensures that guest policies properly target OS types
# for better resource management and accurate policy application

conditions := [
    [
    {"situation_description" : "Guest policies must specify OS types for targeting",
    "remedies":[ "Add at least one OS type to the assignment block"]},
    {
        "condition": "Check if OS types are specified",
        "attribute_path" : ["assignment", "os_types"],
        "values" : [[]],
        "policy_type" : "blacklist"
    }
    ],
    [
    {"situation_description" : "Guest policies must be applied to approved zones only",
    "remedies":[ "Only use approved zones (australia-southeast1-a, australia-southeast1-b, australia-southeast2-a, australia-southeast2-b)"]},
    {
        "condition": "Check if zones are approved",
        "attribute_path" : ["assignment", "zones"],
        "values" : ["australia-southeast1-a", "australia-southeast1-b", "australia-southeast2-a", "australia-southeast2-b"],
        "policy_type" : "whitelist"
    }
    ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
details := helpers.get_multi_summary(conditions, vars.variables).details