package terraform.gcp.security.cloud_workstations.google_workstations_workstation_config_iam_binding.member

import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation_config_iam_binding.vars

conditions := [
    [
        {
            "situation_description": "grants access to broad IAM principals",
            "remedies": ["remove allUsers and allAuthenticatedUsers from member"]
        },
        {
            "condition": "c1 : check iam_member does not allow public access",
            "attribute_path": ["members"],
            "values": ["allUsers", "allAuthenticatedUsers"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details