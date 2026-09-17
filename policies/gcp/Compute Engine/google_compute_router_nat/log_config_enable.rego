package terraform.gcp.security.compute_engine.google_compute_router_nat.log_config_enable 
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_router_nat.vars

conditions := [
    [
    {"situation_description" : "NAT logging is disabled, leaving error events uncaptured for investigation",
    "remedies":[ "Set log_config_enable to true to enable NAT logging"]},
    {
        "condition": "log_config_enable must be set to true",
        "attribute_path" : ["log_config", 0, "enable"],
        "values" : [true],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details