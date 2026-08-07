package terraform.gcp.security.compute_engine.google_compute_global_network_endpoint.ip_address

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_global_network_endpoint.vars

conditions := [
    [
    {"situation_description" : "ip_address references an untrusted external IP",
    "remedies":[ "Only route traffic to approved external IP addresses"]},
    {
        "condition": "Test if ip_address points to the untrusted IP",
        "attribute_path" : ["ip_address"],
        "values" : ["198.51.100.20"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
