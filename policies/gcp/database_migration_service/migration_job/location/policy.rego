package terraform.gcp.security.database_migration_service.migration_job.location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.database_migration_service.migration_job.vars

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

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details