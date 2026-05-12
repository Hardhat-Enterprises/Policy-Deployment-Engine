package terraform.gcp.security.google_data_catalog.google_data_catalog_entry_group_iam_binding.entry_group
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_entry_group_iam_binding.vars

conditions := [
    [
    {"situation_description" : "IAM binding is attached to an unapproved Data Catalog entry group.",
    "remedies":["Attach IAM only to approved Data Catalog entry groups."]},
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
