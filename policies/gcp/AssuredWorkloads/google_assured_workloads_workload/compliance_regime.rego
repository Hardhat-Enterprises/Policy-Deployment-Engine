package terraform.gcp.security.assured_workloads.google_assured_workloads_workload.compliance_regime
import data.terraform.helpers
import data.terraform.gcp.security.assured_workloads.google_assured_workloads_workload.vars

# Policy: compliance_regime
# Description: Ensures that the Assured Workloads workload uses an approved compliance regime.
# Approved regimes enforce regulatory requirements such as FedRAMP, IL4, IL5, and ITAR.
# Resource: google_assured_workloads_workload

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
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details