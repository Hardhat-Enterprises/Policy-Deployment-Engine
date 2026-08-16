package terraform.gcp.security.os_config.google_os_config_os_policy_assignment.rollout_disruption_budget_percent
import data.terraform.helpers
import data.terraform.gcp.security.os_config.google_os_config_os_policy_assignment.vars

conditions := [
    [
    {"situation_description" : "OS Config OS policy assignment rollout disrupts 100% of VMs at once.",
    "remedies":["Set a disruption budget below 100% so a rollout does not update every VM simultaneously."]},
    {
        "condition": "Rollout disruption budget must not be 100 percent.",
        "attribute_path" : ["rollout", 0, "disruption_budget", 0, "percent"],
        "values" : [100],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
