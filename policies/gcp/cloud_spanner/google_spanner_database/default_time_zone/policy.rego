package terraform.gcp.security.cloud_spanner.google_spanner_database.default_time_zone
import data.terraform.helpers
import data.terraform.gcp.security.cloud_spanner.google_spanner_database.vars

conditions := [
    [
        {"situation_description" : "Check for a configured default_time_zone",
         "remedies": ["Set default_time_zone to a valid timezone string"]},
        {
            "condition": "Check default_time_zone is configured",
            "attribute_path": ["default_time_zone"],
            "values" : [null, ""],
            "policy_type" : "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
