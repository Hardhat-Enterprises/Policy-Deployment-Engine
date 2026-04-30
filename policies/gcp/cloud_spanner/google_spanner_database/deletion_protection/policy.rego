package terraform.gcp.security.cloud_spanner.google_spanner_database.deletion_protection
import data.terraform.helpers
import data.terraform.gcp.security.cloud_spanner.google_spanner_database.vars

conditions := [
    [
        {"situation_description" : "Check for valid deletion_protection",
         "remedies": ["Set deletion_protection to true"]},
        {
            "condition": "Check for valid deletion_protection",
            "attribute_path": ["deletion_protection"],
            "values" : [true],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
