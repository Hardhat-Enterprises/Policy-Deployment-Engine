package terraform.gcp.security.cloud_storage_control.google_storage_control_folder_intelligence_config.filter_included_cloud_storage_locations_locations
import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_control.google_storage_control_folder_intelligence_config.vars

conditions := [
    [
        {
            "situation_description": "Storage Intelligence is configured to monitor buckets in locations outside of approved regions",
            "remedies": [

                "Ensure included_cloud_storage_locations only contains approved regions",
                "Remove any locations outside of the approved regions list to comply with data sovereignty requirements"
            ]
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
