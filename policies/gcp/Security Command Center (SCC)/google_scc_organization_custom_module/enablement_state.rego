package terraform.gcp.security.scc.google_scc_organization_custom_module.enablement_state
import data.terraform.helpers
import data.terraform.gcp.security.scc.google_scc_organization_custom_module.vars

conditions := [
    [
        {   "situation_description" : "enablement_state must be ENABLE",
            "remedies":[ "enablement_state in organization custom module should be ENABLED"]
        },
        {
            "condition": "Check if the resource is in a specific state",
            "attribute_path" : ["enablement_state"],
            "values" : ["ENABLED"], 
            "policy_type" : "whitelist" 
        }
    ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
