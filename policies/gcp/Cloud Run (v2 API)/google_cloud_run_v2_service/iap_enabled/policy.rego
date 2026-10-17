package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.iap_enabled
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.vars

conditions := [
    [
        {
            "situation_description": "Identity-Aware Proxy is not enabled, removing an access-control layer that enforces authenticated and authorized access at the application edge.",
            "remedies": ["Set iap_enabled to true to enforce IAP authentication in front of the Cloud Run service."]
        },
        {
            "condition": "iap_enabled must be true",
            "attribute_path": ["iap_enabled"],
            "values": [false, null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details