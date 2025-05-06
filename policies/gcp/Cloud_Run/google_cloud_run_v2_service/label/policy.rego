package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.label

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vars

required_labels := ["env", "owner", "cost-center"]

resources := helpers.get_all_resources(vars.variables.resource_type)

# List of non-compliant resource names
non_compliant := [r.values.name | r := resources[_]; not is_compliant(r)]

# Function: returns true if all required labels are present in the resource
is_compliant(r) if {
    all_required_present := [label | label := required_labels[_]; r.values.labels[label]]
    count(all_required_present) == count(required_labels)
}

message := [
    sprintf("Total cloud run service detected: %v", [count(resources)]),
    [
        "Situation 1: Cloud Run service is missing required labels: env, owner, cost-center.",
        sprintf("Non-Compliant Resources: %v", [non_compliant]),
        "Potential Remedies: Add the required labels under the 'labels' block."
    ]
]
