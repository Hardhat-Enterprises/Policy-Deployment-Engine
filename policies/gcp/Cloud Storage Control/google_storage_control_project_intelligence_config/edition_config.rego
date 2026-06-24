package terraform.gcp.security.cloud_storage_control.google_storage_control_project_intelligence_config.edition_config
import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_control.google_storage_control_project_intelligence_config.vars

conditions := [
    [
        {
            "situation_description": "Storage Intelligence is disabled at the project level",
            "remedies": [
                
                "Set edition_config to STANDARD to enable full Storage Intelligence for this project",
                "Alternatively set to INHERIT to defer to the parent folder or organization configuration",
                "Do not set edition_config to DISABLED as this removes security monitoring coverage for all buckets in this project"
            ]
        },
        {
            "condition": "Check if edition_config is set to DISABLED",
            "attribute_path": ["edition_config"],
            "values": ["DISABLED"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
