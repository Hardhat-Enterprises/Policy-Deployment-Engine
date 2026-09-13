package terraform.gcp.security.google_data_catalog.google_data_catalog_entry_group_iam_binding.members
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_entry_group_iam_binding.vars

conditions := [
    [
    {"situation_description" : "Data Catalog entry group IAM binding contains public or unapproved members.",
    "remedies":["Remove public members and use approved users, groups, or service accounts only."]},
    {
        "condition": "IAM members must not include public or unapproved principals.",
        "attribute_path" : ["members"],
        "values" : ["allUsers", "allAuthenticatedUsers"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
