package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.cloudsql_settings_ip_config_private_network
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

conditions := [
    [
    {
        "situation_description" : "CloudSQL profiles must use private networking for connectivity.",
        "remedies":[ "Set cloudsql.settings.ip_config.private_network to a valid VPC URI."]
    },
    {
        "condition": "Private network required",
        "attribute_path" : ["cloudsql",0,"settings",0,"ip_config",0,"private_network"],
        "values" : ["projects/myProject/global/networks/default"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
