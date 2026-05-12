package terraform.gcp.security.google_data_catalog.google_data_catalog_tag_template_iam_member.tag_template
import data.terraform.helpers
import data.terraform.gcp.security.google_data_catalog.google_data_catalog_tag_template_iam_member.vars

conditions := [
    [
    {"situation_description" : "IAM member is attached to an unapproved Data Catalog tag template.",
    "remedies":["Attach IAM only to approved Data Catalog tag templates."]},
    {
        "condition": "Tag Template must be in the approved list.",
        "attribute_path" : ["tag_template"],
        "values" : ["approved_template"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
