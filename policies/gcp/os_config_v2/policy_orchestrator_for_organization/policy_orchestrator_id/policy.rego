package terraform.gcp.security.os_config_v2.policy_orchestrator_for_organization.policy_orchestrator_id
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config_v2.policy_orchestrator_for_organization.vars

conditions := [
    [
    {"situation_description" : "Policy Orchestrator ID does not follow the required pattern.",
    "remedies" : ["Should follow the pattern vendor-cloud-environment-unique_id (e.g., google-gcp-production-a1)."]},
    {
        "condition": "The company uses only three cloud vendors: Google, Amazon, and Microsoft.",
        "attribute_path" : ["policy_orchestrator_id"], 
        "values" : ["*",[["google", "amazon", "microsoft"]]],
        "policy_type" : "pattern whitelist" 
    },
    {
        "condition": "Please match the cloud providers to their respective cloud platforms.",
        "attribute_path" : ["policy_orchestrator_id"], 
        "values" : ["*-*",[["google", "amazon", "microsoft"],["gcp","aws","azure"]]],
        "policy_type" : "pattern whitelist" 
    },
    {
        "condition": "Only 'production' and 'deployment' environments are allowed for Policy Orchestrator IDs.",
        "attribute_path" : ["policy_orchestrator_id"], 
        "values" : ["*-*-*",[["google", "amazon", "microsoft"],["gcp","aws","azure"],["production", "deployment"]]],
        "policy_type" : "pattern whitelist" 
    },
    {
        "condition": "The Policy Orchestrator ID must include a unique identifier.",
        "attribute_path" : ["policy_orchestrator_id"], 
        "values" : ["*-*-*-**",[["google", "amazon", "microsoft"],["gcp","aws","azure"], ["production", "deployment"],
        ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"],["0","1","2","3","4","5","6","7","8","9"]]],
        "policy_type" : "pattern whitelist" 
    }
    ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details