package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.restricted_ingress

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.vars

conditions := [
    [
    {"situation_description": "Cloud Run service allows public ingress",
    "remedies": ["Set ingress to INTERNAL_ONLY or INTERNAL_LOAD_BALANCER"]},
    {
        "condition": "Ingress is set to allow all traffic",
        "attribute_path": ["ingress"],
        "values": ["INGRESS_TRAFFIC_ALL"],
        "policy_type": "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details