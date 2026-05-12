package terraform.gcp.security.google_data_catalog.google_data_catalog_entry_group.description
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_entry_group.vars

conditions := [
    [
    {"situation_description" : "Data Catalog entry group does not have a description.",
    "remedies":["Add a clear description to explain the purpose of this entry group."]},
    {
        "condition": "Description must not be empty.",
        "attribute_path" : ["description"],
        "values" : ["", null],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
