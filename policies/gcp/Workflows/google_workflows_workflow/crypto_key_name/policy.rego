package terraform.gcp.security.workflows.google_workflows_workflow.crypto_key_name

import data.terraform.helpers
import data.terraform.gcp.security.workflows.google_workflows_workflow.vars

conditions := [
    [
        {
            "situation_description": "Crypto Key Name is not implemented",
            "remedies": ["Crypto Key Name should be configured and implemented in the format of projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey}"]
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
            "situation_description": "Crypto Key Name is not configured with an allowed location",
            "remedies": ["Crypto Key Name should be configured with the location set to a region from Australia"]
        },
        {
            "condition": "Checks that crypto key configured with location set to australia",
            "attribute_path": ["crypto_key_name"],
            "values": ["locations/*", [["australia-southeast1", "australia-southeast2"]]],
            "policy_type": "pattern whitelist"
        }
    ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details


