package terraform.gcp.security.compute_engine.google_compute_global_network_endpoint.fqdn

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_global_network_endpoint.vars

conditions := [
    [
    {"situation_description" : "fqdn references an untrusted external domain",
    "remedies":[ "Only route traffic to approved external domains"]},
    {
        "condition": "Test if fqdn points to the untrusted domain",
        "attribute_path" : ["fqdn"],
        "values" : ["untrusted.example.com"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
