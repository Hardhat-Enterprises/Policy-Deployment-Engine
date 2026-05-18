package terraform.gcp.security.assured_workloads.google_assured_workloads_workload.assured_workloads_monitoring
import data.terraform.helpers
import data.terraform.gcp.security.assured_workloads.google_assured_workloads_workload.vars

# Policy: assured_workloads_monitoring
# Description: Ensures Assured Workloads monitoring is enabled for partner workloads.
# Monitoring allows detection of compliance drift and unauthorised changes.
# Resource: google_assured_workloads_workload

conditions := [
    [
    {"situation_description": "Assured Workloads monitoring is not enabled for partner workload",
    "remedies": [
        "Set partner_permissions.assured_workloads_monitoring to true to enable compliance monitoring"
    ]},
    {
        "condition": "Check assured_workloads_monitoring is enabled",
        "attribute_path": ["partner_permissions", 0, "assured_workloads_monitoring"],
        "values": [true],
        "policy_type": "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details