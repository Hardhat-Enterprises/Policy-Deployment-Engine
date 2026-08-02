package terraform.gcp.security.compute_engine.google_compute_region_target_tcp_proxy.backend_service

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_target_tcp_proxy.vars

conditions := [
    [
    {"situation_description" : "backend_service references an untrusted project",
    "remedies":[ "Only route traffic to backend services in approved/trusted projects"]},
    {
        "condition": "Test if backend_service points to the untrusted-project backend",
        "attribute_path" : ["backend_service"],
        "values" : ["projects/untrusted-project/regions/us-central1/backendServices/untrusted-backend"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
