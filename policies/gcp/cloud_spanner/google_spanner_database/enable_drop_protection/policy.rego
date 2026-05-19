package terraform.gcp.security.cloud_spanner.google_spanner_database.enable_drop_protection

import data.terraform.gcp.security.cloud_spanner.google_spanner_database.vars
import data.terraform.helpers

conditions := [[
    {
        "situation_description": "Cloud Spanner database does not have enable_drop_protection enabled.",
        "remedies": [
            "Set enable_drop_protection = true on the database."
        ],
    },
    {
        "condition": "enable_drop_protection must be true",
        "attribute_path": ["enable_drop_protection"],
        "values": [true],
        "policy_type": "whitelist",
    },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

deny contains {
    "message": message,
    "details": details,
} if {
    input.planned_values.root_module.resources[_].type == "google_spanner_database"
    not helpers.evaluate(conditions, input.planned_values.root_module.resources[_].values)
}
