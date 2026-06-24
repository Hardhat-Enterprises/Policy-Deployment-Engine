package terraform.gcp.security.google_data_catalog.google_data_catalog_entry_group.region
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_entry_group.vars

conditions := [
    [
    {"situation_description" : "Data Catalog entry group is created in an unapproved region.",
    "remedies":[ "Use an approved region for the Data Catalog entry group."]},
    {
        "condition": "Region must be in the approved list.",
        "attribute_path" : ["region"],
        "values" : ["australia-southeast1", "australia-southeast2"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
