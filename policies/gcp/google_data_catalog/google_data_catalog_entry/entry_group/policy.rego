package terraform.gcp.security.google_data_catalog.google_data_catalog_entry.entry_group
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_entry.vars

conditions := [
    [
    {"situation_description" : "Data Catalog entry is not assigned to an approved entry group.",
    "remedies":["Use an approved Data Catalog entry group for this entry."]},
    {
        "condition": "Entry group must be in the approved list.",
        "attribute_path" : ["entry_group"],
        "values" : ["approved_entry_group"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
