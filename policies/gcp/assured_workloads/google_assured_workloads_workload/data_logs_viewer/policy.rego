package terraform.gcp.security.assured_workloads.google_assured_workloads_workload.data_logs_viewer
import data.terraform.helpers
import data.terraform.gcp.security.assured_workloads.google_assured_workloads_workload.vars

# Policy: data_logs_viewer
# Description: Ensures partner can view inspectability logs and monitoring violations.
# Resource: google_assured_workloads_workload

conditions := [
    [
    {"situation_description": "Data logs viewer is not enabled for the partner workload",
    "remedies": [
        "Set partner_permissions.data_logs_viewer to true to allow partner to view inspectability logs"
    ]},
    {
        "condition": "Check data_logs_viewer is true",
        "attribute_path": ["partner_permissions", 0, "data_logs_viewer"],
        "values": [true],
        "policy_type": "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details