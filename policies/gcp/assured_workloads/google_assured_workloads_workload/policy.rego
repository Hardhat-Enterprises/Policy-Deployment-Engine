package terraform.gcp.security.assured_workloads.google_assured_workloads_workload.compliance_regime
import data.terraform.helpers
import data.terraform.gcp.security.assured_workloads.google_assured_workloads_workload.vars

conditions := [
    [
    {"situation_description": "Workload is not using an approved compliance regime",
    "remedies": [
        "Set compliance_regime to an approved value such as FEDRAMP_MODERATE, FEDRAMP_HIGH, IL4, IL5, or ITAR"
    ]},
    {
        "condition": "Check compliance_regime is set to an approved value",
        "attribute_path": ["compliance_regime"],
        "values": ["FEDRAMP_MODERATE", "FEDRAMP_HIGH", "IL4", "IL5", "ITAR", "ASSURED_WORKLOADS_FOR_PARTNERS"],
        "policy_type": "whitelist"
    }
    ],
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