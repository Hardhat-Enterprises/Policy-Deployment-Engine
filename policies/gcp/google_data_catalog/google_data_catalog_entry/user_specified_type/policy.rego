package terraform.gcp.security.google_data_catalog.google_data_catalog_entry.user_specified_type
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_entry.vars

conditions := [
    [
    {"situation_description" : "Data Catalog entry uses an unapproved user specified type.",
    "remedies":["Use an approved custom entry type defined by the project."]},
    {
        "condition": "User specified type must be in the approved list.",
        "attribute_path" : ["user_specified_type"],
        "values" : ["approved_custom_type"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
