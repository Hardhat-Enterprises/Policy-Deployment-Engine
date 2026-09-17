package terraform.gcp.security.compute_engine.google_compute_router_nat.log_config.filter 
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_router_nat.vars

conditions := [
    [
    {"situation_description" : "NAT logging is filtered to a group of connections, risking reduced visibility into NAT activity",
    "remedies":[ "Set log_confit.filter to ALL to captures logs for all NAT activity"]},
    {
        "condition": "log_config.filter must be set to ALL",
        "attribute_path" : ["log_config", 0, "filter"],
        "values" : ["ALL"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details