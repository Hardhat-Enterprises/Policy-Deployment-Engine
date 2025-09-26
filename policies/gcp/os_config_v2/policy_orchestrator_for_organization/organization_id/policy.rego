package terraform.gcp.security.os_config_v2.policy_orchestrator_for_organization.organization_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config_v2.policy_orchestrator_for_organization.vars

conditions := [
    [
    {"situation_description" : "Organization ID does not follow the required pattern.",
    "remedies" : [" Ensure the Organization ID starts with 'Hardhat-PDE-' followed by the cloud provider and other identifiers."],},
    {
        "condition": " Organization ID must start with 'Hardhat-PDE-' followed by the cloud provider and other identifiers.",
        "attribute_path" : ["organization_id"], 
        "values" : ["Hardhat-PDE-*",[["gcp", "aws", "azure"]]],
        "policy_type" : "pattern whitelist" 
    },
    {
        "condition": " Organization ID must only contain lowercase letters and digits after example: 'Hardhat-PDE-aws-a1'.",
        "attribute_path" : ["organization_id"], 
        "values" : ["Hardhat-PDE-*-**",[["gcp","aws","azure"], ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"],
        ["0","1","2","3","4","5","6","7","8","9"]]],
        "policy_type" : "pattern whitelist" 
    },
    ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
