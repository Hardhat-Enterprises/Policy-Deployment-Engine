package terraform.gcp.security.cloud_stackdriver_logging.google_logging_folder_settings.storage_location

import data.terraform.helpers
import data.terraform.gcp.security.cloud_stackdriver_logging.google_logging_folder_settings.vars

conditions := [
    [
        {
            "situation_description": "Folder logging settings do not restrict log storage to an approved region, risking data residency violations",
            "remedies": [
                "Set storage_location to an approved region",
                "Approved regions: australia-southeast1, australia-southeast2"
            ]
        },
        {
            "condition": "Folder logging storage_location must be an approved region",
            "attribute_path": ["storage_location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details