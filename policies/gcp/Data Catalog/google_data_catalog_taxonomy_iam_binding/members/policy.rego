package terraform.gcp.security.google_data_catalog.google_data_catalog_taxonomy_iam_binding.members
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_taxonomy_iam_binding.vars

conditions := [
    [
    {"situation_description" : "Data Catalog taxonomy IAM binding contains public members.",
    "remedies":["Remove public members and use approved users, groups, or service accounts only."]},
    {
        "condition": "IAM members must not include public principals.",
        "attribute_path" : ["members"],
        "values" : ["allUsers", "allAuthenticatedUsers"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
