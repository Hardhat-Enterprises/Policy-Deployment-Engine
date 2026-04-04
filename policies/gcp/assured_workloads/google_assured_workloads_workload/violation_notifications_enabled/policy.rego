package terraform.gcp.security.assured_workloads.google_assured_workloads_workload.violation_notifications_enabled
import data.terraform.helpers
import data.terraform.gcp.security.assured_workloads.google_assured_workloads_workload.vars

conditions := [
    [
    {"situation_description": "Violation notifications are disabled on the workload",
    "remedies": [
        "Set violation_notifications_enabled to true to receive alerts when compliance violations occur"
    ]},
    {
        "condition": "Check violation_notifications_enabled is true",
        "attribute_path": ["violation_notifications_enabled"],
        "values": [true],
        "policy_type": "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details