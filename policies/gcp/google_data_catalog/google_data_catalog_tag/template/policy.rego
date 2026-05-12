package terraform.gcp.security.google_data_catalog.google_data_catalog_tag.template
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_tag.vars

conditions := [
    [
    {"situation_description" : "Data Catalog tag uses an unapproved tag template.",
    "remedies":["Use an approved tag template for metadata classification."]},
    {
        "condition": "Tag template must be in the approved list.",
        "attribute_path" : ["template"],
        "values" : ["approved_tag_template"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
