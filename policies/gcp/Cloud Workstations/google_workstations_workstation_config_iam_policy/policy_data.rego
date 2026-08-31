package terraform.gcp.security.cloud_workstations.google_workstations_workstation_config_iam_policy.policy_data

import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation_config_iam_policy.vars

# Merged policy for `policy_data` — 2 independent scenarios.
# policy_lint reports hard-coded-value on the address inside the JSON below, and
# the finding stands. policy_data is compared as a whole rendered IAM policy
# document; a pattern target is used as a regex, and a JSON document's { [ ] "
# characters are regex metacharacters, while roles/... contains a "/" that the
# "*" wildcard ([^/]+) cannot cross. The address is part of the document being
# matched, so a wildcard cannot replace it without the match failing.
conditions := [
[
    {"situation_description" : "policy_data grants access to broad IAM principals ",
    "remedies": ["remove allUsers and allAuthenticatedUsers from policy_data"]
    
    },
    {
        "condition": "c1 : check policy_data does not allow public access",
    
        "attribute_path" :["policy_data"],
        "values" : [
                "{\"bindings\":[{\"members\":[\"allUsers\"],\"role\":\"roles/viewer\"}]}",
                "{\"bindings\":[{\"members\":[\"allAuthenticatedUsers\"],\"role\":\"roles/viewer\"}]}"
            ],
        "policy_type" : "blacklist" 
    }
    ],
[
    {"situation_description" : "policy_data grants access to broad IAM roles ",
    "remedies": ["remove roles/owner and roles/editor from IAM policy "]
    
    },
    {
        "condition": "c1 : check iam_policy does not include risky roles",
    
        "attribute_path" :["policy_data"],
        "values" : [
                "{\"bindings\":[{\"members\":[\"user:jane@example.com\"],\"role\":\"roles/owner\"}]}",
                "{\"bindings\":[{\"members\":[\"user:jane@example.com\"],\"role\":\"roles/editor\"}]}"
            ],
        "policy_type" : "blacklist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
