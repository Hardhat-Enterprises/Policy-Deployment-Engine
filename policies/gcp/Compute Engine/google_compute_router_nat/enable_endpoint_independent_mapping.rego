package terraform.gcp.security.compute_engine.google_compute_router_nat.enable_endpoint_independent_mapping  
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_router_nat.vars

conditions := [
    [
    {"situation_description" : "A self documenting message about the conditions within",
    "remedies":[ "Something that fixes the issues in this situation","You can have multiple items in the array"]},
    {
        "condition": "A message about what the condition does",
        "attribute_path" : [enable_endpoint_independent_mapping],
        "values" : ["false"], 
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details