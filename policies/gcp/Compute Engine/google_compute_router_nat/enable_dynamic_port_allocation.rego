package terraform.gcp.security.compute_engine.google_compute_router_nat.enable_dynamic_port_allocation 
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_router_nat.vars

conditions := [
    [
    {"situation_description" : "NAT is using static port allocation rather than dynamic allocation, risking port exhaustion",
    "remedies":[ "Set enable_dynamic_port_allocation to true to enable NAT dynamic port allocation"]},
    {
        "condition": "enable_dynamic_port_allocation must be set to true",
        "attribute_path" : ["enable_dynamic_port_allocation"],
        "values" : [true], 
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details