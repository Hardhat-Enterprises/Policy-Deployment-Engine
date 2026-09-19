package terraform.gcp.security.google_data_catalog.google_data_catalog_tag_template.force_delete
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_tag_template.vars

conditions := [
    [
    {"situation_description" : "Data Catalog tag template allows force delete.",
    "remedies":["Set force_delete to false to prevent accidental metadata loss."]},
    {
        "condition": "Force delete must not be enabled.",
        "attribute_path" : ["force_delete"],
        "values" : [true],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
