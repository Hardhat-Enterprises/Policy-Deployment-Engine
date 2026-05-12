package terraform.gcp.security.google_data_catalog.google_data_catalog_entry.user_specified_system
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_entry.vars

conditions := [
    [
    {"situation_description" : "Data Catalog entry uses an unapproved user specified system.",
    "remedies":["Use only approved source systems for custom Data Catalog entries."]},
    {
        "condition": "User specified system must be in the approved list.",
        "attribute_path" : ["user_specified_system"],
        "values" : ["approved_system"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
