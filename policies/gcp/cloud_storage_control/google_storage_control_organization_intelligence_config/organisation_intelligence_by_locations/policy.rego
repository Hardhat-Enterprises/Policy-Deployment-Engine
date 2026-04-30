package terraform.gcp.security.cloud_storage_control.google_storage_control_organization_intelligence_config.organisation_intelligence_by_locations
import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_control.google_storage_control_organization_intelligence_config.vars

conditions := [
    [
        {
            "situation_description": "Storage Intelligence is monitoring buckets in locations outside of approved regions at the organization level",
            "remedies": ["Remove any locations outside of these approved regions list to comply with data sovereignty requirements"]
        },
        {
            "condition": "Check if included cloud storage locations are within approved regions",
            "attribute_path": ["filter", 0, "included_cloud_storage_locations", 0, "locations"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details