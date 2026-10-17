package terraform.gcp.security.database_migration_service.google_database_migration_service_migration_job.location
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.google_database_migration_service_migration_job.vars

conditions := [
    [
    {"situation_description" : "Prevent terraform from using location outside Australia",
    "remedies":[ "Use regions in Australia"]},
    {
        "condition": "Use regions in Australia",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1", "australia-southeast2"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details