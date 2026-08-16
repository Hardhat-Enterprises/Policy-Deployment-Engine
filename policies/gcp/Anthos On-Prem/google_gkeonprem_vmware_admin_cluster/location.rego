package terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_admin_cluster.location

import data.terraform.helpers
import data.terraform.gcp.security.anthos_on_prem.google_gkeonprem_vmware_admin_cluster.vars

conditions := [
    [
        {
            "situation_description": "GKE On-Prem VMware Admin Cluster location is not set to an approved Australian region which may violate data residency and compliance requirements",
            "remedies": [
                "Set location to an approved Australian region",
                "Approved regions are: australia-southeast1, australia-southeast2"
            ]
        },
        {
            "condition": "Check if location is in the approved Australian whitelist",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details