package terraform.gcp.security.workflows.google_workflows_workflow.crypto_key_name

import data.terraform.helpers
import data.terraform.gcp.security.workflows.google_workflows_workflow.vars

conditions := [
    [
        {
            "situation_description": "Crypto Key Name is not implemented",
            "remedies": ["Crypto Key Name should be configured and implemented"]
        },
        {
            "condition": "Checks if Crypto key is being used",
            "attribute_path": ["crypto_key_name"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Crypto Key Name is not configured correctly",
            "remedies": ["Crypto Key Name should be configured correctly with the location set to a region from Australia"]
        },
        {
            "condition": "Checks that crypto key be formatted correctly with location set to australia",
            "attribute_path": ["crypto_key_name"],
            "values": ["locations/*", [["australia-southeast1", "australia-southeast2"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
