package terraform.gcp.security.compute_engine.google_compute_router_nat.enable_endpoint_independent_mapping  
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_router_nat.vars

conditions := [
    [
    {"situation_description" : "NAT is using endpoint-independent mapping which reuses the same external IP port mapping for all destinations, risking attacks using return traffic based on existing mapping",
    "remedies":[ "Set enable_endpoint_independent_mapping to false to disable the NAT reuse of the same external IP ports for mapping destinations"]},
    {
        "condition": "enable_endpoint_independent_mapping must be set to false",
        "attribute_path" : ["enable_endpoint_independent_mapping"],
        "values" : [false], 
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details