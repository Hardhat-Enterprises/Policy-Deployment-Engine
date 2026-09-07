package terraform.gcp.security.compute_engine.google_compute_region_target_tcp_proxy.proxy_header

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_target_tcp_proxy.vars

conditions := [
    [
    {"situation_description" : "proxy_header is set to NONE, dropping client-identifying information",
    "remedies":[ "Set proxy_header to PROXY_V1 to preserve client information for backend access decisions and audit traceability"]},
    {
        "condition": "Test if proxy_header is not PROXY_V1",
        "attribute_path" : ["proxy_header"],
        "values" : ["PROXY_V1"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
