package terraform.gcp.security.google_data_catalog.google_data_catalog_entry_group_iam_member.member
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_entry_group_iam_member.vars

conditions := [
    [
    {"situation_description" : "Data Catalog entry group IAM member allows public or unapproved access.",
    "remedies":["Remove public members and use approved users, groups, or service accounts only."]},
    {
        "condition": "IAM member must not be public or unapproved.",
        "attribute_path" : ["member"],
        "values" : ["allUsers", "allAuthenticatedUsers"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
