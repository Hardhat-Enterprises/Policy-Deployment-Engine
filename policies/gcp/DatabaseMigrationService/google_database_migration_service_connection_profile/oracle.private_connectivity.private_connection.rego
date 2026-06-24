package terraform.gcp.security.database_migration_service.connection_profile.oracle_private_connectivity_private_connection
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.connection_profile.vars

conditions := [
    [
    {
        "situation_description" : "Oracle profiles must use private connectivity.",
        "remedies":[ "Set private_connectivity.private_connection to valid URI."]
    },
    {
        "condition": "oracle private connectivity required",
        "attribute_path" : ["oracle",0,"private_connectivity",0,"private_connection"],
        "values" : ["URI"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
