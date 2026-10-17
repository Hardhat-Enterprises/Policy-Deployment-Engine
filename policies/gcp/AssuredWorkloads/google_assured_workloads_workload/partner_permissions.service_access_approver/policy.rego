package terraform.gcp.security.assured_workloads.google_assured_workloads_workload.partner_permissions_service_access_approver
import data.terraform.helpers
import data.terraform.gcp.security.assured_workloads.google_assured_workloads_workload.vars

# Policy: service_access_approver
# Description: Ensures partner can view access approval logs.
# Resource: google_assured_workloads_workload

conditions := [
    [
    {"situation_description": "Service access approver is not enabled for the partner workload",
    "remedies": [
        "Set partner_permissions.service_access_approver to true to allow partner to view access approval logs"
    ]},
    {
        "condition": "Check service_access_approver is true",
        "attribute_path": ["partner_permissions", 0, "service_access_approver"],
        "values": [true],
        "policy_type": "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
