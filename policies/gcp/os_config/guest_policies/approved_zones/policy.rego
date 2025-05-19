package terraform.gcp.security.os_config.guest_policies.approved_zones
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config.guest_policies.vars

# This policy ensures that guest policies properly applies to approved zones
# for better resource management and accurate policy application

conditions := [
    [
        {
            "situation_description" : "Guest policies must be applied to approved zones only",
            "remedies":[ "Only use approved zones (australia-southeast1-a, australia-southeast1-b, australia-southeast2-a, australia-southeast2-b)"]
        },
        {
            "condition": "Check if zones are approved",
            "attribute_path" : ["assignment", 0, "zones", 0],
            "values" : ["australia-southeast1-a"],
            "policy_type" : "whitelist"
        },
        {
            "condition": "Check if zones are approved",
            "attribute_path" : ["assignment", 0, "zones", 1],
            "values" : ["australia-southeast1-b"],
            "policy_type" : "whitelist"
        },
        {
            "condition": "Check if zones are approved",
            "attribute_path" : ["assignment", 0, "zones", 2],
            "values" : ["australia-southeast2-a"],
            "policy_type" : "whitelist"
        },
        {
            "condition": "Check if zones are approved",
            "attribute_path" : ["assignment", 0, "zones", 3],
            "values" : ["australia-southeast2-b"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details