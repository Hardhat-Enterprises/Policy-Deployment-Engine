package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.cloudsql_settings_ip_config_authorized_networks_value
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

conditions := [
    [
    {
        "situation_description" : "CloudSQL authorized networks must not allow external connections.",
        "remedies":[ "Remove all entries in cloudsql.settings.ip_config.authorized_networks."]
    },
    {
        "condition": "authorized_networks must be empty",
        "attribute_path" : ["cloudsql", 0, "settings", 0, "ip_config", 0, "authorized_networks", 0, "value"],
        "values" : [null],    # allow empty array only
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details