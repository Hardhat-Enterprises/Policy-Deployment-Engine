package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.cloudsql_settings_cmek_key_name
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

conditions := [
    [
    {
        "situation_description" : "CloudSQL connection profiles must use CMEK encryption.",
        "remedies":[ "Set cmek_key_name in cloudsql.settings."]
    },
    {
        "condition": "CMEK must be configured",
        "attribute_path" : ["cloudsql",0,"settings",0,"cmek_key_name"],
        "values" : ["abcd"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
