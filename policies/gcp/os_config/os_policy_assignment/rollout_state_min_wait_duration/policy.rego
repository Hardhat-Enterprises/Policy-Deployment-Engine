package terraform.gcp.security.os_config.os_policy_assignment.rollout_state_min_wait_duration
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config.os_policy_assignment.vars

# This policy ensures that OS Policy Assignments have a proper rollout configuration
# to ensure controlled and safe deployment of OS policies

conditions := [
    [
        {
            "situation_description" : "OS Policy Assignment does not have minimum wait duration between rollout steps",
            "remedies":[ "Configure a minimum wait duration to ensure gradual and controlled rollout"]
        },
        {
            "condition": "Check if min_wait_duration is defined",
            "attribute_path" : ["rollout", 0, "min_wait_duration"],
            "values" : ["300s", "600s"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details