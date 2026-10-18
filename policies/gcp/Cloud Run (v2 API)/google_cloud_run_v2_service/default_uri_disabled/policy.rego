package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.default_uri_disabled
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.vars

conditions := [
    [
        {
            "situation_description": "Default run.app URI is not disabled, exposing the service through an always-public endpoint.",
            "remedies": ["Set default_uri_disabled to true to remove the public run.app entry point and force access through controlled ingress."]
        },
        {
            "condition": "default_uri_disabled must be true",
            "attribute_path": ["default_uri_disabled"],
            "values": [false],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details