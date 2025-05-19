package terraform.gcp.security.os_config.guest_policies.os_type_targeting
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config.guest_policies.vars

# This policy ensures that guest policies properly target OS types
# for better resource management and accurate policy application

conditions := [
    [
        {
            "situation_description" : "Guest policies must specify OS types for targeting",
            "remedies":[ "Add at least one OS type to the assignment block"]
        },
        {
            "condition": "Check if OS types are specified",
            "attribute_path" : ["assignment", 0, "os_types"],
            "values" : [[]],
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details