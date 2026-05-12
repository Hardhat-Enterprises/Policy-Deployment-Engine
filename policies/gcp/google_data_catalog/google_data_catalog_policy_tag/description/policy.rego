package terraform.gcp.security.google_data_catalog.google_data_catalog_policy_tag.description
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_policy_tag.vars

conditions := [
    [
    {"situation_description" : "Data Catalog policy tag does not have a description.",
    "remedies":["Add a clear description to explain the meaning of this policy tag."]},
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
