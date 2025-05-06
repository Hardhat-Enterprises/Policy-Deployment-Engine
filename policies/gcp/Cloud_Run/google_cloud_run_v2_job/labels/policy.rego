package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_job.vars

# Define required labels
required_labels := ["cost_center", "managed_by", "compliance", "owner_team"]

# Get all google_cloud_run_v2_job resources
resources := helpers.get_all_resources(vars.variables.resource_type)

# Identify non-compliant jobs (missing one or more required labels)
non_compliant := [r.values.name | r := resources[_]; not is_compliant(r)]

# Compliance check: returns true if all required labels are present
is_compliant(r) if {
    all_required_present := [label | label := required_labels[_]; r.values.labels[label]]
    count(all_required_present) == count(required_labels)
}

# Message summary
message := [
    sprintf("Total Cloud Run v2 Job detected: %v", [count(resources)]),
    [
        "Situation 1: Cloud Run v2 Job is missing one or more required labels: cost_center, managed_by, compliance, owner_team.",
        sprintf("Non-Compliant Resources: %v", [non_compliant]),
        "Potential Remedies: Add all required labels inside the 'labels' block."
    ]
]
