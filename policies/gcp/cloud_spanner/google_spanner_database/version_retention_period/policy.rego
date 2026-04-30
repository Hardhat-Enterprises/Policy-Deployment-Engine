package terraform.gcp.security.cloud_spanner.google_spanner_database.version_retention_period
import data.terraform.helpers
import data.terraform.gcp.security.cloud_spanner.google_spanner_database.vars

conditions := [
    [
        {"situation_description" : "Check for valid version_retention_period set to 7 days or more",
         "remedies": ["Set version_retention_period to at least '7d'"]},
        {
            "condition": "Check version_retention_period is not empty or too short",
            "attribute_path": ["version_retention_period"],
            "values" : ["7d", "14d", "30d"],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
