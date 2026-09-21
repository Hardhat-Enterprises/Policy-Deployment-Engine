package terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.multi_region_settings_regions
import data.terraform.helpers
import data.terraform.gcp.security.cloud_run_v2_api.google_cloud_run_v2_service.vars

conditions := [
    [
        {
            "situation_description": "Multi-region service is replicated to regions outside the approved set, risking data residency or sovereignty violations.",
            "remedies": ["Restrict multi_region_settings.regions to approved Australian regions (e.g. australia-southeast1, australia-southeast2)."]
        },
        {
            "condition": "Regions must match approved Australian locations",
            "attribute_path": ["multi_region_settings",0,"regions"],
            "values": ["australia-southeast1","australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details