package terraform.gcp.security.google_data_catalog.google_data_catalog_tag.parent
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_tag.vars

conditions := [
    [
    {"situation_description" : "Data Catalog tag is attached to an unapproved parent resource.",
    "remedies":["Attach the tag only to approved Data Catalog resources."]},
    {
        "condition": "Parent resource must be in the approved list.",
        "attribute_path" : ["parent"],
        "values" : ["approved_data_catalog_entry"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
