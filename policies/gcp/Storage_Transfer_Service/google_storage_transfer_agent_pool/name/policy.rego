package terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_agent_pool.name

import data.terraform.helpers
import data.terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_agent_pool.vars

conditions := [
    [
        {
            "situation_description": "Storage Transfer agent pool name does not follow the approved agent pool naming format.",
            "remedies": [
                "Set name using the format projects/{projectId}/agentPools/{agentPoolId}.",
                "Use a lowercase agent pool ID.",
                "Do not start the agent pool ID with goog."
            ]
        },
        {
            "condition": "Storage Transfer agent pool name must follow the approved naming pattern.",
            "attribute_path": ["name"],
            "values": ["projects/*/agentPools/*", [["projects"], [], ["agentPools"], [["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details