package terraform.gcp.security.cloud_storage_control.google_storage_control_organization_intelligence_config.enable_organization_intelligence
import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage_control.google_storage_control_organization_intelligence_config.vars

conditions := [
    [
        {
            "situation_description": "Storage Intelligence is disabled at Organization level",
            "remedies": ["Do not set edition_config to DISABLED as this removes security monitoring coverage,valid settings INHERIT,STANDARD or TRIAL"]
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