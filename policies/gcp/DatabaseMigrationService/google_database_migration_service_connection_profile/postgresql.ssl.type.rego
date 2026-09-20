package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.postgresql_ssl_type
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

conditions := [
    [
    {
        "situation_description" : "SSL must be enabled for postgresql connections.",
        "remedies":[ "Set ssl.type to SERVER_ONLY, SERVER_CLIENT, or REQUIRED."]
    },
    {
        "condition": "Set ssl.type to SERVER_ONLY, SERVER_CLIENT, or REQUIRED.",
        "attribute_path" : ["postgresql",0,"ssl",0,"type"],
        "values" : ["SERVER_ONLY","SERVER_CLIENT","REQUIRED"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
