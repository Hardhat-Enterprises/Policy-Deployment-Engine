package terraform.gcp.security.os_config.guest_policies.assignment_targets
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config.guest_policies.vars

# This policy ensures that guest policies have proper package installation in targeted zones
# to ensure security and compliance of installed packages

conditions := [
    [
        {
            "situation_description" : "Guest policy does not specify assignment targets",
            "remedies":[ "Define specific assignment targets for the guest policy to control which instances it applies to"]
        },
        {
            "condition": "Check if assignment is defined",
            "attribute_path" : ["assignment", 0, "zones", 0],
            "values" : ["us-central1-a"],
            "policy_type" : "blacklist"
        },
        {
            "condition": "Check if assignment is defined",
            "attribute_path" : ["assignment", 0, "zones", 1],
            "values" : ["europe-west1-b"],
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details