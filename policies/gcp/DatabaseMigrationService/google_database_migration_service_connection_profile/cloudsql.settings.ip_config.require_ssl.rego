package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.cloudsql_settings_ip_config_require_ssl
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

conditions := [
    [
    {
        "situation_description" : "CloudSQL profiles must enforce SSL for all IP connections.",
        "remedies":[ "Set cloudsql.settings.ip_config.require_ssl = true."]
    },
    {
        "condition": "SSL required for IP connections",
        "attribute_path" : ["cloudsql",0,"settings",0,"ip_config",0,"require_ssl"],
        "values" : [true],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
