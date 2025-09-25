package terraform.gcp.security.database_migration_service.migration_job.type
import data.terraform.gcp.helpers
import data.terraform.gcp.security.database_migration_service.migration_job.vars

conditions := [
    [
    {"situation_description" : "Migration job must be of type 'ONE_TIME'.",
    "remedies":[ "Set the type attribute to 'ONE_TIME' to enable replication only when needed and not 'CONTINUOUS' to avoid risks."]},
    {
        "condition": "type must be 'ONE_TIME'",
        "attribute_path" : ["type"],
        "values" : ["ONE_TIME"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details