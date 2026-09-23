package terraform.gcp.security.compute_engine.google_compute_router_nat.region  
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_router_nat.vars

conditions := [
    [
    {"situation_description" : "Router NAT is configured to a region outside of the allowed Australian regions",
    "remedies":[ "Set region to the allowed Australian regions of australia-southeast1 or australia-southeast2"]},
    {
        "condition": "Region must be set to an allowed Australian region",
        "attribute_path" : ["region"], 
        "values" : ["australia-southeast1", "australia-southeast2"], 
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details