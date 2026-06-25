package terraform.gcp.security.assured_workloads.google_assured_workloads_workload.location
import data.terraform.helpers
import data.terraform.gcp.security.assured_workloads.google_assured_workloads_workload.vars

# Policy: location
# Description: Ensures the workload is deployed in an approved Australian region.
# Resource: google_assured_workloads_workload

conditions := [
    [
    {"situation_description": "Workload is not deployed in an approved Australian region",
    "remedies": [
        "Set location to an approved AU region such as australia-southeast1 or australia-southeast2"
    ]},
    {
        "condition": "Check location is set to an approved AU region",
        "attribute_path": ["location"],
        "values": ["australia-southeast1", "australia-southeast2"],
        "policy_type": "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details