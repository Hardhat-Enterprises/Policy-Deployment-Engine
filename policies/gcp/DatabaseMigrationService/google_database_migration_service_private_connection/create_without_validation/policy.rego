package terraform.gcp.security.database_migration_service.google_database_migration_service_private_connection.create_without_validation
import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.google_database_migration_service_private_connection.vars

conditions := [
    [
    {"situation_description" : "Prevent terraform from skipping validations",
    "remedies":[ "disable/false create_without_validation"]},
    {
        "condition": "disable create_without_validation",
        "attribute_path" : ["create_without_validation"],
        "values" : [false],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details