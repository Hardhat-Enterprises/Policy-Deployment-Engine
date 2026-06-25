package terraform.gcp.security.assured_workloads.google_assured_workloads_workload.enable_sovereign_controls
import data.terraform.helpers
import data.terraform.gcp.security.assured_workloads.google_assured_workloads_workload.vars

# Policy: enable_sovereign_controls
# Description: Ensures sovereign controls are enabled where required.
# Sovereign controls provide data residency and personnel access restrictions.
# Resource: google_assured_workloads_workload

conditions := [
    [
    {"situation_description": "Sovereign controls are not enabled on the workload",
    "remedies": [
        "Set enable_sovereign_controls to true for workloads requiring data sovereignty"
    ]},
    {
        "condition": "Check enable_sovereign_controls is true",
        "attribute_path": ["enable_sovereign_controls"],
        "values": [true],
        "policy_type": "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details