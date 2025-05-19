package terraform.gcp.security.os_config.os_policy_assignment.rollout_state_disruption_budget
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config.os_policy_assignment.vars

# This policy ensures that OS Policy Assignments have a proper rollout configuration
# to ensure controlled and safe deployment of OS policies

conditions := [
    [
        {
            "situation_description" : "OS Policy Assignment has a disruption budget that is too high",
            "remedies":[ "Set a lower disruption budget to minimize impact during rollout"]
        },
        {
            "condition": "Check if disruption_budget is set to a reasonable percentage",
            "attribute_path" : ["rollout", 0, "disruption_budget", 0, "percent"],
            "values" : [null, 20],
            "policy_type" : "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details