package terraform.gcp.security.cloud_spanner.google_spanner_database.enable_drop_protection
import data.terraform.helpers
import data.terraform.gcp.security.cloud_spanner.google_spanner_database.vars

conditions := [
    [
        {"situation_description" : "Check for enable_drop_protection set to true",
         "remedies": ["Set enable_drop_protection to true"]},
        {
            "condition": "Check enable_drop_protection is enabled",
            "attribute_path": ["enable_drop_protection"],
            "values" : [true],
            "policy_type" : "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
