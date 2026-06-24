package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.allowed_regions
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.vars

conditions := [
    [
    {"situation_description": "Cloud Run multi-region service must only use approved Australian regions to ensure data residency compliance.",
    "remedies": ["Change regions to australia-southeast1 or australia-southeast2 only"]},
    {
        "condition": "Multi-region setting includes disallowed region",
        "attribute_path": ["multi_region_settings", 0, "regions"],
        "values": ["australia-southeast1", "australia-southeast2"],
        "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details