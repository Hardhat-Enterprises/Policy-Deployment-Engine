package terraform.gcp.security.database_migration_service.google_database_migration_service_migration_job.dump_type
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.google_database_migration_service_migration_job.vars

conditions := [
    [
    {"situation_description" : "Migration job must use 'LOGICAL' dump_type which is more secure",
    "remedies":[ "Set dump_type to 'LOGICAL' for better compatibility and safer migration."]},
    {
        "condition": "dump_type should be 'LOGICAL'",
        "attribute_path" : ["dump_type"],
        "values" : ["LOGICAL"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details