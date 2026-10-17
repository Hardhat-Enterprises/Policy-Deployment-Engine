package terraform.gcp.security.google_data_catalog.google_data_catalog_tag_template_iam_member.member
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_tag_template_iam_member.vars

conditions := [
    [
    {"situation_description" : "Data Catalog tag template IAM member allows public access.",
    "remedies":["Remove public members and use approved users, groups, or service accounts only."]},
    {
        "condition": "IAM member must not be a public principal.",
        "attribute_path" : ["member"],
        "values" : ["allUsers", "allAuthenticatedUsers"],
        "policy_type" : "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
